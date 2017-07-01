Getting started
===============

### Maven setup

    <dependency>
        <groupId>org.apache.kafka</groupId>
        <artifactId>kafka-clients</artifactId>
        <version>0.10.2.0</version>
    </dependency>
    <dependency>
        <groupId>org.apache.kafka</groupId>
        <artifactId>kafka-streams</artifactId>
        <version>0.10.2.0</version>
    </dependency>

### main()

Setup configuration options

        Properties props = new Properties();
        props.put(StreamsConfig.APPLICATION_ID_CONFIG, "streams-wordcount");
        props.put(StreamsConfig.BOOTSTRAP_SERVERS_CONFIG, "localhost:9092");
        props.put(StreamsConfig.KEY_SERDE_CLASS_CONFIG, Serdes.String().getClass());
        props.put(StreamsConfig.VALUE_SERDE_CLASS_CONFIG, Serdes.String().getClass());
        props.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest");


 Prepare execution topology using TopologyBuilder

        TopologyBuilder builder = new TopologyBuilder();
        builder.addSource("SOURCE", "uber-product-incremental-events");
        builder.addProcessor("PROCESS1", () -> new MyProcessor(), "SOURCE");
        builder.addStateStore(
                Stores.create("Counts").withStringKeys().withLongValues().inMemory().build(),
                "PROCESS1");
        builder.addSink("SINK2", "polaris-index-updates-high", "PROCESS1");

Instantiate and run Kafka streams

        KafkaStreams streams = new KafkaStreams(builder, props);
        streams.start();

Once started, streams will be running in its own treads
`main` thread can do other tasks now, until it is time to stop streams
To stop streams:

        streams.close();

# Streaming API

## Low level

### Processor

Implement `Processor<Key, Value>` interface

    public class MyStreamsTask implements Processor<String, String> {

        @Override public void init(ProcessorContext context) {
        }

        @Override public void process(String eventKey, String eventValue) {
            // Will be called for each input event
        }

        @Override public void punctuate(long timestamp) {
            // Will be called once per batch
        }

        @Override public void close() {
            // close any resources managed by this processor.
            // Note: Do not close any StateStores as these are managed
            // by the library
        }

    };

Define context and kvStore - they will be needed to implement event elementary business logic

    public class ProductIdExtractTask implements Processor<String, String> {
        private ProcessorContext context;
        private KeyValueStore<String, Long> kvStore;

        @Override @SuppressWarnings("unchecked") public void init(ProcessorContext context) {

            // keep the processor context locally because we need it in punctuate() and commit()
            this.context = context;

            // call this processor's punctuate() method every 1000 milliseconds.
            this.context.schedule(1000);

            // retrieve the key-value store named "Counts"
            this.kvStore = (KeyValueStore<String, Long>) context.getStateStore("Counts");
        }

        @Override public void process(String eventKey, String eventValue) {
        }

        @Override public void punctuate(long timestamp) {
        }

        @Override public void close() {
        }

    };


Implement business logic which counts number of words in input stream

    public class ProductIdExtractTask implements Processor<String, String> {
        private ProcessorContext context;
        private KeyValueStore<String, Long> kvStore;

        @Override @SuppressWarnings("unchecked") public void init(ProcessorContext context) {

            // keep the processor context locally because we need it in punctuate() and commit()
            this.context = context;

            // call this processor's punctuate() method every 1000 milliseconds.
            this.context.schedule(1000);

            // retrieve the key-value store named "Counts"
            this.kvStore = (KeyValueStore<String, Long>) context.getStateStore("Counts");
        }

        @Override public void process(String eventKey, String eventValue) {
            for(String word: eventValue.split(" ")) {
                Long oldcount = this.kvStore.get(word);
                if (oldcount == null) {
                    this.kvStore.put(productId, 1L);
                } else {
                    this.kvStore.put(productId, oldcount + 1L);
                }
            }

        }

        @Override public void punctuate(long timestamp) {
            KeyValueIterator<String, Long> iter = this.kvStore.all();

            while (iter.hasNext()) {
                KeyValue<String, Long> entry = iter.next();
                // output results
                context.forward(entry.key, entry.value);
            }

            iter.close();
            // commit the current processing progress
            context.commit();
        }

        @Override public void close() {
            // close any resources managed by this processor.
            // Note: Do not close any StateStores as these are managed
            // by the library
        }

    };

### Topology

*** tbd ***

### Driver

*** tbd ***

### Putting all together

*** tbd ***


## High Level DSL

*** tbd ***

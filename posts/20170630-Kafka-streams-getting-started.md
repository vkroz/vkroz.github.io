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

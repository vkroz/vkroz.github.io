# Metrics 

## Codahale Metrics standalone

Codahale metrics library is part of Dropwizard bundle

        <dependency>
            <groupId>io.dropwizard.metrics</groupId>
            <artifactId>metrics-core</artifactId>
            <version>${metrics.version}</version>
        </dependency>

First: read official documentation [http://metrics.dropwizard.io/3.1.0/getting-started/]

1. Instantiate global registry object
```
    static final MetricRegistry metricsReistry = new MetricRegistry();
``` 
2. Instantiate and register metric instance

One way - to use method 
```
   com.codahale.metrics.Meter requests = metricsRegistry.meter("requests");
```

Another way - instaniate directly and then register with registry 
```
    Meter volumeMeter = new Meter();
    metricsReistry.register("xxx", volumeMeter);
```

3. Create reporter. It will spawn separate thread which will produce report with specified frequency  
```
   ConsoleReporter reporter =
           ConsoleReporter.forRegistry(metricsReistry).convertRatesTo(TimeUnit.SECONDS)
                   .convertDurationsTo(TimeUnit.MILLISECONDS).build();
```

### Few details
Out of the box metrics are:

    Histogram (com.codahale.metrics)
    Counter (com.codahale.metrics)
    Metered (com.codahale.metrics)
        Meter (com.codahale.metrics)
        Timer (com.codahale.metrics)    
    Gauge (com.codahale.metrics)
        JmxAttributeGauge (com.codahale.metrics)
        RatioGauge (com.codahale.metrics)
            FileDescriptorRatioGauge (com.codahale.metrics.jvm)
        CachedGauge (com.codahale.metrics)
        DerivativeGauge (com.codahale.metrics)
    MetricSet (com.codahale.metrics)
        BufferPoolMetricSet (com.codahale.metrics.jvm)
        MetricRegistry (com.codahale.metrics)
        ThreadStatesGaugeSet (com.codahale.metrics.jvm)
            CachedThreadStatesGaugeSet (com.codahale.metrics.jvm)
        ClassLoadingGaugeSet (com.codahale.metrics.jvm)
        MemoryUsageGaugeSet (com.codahale.metrics.jvm)
        GarbageCollectorMetricSet (com.codahale.metrics.jvm)
        JvmAttributeGaugeSet (com.codahale.metrics)
       
`MetricSet` is a special type of metrics is which is actually a metric but container, used to agregate 
multiple individual metrics

Out of the box reporters are:

    CsvReporter (com.codahale.metrics)
    GraphiteReporter (com.codahale.metrics.graphite)
    Slf4jReporter (com.codahale.metrics)
    ConsoleReporter (com.codahale.metrics)




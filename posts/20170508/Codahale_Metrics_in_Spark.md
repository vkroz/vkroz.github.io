# Codahale Metrics in Apache Spark 

## Spark Instrumentation

Apache Spark Streaming uses Codahale Metrics library internally to collect and report instrumentation 
telemetry data. It is accessible via HTTP REST end point: `<spark streaing url>/metrics/json`, e.g. 
`http://localhost:4040/metrics/json/`

With minor effort it is possible to enhance Spark metrics mechanism with application-specific metrics, 
so that they will be visible via the same end-point. 


1. Implement `org.apache.spark.metrics.source.Source` Sacala interface (implementation on Java is fine, see example below)
```
        private[spark] trait Source {
          /** User defined name for this source instance */
          def sourceName: String
          
          /** Returns com.codahale.metrics.MetricRegistry instance containing registered metrics */
          def metricRegistry: MetricRegistry
        }
```        
 
2. Register mertrics source with Spark runtime environment

       SparkEnv.get().metricsSystem().registerSource(source);

    
## Full example

`Source` application-specific implementation 
    
    import org.apache.spark.metrics.source.Source;
    import com.codahale.metrics.MetricRegistry;
    import org.apache.spark.Accumulator;
    import com.codahale.metrics.Gauge;

    public class InstrumentationSource implements Source {
    
        private String         sourceName        = "my.spark.app";
        private MetricRegistry metricsRegistry   = new MetricRegistry();
    
        public void registerAccumulator(final Accumulator<Integer> accumulator, final String name) {
            metricsRegistry.register(MetricRegistry.name(name),    
                new Gauge<Long>() {
                    @Override
                    public Long getValue() {
                        return Long.valueOf(accumulator.value());
                    }
                });
        }
       
        @Override
        public MetricRegistry metricRegistry() {
            return this.metricsRegistry;
        }
    
        @Override
        public String sourceName() {
            return this.sourceName;
        }
    
    }


Initialize instrumentation in the Spark driver code
    
    private void prepareInstrumentation(JavaSparkContext sc) {
        InstrumentationSource source = new InstrumentationSource();

        Accumulator<Integer> accumulator = sc.accumulator(0, "my_accumulator");
        source.registerAccumulator(accumulator, name);

        SparkEnv.get().metricsSystem().registerSource(source);
    }



See also [Accumulators in Apache Spark](/posts/20170508/Accumulators_in_Spark.md)

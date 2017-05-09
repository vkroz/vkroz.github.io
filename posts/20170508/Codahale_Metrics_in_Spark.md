# Codahale Metrics in Apache Spark 

## Spark Instrumentation

Apache Spark Streaming uses Codahale Metrics library internally to collect and report instrumentation 
telemetry data. It is accessible via HTTP REST end point: `<spark streaing url>/metrics/json`, e.g. 
`http://localhost:4040/metrics/json/`

With minor effort it is possible to enhance Spark metrics mechanism with application-specific metrics, 
so that they will be visible via the same end-point. 





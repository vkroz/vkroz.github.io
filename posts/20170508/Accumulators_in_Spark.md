# Accumulators in Apache Spark 

Accumulators are created at driver program by calling Spark context object
 
    LongAccumulator accum1 = javaStreamingContext.sparkContext().sc().longAccumulator();
    LongAccumulator accum2 = javaStreamingContext.sparkContext().sc().longAccumulator();

Then accumulators objects are passed along with other serialized tasks code to distributed executors. 
Task code updates accumulator values
    
    
    JavaPairDStream<String, Integer> wordCounts =
        words.mapToPair(new PairFunction<String, String, Integer>() {
            @Override public Tuple2<String, Integer> call(String s) {
                accum1.add(1);
                return new Tuple2<>(s, 1);
            }
        }).reduceByKey(new Function2<Integer, Integer, Integer>() {
            @Override public Integer call(Integer i1, Integer i2) {
                accum2.add(1);
                return i1 + i2;
            }
        });    

Then Spark sends accumulators back to driver program, merges their values obtained from multuple tasks, 
and here we can use accumulators for whatever purpose (e.g. reporting)

    wordCounts.foreachRDD(new VoidFunction<JavaPairRDD<String, Integer>>() {
        @Override public void call(JavaPairRDD<String, Integer> stringIntegerJavaPairRDD)
                throws Exception {
            System.out.println("# of items in RDD=" + stringIntegerJavaPairRDD.count());
            System.out.println("Map() calls      =" + accum1.value());
            System.out.println("Reduce() calls   =" + accum2.value());
            accum1.reset();
            accum2.reset();
        }
    });

Important moment is that accumulators become accessible to driver code once processing stage is complete. 


See also [Codahale Metrics with Apache Spark](/posts/20170508/Codahale_Metrics_in_Spark.md)

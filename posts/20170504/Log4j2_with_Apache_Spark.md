Logging with LOG4J2 in Spark
-----

`LOG4J` has been very popular logging library in Java world for years. `LOG4J2` is even better. 
In Aug 2015 Log4j development team officially announced end of life for Log4j version 1.* and urged 
to start using `Log4j2`. 

While upgrading from `log4j` to `log4j2` is easy and can be done without changing existing code, 
real-life application have a lot dependencies which still come pre-configured to use old log4j 
and switching to new library is not always easy. 
Here we discuss how to start using `log4j2` on Spark. Spark 2.1 is still using old `slf4j` library and 
though switching is possible, it is not documented and require manual steps on installed Spark system. 

The following steps are required to switch Spark to use `LOG4J2` logger:
   
1. Download `log4j2` jars and unpack to locations accessible by Spark on each Spark node
   
```
wget http://apache.mirrors.lucidnetworks.net/logging/log4j/2.8.2/apache-log4j-2.8.2-bin.tar.gz
tar xzf apache-log4j-2.8.2-bin.tar.gz
cd apache-log4j-2.8.2-bin

mkdir -p /opt/spark/extra_jars
for f in  log4j-1.2-api-2.8.2.jar log4j-api-2.8.2.jar log4j-api-scala_2.11-2.8.2.jar log4j-core-2.8.2.jar log4j-slf4j-impl-2.8.2.jar
do
   cp $f /opt/spark/extra_jars/
done
```

2. Add new jars to SPARK_CLASSPATH variable using Spark configuration script
  
```
cp /opt/spark/conf/spark-env.sh.template /opt/spark/conf/spark-env.sh
vi /opt/spark/conf/spark-env.sh
-----

SPARK_CLASSPATH=/opt/spark/extra_jars/log4j-1.2-api-2.8.2.jar
SPARK_CLASSPATH=/opt/spark/extra_jars/log4j-api-2.8.2.jar:$SPARK_CLASSPATH
SPARK_CLASSPATH=/opt/spark/extra_jars/log4j-api-scala_2.11-2.8.2.jar:$SPARK_CLASSPATH
SPARK_CLASSPATH=/opt/spark/extra_jars/log4j-core-2.8.2.jar:$SPARK_CLASSPATH
SPARK_CLASSPATH=/opt/spark/extra_jars/log4j-slf4j-impl-2.8.2.jar:$SPARK_CLASSPATH
```

3. Remove old log4j jars from standard Spark classpath

```
cd /opt/spark/jars
mv log4j-1.2.17.jar log4j-1.2.17.jar.bak
mv slf4j-log4j12-1.7.16.jar slf4j-log4j12-1.7.16.jar.bak
mv slf4j-log4j12-1.7.16.jar slf4j-log4j12-1.7.16.jar.bak

```

4. Restart Spark services.
 
 That's it! Now Spark uses logs using log4j2 library. 
  
How to configure?  
Just put `log4j2.xml` file into Spark configuration directory (`$SPARK_HOME/conf` by default)




/opt/spark/bin/spark-submit --verbose --master 'local[4]' --name aurora-processor --files /app/spark-jobs/us.gm/search/integration/nrt2/processor/conf/log4j2.xml,/app/spark-jobs/us.gm/search/integration/nrt2/processor/conf/application.conf --conf 'spark.executor.extraJavaOptions=-Dlog4j.configurationFile=/app/spark-jobs/us.gm/search/integration/nrt2/processor/conf/log4j2.xml -Dconfig.file=/app/spark-jobs/us.gm/search/integration/nrt2/processor/conf/application.conf' --conf 'spark.driver.extraJavaOptions=-Dlog4j.configurationFile=/app/spark-jobs/us.gm/search/integration/nrt2/processor/conf/log4j2.xml -Dconfig.file=/app/spark-jobs/us.gm/search/integration/nrt2/processor/conf/application.conf' --class com.walmart.labs.search.nrt2.processor.ProcessorMain /app/spark-jobs/us.gm/search/integration/nrt2/processor/processor.jar

Start Cassandra as daemon

    nohup /app/opt/cassandra/bin/cassandra </dev/null >/dev/null 2>&1 &
    
Start Cassandra in foreground

    /app/opt/cassandra/bin/cassandra -f


### Rename cluster

1. in **CQLSH** use the following command: 

    UPDATE system.local SET cluster_name = '<cluster name>' where key='local';
    e.g.
    UPDATE system.local SET cluster_name = 'polaris.ndc0' where key='local';

2. in **casandra.yaml** make sure that the **cluster_name** is the exact same as what was entered in CQLSH.

3. run: `nodetool flush system` 
(to flush memtable to the commitlog so you do not lose any writes to your cluster, as well as clearing the system cache.)

4. restart cassandra
5. verify in **CQLSH** the **cluster_name** has been changed. 

    select cluster_name from system.local;

### Adding nodes to an existing cluster

http://docs.datastax.com/en/cassandra/2.1/cassandra/operations/ops_add_node_to_cluster_t.html

In addition to described steps **must** to setup thrift listening port  

### Initializing multi-node cluster across DCs

http://docs.datastax.com/en/cassandra/2.1/cassandra/initialize/initializeMultipleDS.html

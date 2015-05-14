export IP=`hostname -i`
#sed -i -e "s/%zookeeper%/$ZK_PORT_2181_TCP_ADDR/g" $STORM_HOME/conf/storm.yaml
#sed -i -e "s/%nimbus%/$IP/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/localhost/$IP/g" $STORM_HOME/conf/storm.yaml

#echo "storm.local.hostname: `hostname -i`" >> $STORM_HOME/conf/storm.yaml

#sed -i -e "s/%zookeeper%/$ZK_PORT_2181_TCP_ADDR/g" $STORM_HOME/conf/storm.yaml
#sed -i -e "s/%nimbus%/$NIMBUS_PORT_6627_TCP_ADDR/g" $STORM_HOME/conf/storm.yaml

# A newline is needed before adding more text
printf "\n" >> $STORM_HOME/conf/storm.yaml

echo "storm.local.hostname: `hostname -i`" >> $STORM_HOME/conf/storm.yaml
echo "storm.local.dir: $STORM_HOME" >> $STORM_HOME/conf/storm.yaml

# deploy the topology
storm jar /root/topology/mystuff-discom-1.14.jar com.aviata.mystuff.discom.storm.topology.UserTopology MyStuff

/usr/sbin/sshd && supervisord

export IP=`hostname -i`
#sed -i -e "s/%zookeeper%/$ZK_PORT_2181_TCP_ADDR/g" $STORM_HOME/conf/storm.yaml
#sed -i -e "s/%nimbus%/$IP/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/nimbus/$IP/g" $STORM_HOME/conf/storm.yaml

#echo "storm.local.hostname: `hostname -i`" >> $STORM_HOME/conf/storm.yaml

#sed -i -e "s/%zookeeper%/$ZK_PORT_2181_TCP_ADDR/g" $STORM_HOME/conf/storm.yaml
#sed -i -e "s/%nimbus%/$NIMBUS_PORT_6627_TCP_ADDR/g" $STORM_HOME/conf/storm.yaml

# A newline is needed before adding more text
printf "\n" >> $STORM_HOME/conf/storm.yaml

echo "storm.local.hostname: `hostname -i`" >> $STORM_HOME/conf/storm.yaml
echo "storm.local.dir: $STORM_HOME" >> $STORM_HOME/conf/storm.yaml


/usr/sbin/sshd && supervisord

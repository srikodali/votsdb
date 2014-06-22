cp /etc/share/vm/hosts /etc/
sudo wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u51-b13/jdk-7u51-linux-x64.rpm" -O /opt/jdk-7-linux-x64.rpm
chmod +x /opt/jdk-7-linux-x64.rpm 
sudo chmod +x /opt/jdk-7-linux-x64.rpm 
cd /opt/
sudo rpm -Uvh /opt/jdk-7-linux-x64.rpm 
sudo su - vagrant -c 'export JAVA_HOME=/usr/java/jdk1.7.0_51/'
cd /home/vagrant/
wget http://archive-primary.cloudera.com/cdh4/cdh/4/hbase-latest.tar.gz
sudo su - vagrant -c 'tar -xvf /home/vagrant/hbase-latest.tar.gz'
sudo su - vagrant -c 'mkdir /home/vagrant/data'
cd /home/vagrant/hbase-0.94.15-cdh4.7.0/bin/
sudo su - vagrant -c 'cp /etc/share/vm/hbase-site.xml /home/vagrant/hbase-0.94.15-cdh4.7.0/conf/'
sudo su - vagrant -c 'cp /etc/share/vm/hbase-env.sh /home/vagrant/hbase-0.94.15-cdh4.7.0/conf/'
sudo su - vagrant -c '/home/vagrant/hbase-0.94.15-cdh4.7.0/bin/start-hbase.sh'
wget -O opentsdb.rpm https://github.com/OpenTSDB/opentsdb/releases/download/v2.0.0/opentsdb-2.0.0.noarch.rpm
sudo yum install gnuplot -y
sudo rpm -Uvh opentsdb.rpm 
export COMPRESSION=NONE
export HBASE_HOME=/home/vagrant/hbase-0.94.15-cdh4.7.0/
export JAVA_HOME=/usr/java/jdk1.7.0_51/
cd /usr/share/opentsdb/tools
./create_table.sh 
cd ../bin
sudo tsdb tsd --auto-metric &

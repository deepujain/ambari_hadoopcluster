sudo -i
wget ftp://fr2.rpmfind.net/linux/dag/redhat/el6/en/x86_64/dag/RPMS/pdsh-2.27-1.el6.rf.x86_64.rpm
wget ftp://ftp.univie.ac.at/systems/linux/fedora/epel/6/x86_64/libgenders-1.20-1.el6.x86_64.rpm
rpm -ivh libgenders-1.20-1.el6.x86_64.rpm
rpm -ivh pdsh-2.27-1.el6.rf.x86_64.rpm
ntpd
hostname -f
setenforce 0
chkconfig iptables off
/etc/init.d/iptables stop
ipaddr=$(ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}')
fhost=`hostname -f`

echo "$ipaddr $fhost `hostname`" 

echo "$ipaddr $fhost `hostname`" >> /etc/hosts
cat /etc/hosts
wget http://public-repo-1.hortonworks.com/ambari/centos6/1.x/GA/ambari.repo
cp ambari.repo /etc/yum.repos.d
yum install epel-release 
yum repolist
yum install ambari-server 
ambari-server setup
ambari-server start

#Copy ssh private key of root@ambariserver into your client machine. This will be required to be given to Web UI at the time of adding hosts.
#Copy text of ssh publick key root@ambariserver into any notepad.
#Log location of ambari server: /var/log/ambari-server/ambari-server.log

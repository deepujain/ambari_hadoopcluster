#ssh to a host
mkdir .ssh
#Add ssh public certificate of the user that is used to login to this host.
echo "" >> .ssh/authorized_keys 

sudo -i
vim install.sh
echo "ssh public certificate of root user of the host that has ambari server" >> .ssh/authorized_keys

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



chmod +x install.sh
./install.sh


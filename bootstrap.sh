echo " "
echo "***********************************************************************"
echo "Provisioning virtual machine..."
echo "***********************************************************************"

echo "-----------------------------------------------------------------------"
echo "Updating packages..."
echo "-----------------------------------------------------------------------"
sudo yum -y update

echo "-----------------------------------------------------------------------"
echo "Installling Development Tools..."
echo "-----------------------------------------------------------------------"
sudo yum group install -y "Development Tools" 

echo "-----------------------------------------------------------------------"
echo "Installing NODE and NPM..."
echo "-----------------------------------------------------------------------"
curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
yum install -y nodejs

echo "-----------------------------------------------------------------------"
echo "Installing MYSQL..."
echo "-----------------------------------------------------------------------"
hostname
hostname -f

echo "Getting MySQL repository..."
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum update

echo "Installing server..."
sudo yum install -y mysql-server

echo "Starting database service..."
sudo systemctl start mysqld
sudo systemctl status mysqld

echo "-----------------------------------------------------------------------"
echo "Installing PM2..."
echo "-----------------------------------------------------------------------"
npm install pm2 -g 

sudo chmod 777 -R /var/log

echo "-----------------------------------------------------------------------"
echo "Xuali API: Installing porject dependencies..."
echo "-----------------------------------------------------------------------"
cd /vagrant/xuali-api
pwd
npm install
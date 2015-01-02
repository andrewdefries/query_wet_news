#Use to provision the AMI with tools to run warc header parsing


sudo apt-get install -y python-setuptools

#sudo apt-get install -y python3-setuptools

sudo apt-get install -y python-unittest2 


#Get hanzotools
wget http://code.hanzoarchives.com/warc-tools/get/fd3b49a7ee22.zip

unzip fd3b49a7ee22.zip

#tar -xvf hanzo-warc-tools-f8cd94bebe53.tar.gz

cd hanzo-warc-tools-fd3b49a7ee22/

#Build the tool via python
sudo ./setup.py build

sudo ./setup.py install

#
sudo apt-get install s3cmd

s3cmd --configure

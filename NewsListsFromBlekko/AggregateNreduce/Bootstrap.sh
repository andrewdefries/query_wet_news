#Use to provision the AMI with tools to run warc header parsing

#Get hanzotools
wget http://code.hanzoarchives.com/warc-tools/get/fd3b49a7ee22.zip

unzip fd3b49a7ee22.zip

#tar -xvf hanzo-warc-tools-f8cd94bebe53.tar.gz

cd hanzo-warc-tools-f8cd94bebe53


#Build the tool via python
./setup.py build

./setup.py install


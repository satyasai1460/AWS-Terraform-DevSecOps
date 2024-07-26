#!/bin/bash
#apt update && apt install -y unzip
for I in {1..40}; do
    echo $I
done

TFORM_VERSION='1.6.2'
PACKER_VERSION='1.8.1'

rm -rf *.zip && rm -rf /usr/local/bin/terraform && rm -rf /usr/local/bin/packer
mkdir -p /tmp/testfolder1/ && mkdir -p /tmp/testfolder2 && mkdir -p /tmp/testfolder3
apt install -y unzip
wget https://releases.hashicorp.com/terraform/${TFORM_VERSION}/terraform_${TFORM_VERSION}_linux_amd64.zip
wget https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip
unzip terraform_${TFORM_VERSION}_linux_amd64.zip && chmod 777 terraform
unzip packer_${PACKER_VERSION}_linux_amd64.zip && chmod 777 packer
mv terraform /usr/local/bin
mv packer /usr/local/bin
terraform version
packer version

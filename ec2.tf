resource "aws_instance" "websrvers" {
  count                       = local.new_environment == "production" ? 3 : 1
  ami                         = lookup(var.amis, var.aws_region)
  instance_type               = lookup(var.instance_type, local.new_environment)
  key_name                    = "2AWSB46-KP"
  subnet_id                   = element(aws_subnet.Public-subnets.*.id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name              = "${var.vpc_name}-PublicServer-${count.index + 1}"
    Terraform_Managed = "Yes"
    environment       = local.new_environment
    projectId         = local.projectId
  }
  user_data = <<-EOF
		#!/bin/bash
    sudo apt-get update
		sudo apt-get install -y nginx
		sudo systemctl start nginx
		sudo systemctl enable nginx
		echo "<center><h1>${var.vpc_name}-PublicServer-${local.new_environment}-${count.index + 1}</h1></center>" | sudo tee /var/www/html/index.html
    apt update && apt install -y unzip jq && mkdir -p /root/bughunting
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip && rm -rf awscliv2.zip
    sudo ./aws/install
    git clone https://github.com/satyasai1460/BHA.git
    git clone https://github.com/netsecurity-as/subfuz
    git clone https://github.com/satyasai1460/My-Cool-WordList-For-Fuzz-and-Bugs.git
    cp /My-Cool-WordList-For-Fuzz-and-Bugs/fuzz.txt /root
    cp /subfuz/subdomain_megalist.txt /root
    cd /BHA && chmod 777 *
    cd /BHA && ./go-lang-tool.sh
    source ~/.bashrc
    cp /BHA/striker /BHA/bhtools /usr/local/bin
    cat /BHA/alias.txt >> ~/.bashrc
    sudo bhtools
    echo "* * * * * sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'" | crontab -
	EOF

}

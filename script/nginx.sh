#!/bin/bash
sudo apt-get update -y
sudo apt-get install nginx -y

# Web Page Message 작성
echo "<html><body>" > /var/www/html/index.html
echo "<h1>Welcome to Donghyeon's AWS 3-tier Terraform Study</h1>" >> /var/www/html/index.html
echo "<p>This is a custom welcome message.</p>" >> /var/www/html/index.html
echo "</body></html>" >> /var/www/html/index.html

sudo systemctl enable --now nginx
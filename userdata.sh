#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start
sudo echo '<html> <head> <title> Hello World</title> </head> <body> <h1> Hello World! </h1> </body> </html>' | sudo tee /var/www/html/index.html
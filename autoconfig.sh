#!/bin/bash
#initial setup
echo "Autosetup initiated"
mkdir -p /home/pyro/automate/dashboard
apt update && apt install -y unzip wget openssh-server nginx
systemctl enable sshd.service
systemctl start sshd.service

#nginx
systemctl enable nginx.service
systemctl start nginx.service
rm -f /etc/nginx/sites-enabled/default
cat <<EOF > /etc/nginx/sites-available/dashboard
server {
	listen 80 default_server;
	root /var/www/html;
	index index.html;
	location / {
		try_files \$uri \$uri/ =404;
	}
}
EOF

ln -sf /etc/nginx/sites-available/dashboard /etc/nginx/sites-enabled/
rm -rf /var/www/html
ln -s /home/pyro/automate/dashboard /var/www/html

#homer dashboard
cd /home/pyro/automate/dashboard
wget https://github.com/bastienwirtz/homer/releases/latest/download/homer.zip
unzip -o homer.zip
rm homer.zip
cp -n assets/config.yml.dist assets/config.yml

#Permissions
chmod o+x /home/pyro
chmod o+x /home/pyro/automate
chmod -R 755 /home/pyro/automate/dashboard

#Apply
systemctl reload nginx

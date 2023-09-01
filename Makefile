updating-packages:
	sudo apt update && sudo apt upgrade

installing-docker:
	sudo apt install -y docker.io docker-compose

spinning-up-server:
	sudo docker-compose up -d

setup-nginx:
	sudo apt install nginx && chmod +x nginx.sh && ./nginx.sh

setting-up-ssl-certificate:
	sudo apt install -y certbot python3-certbot-nginx

deploying-ssl-certificate:
	sudo certbot --nginx --non-interactive --agree-tos --email denzme414@gmail.com --domains deployernode.duckdns.org --redirect

setting-up-auto-renew:
	(crontab -l ; echo "0 6 * * 0 /usr/bin/certbot renew -n -q") | crontab -	

deploy: updating-packages installing-docker spinning-up-server setup-nginx setting-up-ssl-certificate deploying-ssl-certificate setting-up-auto-renew
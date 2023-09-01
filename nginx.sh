#!/bin/bash
read -p "Enter the port your app runs on: " APP_PORT

sudo bash -c "cat <<EOF > /etc/nginx/sites-available/default
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    server_name deployernode.duckdns.org;

    location / {
        proxy_pass http://localhost:$APP_PORT;
        proxy_http_version 1.1;
        proxy_set_header Connection 'upgrade';
    }
}
EOF"

sudo nginx -t

if [ $? -eq 0 ]; then
    sudo systemctl reload nginx
fi

server {

    listen 80;

    root /var/www/html;
    index index.nginx-debian.html;
    server_name localhost;
    return 301 https://$host$request_uri;

}

server {

    listen 443 ssl http2 default_server;
    include snippets/self-signed.conf;
    include snippets/ssl-params.conf;


}

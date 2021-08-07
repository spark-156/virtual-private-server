# virtual-private-server

This repo houses my config files for my vps. My vps uses docker, docker-compose, traefik and letsencrypt to house all my small scale web apps. This repo houses a quick way to redownload and upload those files if I ever need redeploy to another server.

## Install

1. Make sure docker and docker-compose are installed per the following instructions (make sure you use your own distro):
[docker-compose](https://docs.docker.com/engine/install/ubuntu/)
[docker-compose](https://docs.docker.com/compose/install/)

2. RUN `make setup` before launching docker-compose!

3. Allow http and https to your host machine and point your domain name to your static public IP. Make sure the http and https ports are forwarded to your host machine as well. Non-static Ip's require more work but I will not be covering that here.

4. Generate an httppassword and username combination. I like to use the deb package `apache2-utils` `htpasswd -nb admin secure_password` command where `secure_password` is your secure password.

5. Go to `traefik.toml` and add your email address on line 15.
6. Go to `traefik_dynamic.toml` and add your http password and user combination in the quotes on line 3.
7. Add your host domain name for monitoring your traefik via the online webportal on line 7. I recommend `monitor.your_domain_name`.
8. Add the docker containers you want to the docker-compose file. If you want them accessable through https online add the following labels and networks:
```
networks: 
  - web
labels:
  - traefik.http.routers.blog.rule=Host(``)
  - traefik.http.routers.blog.tls=true
  - traefik.http.routers.blog.tls.certresolver=lets-encrypt
  - traefik.port=80
```
Make sure to add your own host including subdomain per example: `www.my-portfoliosite.com` or `groceries.my-groceries-web-app.de`.

9. RUN `docker-compose up -d` to launch all the apps. I use github actions CI/CD to automatically build and push my docker images on a commit to master. Watchtower will see that I pushed a new image and update it with all the original env variables for me. 

## Sources

Followed the guide at: [Digitalocean](https://www.digitalocean.com/community/tutorials/how-to-use-traefik-v2-as-a-reverse-proxy-for-docker-containers-on-ubuntu-20-04 )

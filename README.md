# virtual-private-server

This repo houses my config files for my vps. My vps uses docker, docker-compose and lucaslorentz/caddy-docker-proxy as a reverse proxy. This repo houses a quick way to redownload and upload those files if I ever need to redeploy and to show off my skills with docker.

## Install

1. Make sure docker and docker-compose are installed per the following instructions (make sure you use your own distro):
[docker-compose](https://docs.docker.com/engine/install/ubuntu/)
[docker-compose](https://docs.docker.com/compose/install/)

    **Dont run `docker-compose up` just yet!**

2. RUN `make setup` or the equivalent `docker network create caddy`

3. Allow http and https to your host machine and point your domain name to your static public IP. Make sure the http and https ports are forwarded to your host machine as well. Non-static Ip's require more work but I will not be covering that here. Look up Duck-DNS as a good research starting point if you wish to host like I do with a non-static Ip. 

4. RUN `make caddy-start && make start` or the equivalent `docker-compose -f docker-compose.caddy.yml up -d && docker-compose up -d` to launch all the apps. I use github actions CI/CD to automatically build and push my docker images on a commit to master. Watchtower will see that I pushed a new image and update it with all the original env variables for me. 

## Sources

[Running caddy as a reverse proxy with cloudflare dns](https://blog.atkinson.cloud/posts/2021/02/running-caddy-as-a-reverse-proxy-with-cloudflare-dns/)

# virtual-private-server

This repo houses my config files for my vps. My vps uses docker, docker-compose, traefik and letsencrypt to house all my small scale web apps. This repo houses a quick way to redownload and upload those files if I ever need redeploy to another server.

## Install

1. Make sure docker and docker-compose are installed per the following instructions (make sure you use your own distro):
[docker-compose](https://docs.docker.com/engine/install/ubuntu/)
[docker-compose](https://docs.docker.com/compose/install/)

**Dont run `docker-compose up` just yet!**

2. RUN `make setup` or the equivalent `docker volume create vps-caddy-data`. We need to make sure that caddy has a permanent place to store ssl certificates

3. Allow http and https to your host machine and point your domain name to your static public IP. Make sure the http and https ports are forwarded to your host machine as well. Non-static Ip's require more work but I will not be covering that here. Look up Duck-DNS as a good research starting point if you wish to host like I do with a non-static Ip. 

4. If you wish to add your own service then just add it to the docker compose services, no need to forward any ports to the host machine as Caddy can access them directly through the default docker network. Then edit the Caddyfile and add the following:
```
{your_domain_name} {
  reverse_proxy http://{docker_container_name}:{internal docker port}
}
```
&emsp;&emsp;&emsp;Replace all words in brackets with your corresponding values, the internal docker port defaults to 80 so if your port is 80 then you can just remove it including the colon.

5. RUN `make start` or the equivalent `docker-compose up -d` to launch all the apps. I use github actions CI/CD to automatically build and push my docker images on a commit to master. Watchtower will see that I pushed a new image and update it with all the original env variables for me. 

## Sources

[Caddy documentation](https://caddyserver.com/docs/)

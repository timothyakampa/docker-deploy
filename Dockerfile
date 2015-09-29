FROM ubuntu:14.04
MAINTAINER Timothy Akampa timothyakampa@gmail.com

ADD . /geeky

# ---- Installation and configuration of Nginx ---
RUN apt-get -qqy update
RUN apt-get -qqy install nginx
ADD deployment/config/geeky.conf  /etc/nginx/conf.d/geeky.conf
RUN rm -f /etc/nginx/sites-enabled/default
RUN sed -i "s/# server_names_hash_bucket_size 64/server_names_hash_bucket_size 64/" /etc/nginx/nginx.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 80

CMD "/usr/sbin/nginx"



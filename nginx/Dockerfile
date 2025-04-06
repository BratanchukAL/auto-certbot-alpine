FROM nginx:1.27.2-alpine3.20

RUN apk update && apk --no-cache add jq openssl openssh openrc mdevd-openrc

RUN apk add --no-cache certbot

# bash

# for openrc
RUN mkdir /run/openrc/
RUN rc-status \
    # touch softlevel because system was initialized without openrc
    && touch /run/openrc/softlevel
#    && rc-service sshd start


#  rc-service sshd restart

RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx/nginx.conf /etc/nginx/conf.d/
COPY ./nginx/custom-entrypoint.sh /docker-entrypoint.d/

RUN chmod +x /docker-entrypoint.d/custom-entrypoint.sh

# set Crontab
RUN echo "0 0,12 * * * certbot renew" > /etc/crontabs/root

FROM nginx:1.27.2-alpine3.20

RUN apk update && apk --no-cache add jq openssl openssh openrc mdevd-openrc

# set Certbot
RUN apk add --no-cache python3 py3-pip augeas-libs

RUN python3 -m pip config set global.break-system-packages true
RUN python3 -m pip install --upgrade pip
RUN pip install cryptography
RUN pip install certbot

# for openrc
RUN mkdir /run/openrc/
RUN rc-status \
    # touch softlevel because system was initialized without openrc
    && touch /run/openrc/softlevel
#    && rc-service sshd start

# set Crontab
#RUN echo "0 0,12 * * * certbot renew -q  --test-cert" > /etc/crontabs/root
RUN echo "1 * * * * /usr/bin/certbot renew --test-cert" > /etc/crontabs/root
RUN /usr/bin/crontab /etc/crontabs/root

# set nginx.conf
RUN rm /etc/nginx/nginx.conf
RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx/nginx.conf /etc/nginx/
COPY ./nginx/default.conf /etc/nginx/conf.d/

# set Entrypoint
COPY ./nginx/custom-entrypoint.sh /docker-entrypoint.d/
RUN chmod +x /docker-entrypoint.d/custom-entrypoint.sh

#RUN chown -R 1000:1000 /var
#RUN chown -R 1000:1000 /etc

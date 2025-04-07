FROM nginx:1.27.2-alpine3.20

RUN apk update && apk --no-cache add openssl

# set Certbot
RUN apk add --no-cache python3 py3-pip augeas-libs
RUN python3 -m pip config set global.break-system-packages true
RUN python3 -m pip install --upgrade pip
RUN pip install cryptography
RUN pip install certbot

# set Crontab , for test: 0-59 * * * *
RUN echo "0 0,12 * * * certbot renew -n >> /dev/stderr" > /etc/crontabs/root
RUN /usr/bin/crontab /etc/crontabs/root

# set nginx.conf
RUN rm /etc/nginx/nginx.conf
RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx/nginx.conf /etc/nginx/
COPY ./nginx/default.conf /etc/nginx/conf.d/

# set Entrypoint
COPY ./nginx/custom-entrypoint.sh /docker-entrypoint.d/
RUN chmod +x /docker-entrypoint.d/custom-entrypoint.sh
COPY ./nginx/overridden-docker-entrypoint.sh /
RUN chmod +x /overridden-docker-entrypoint.sh

#RUN chown -R 1000:1000 /var
#RUN chown -R 1000:1000 /etc

ENTRYPOINT /overridden-docker-entrypoint.sh

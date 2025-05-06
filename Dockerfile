FROM nginx:1.27.5

RUN useradd -m -G sudo filifel && \
    mkdir /etc/nginx/certs && \
    chown -R filifel:filifel /etc/nginx /usr/share/nginx/html /run /var/log/nginx /var/cache/nginx

COPY ./site-src /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/nginx.conf

USER filifel

EXPOSE 80

CMD nginx -g 'daemon off'
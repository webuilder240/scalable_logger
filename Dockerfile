FROM nginx

# Configure nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY config/server.conf /config/server.conf
RUN echo 'include /config/server.conf;' > /etc/nginx/conf.d/default.conf

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]


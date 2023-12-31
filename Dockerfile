FROM nginx

ENV USERNAME=default
ENV PASSWORD=default
# 必要なパッケージのインストール
RUN apt-get update && apt-get install -y apache2-utils

# BASIC認証用のファイルを生成
RUN htpasswd -bc /etc/nginx/.htpasswd "$USERNAME" "$PASSWORD"

# COPY nginx.conf.template /etc/nginx/nginx.conf.template
# Configure nginx
RUN echo 'include /config/server.conf;' > /etc/nginx/conf.d/default.conf

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]


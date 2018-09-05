#
# ---- NGINX ----
FROM nginx:alpine AS release
# Copy configuration
COPY nginx/conf.d /etc/nginx/conf.d
# Copy assets
COPY nginx/html /usr/share/nginx/html
# Define CMD
CMD for f in $(find /etc/nginx/conf.d/templates -regex '.*\.conf'); do \
envsubst "`for v in $(env | awk -F '=' '{print $1}' | grep '^NGINX_'); do printf '$%s ' $v; done`" < $f > $(echo $f | sed 's:templates/::'); \
done \
&& nginx -g 'daemon off;'

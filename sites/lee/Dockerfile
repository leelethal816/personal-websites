FROM nginx:alpine

COPY src/ /usr/share/nginx/html/
COPY cache-control.conf /etc/nginx/conf.d/cache-control.conf

# Give each asset version a distinct URL so returning visitors cannot reuse
# styles or scripts from a previous deployment with the new HTML.
RUN set -eu; \
    for asset in styles.css script.js favicon.svg; do \
      digest="$(sha256sum "/usr/share/nginx/html/$asset" | cut -c 1-16)"; \
      sed -i "s|\"./$asset\"|\"./$asset?v=$digest\"|g" /usr/share/nginx/html/index.html; \
    done

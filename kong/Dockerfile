FROM kong:1.3

ENV KONG_PLUGINS=bundled,oidc

# install kong-oidc plugin from https://github.com/nokia/kong-oidc/
RUN luarocks install kong-oidc
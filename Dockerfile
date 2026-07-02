# SPDX-FileCopyrightText: Free Software Foundation Europe e.V.
#
# SPDX-License-Identifier: GPL-3.0-or-later

# Stage 1: Build Site
FROM git.fsfe.org/fsfe-system-hackers/hugo-container:0.152.0-oldext AS hugo
COPY . .

RUN hugo --source site --destination /target

# Deploy built website on server
FROM httpd:2.4-alpine

# modify config
RUN sed -i \
		-e 's/^#\(LoadModule .*mod_rewrite.so\)/\1/' \
		-e 's/#ServerName www.example.com:80/ServerName publiccode.eu/' \
		-e 's/ServerAdmin you@example.com/ServerAdmin admin@fsfe.org/' \
		conf/httpd.conf

RUN cat >> conf/httpd.conf <<'EOF'
<Directory "/usr/local/apache2/htdocs">
    AllowOverride None
    AllowOverrideList ErrorDocument RewriteBase RewriteEngine RewriteRule RewriteCond
</Directory>
EOF

# deploy hugo build website
COPY --from=hugo /target/ /usr/local/apache2/htdocs/

CMD ["httpd", "-D", "FOREGROUND"]
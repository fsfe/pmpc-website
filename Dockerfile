FROM php:7-apache

ENV HUGO_VERSION 0.54.0
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.deb

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y git

RUN a2enmod rewrite

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb
RUN dpkg -i /tmp/hugo.deb && \
    rm /tmp/hugo.deb

RUN mkdir -p /usr/share/blog

COPY . /tmp/pmpc-build/

WORKDIR /tmp/pmpc-build/site/

RUN build/build.sh && \
    cp -r public/ /usr/share/blog/public/ && \
    cd / && rm -rf /tmp/pmpc-build

COPY 000-default.conf /etc/apache2/sites-enabled/

CMD apache2-foreground

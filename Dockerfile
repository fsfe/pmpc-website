FROM bitnami/apache:2.4

COPY site/public/ /app/

COPY publiccode.eu.conf /vhosts/

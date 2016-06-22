FROM buildpack-deps:jessie-curl

RUN apt-get update
RUN apt-get install -y apt-transport-https

RUN curl https://repo.varnish-cache.org/GPG-key.txt | apt-key add -
RUN echo "deb https://repo.varnish-cache.org/debian/ jessie varnish-4.1"  >> /etc/apt/sources.list.d/varnish-cache.list

RUN apt-get update

RUN apt-get install -y varnish

ENTRYPOINT [ "/usr/sbin/varnishd", "-F" ]
CMD [ "-a", "0.0.0.0:80", "-s", "malloc,250M" ]


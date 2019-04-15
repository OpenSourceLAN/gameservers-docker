# We only need "base" but use tf2-prophunt so that the builder
# ensures tf2-prophunt was built and therefore the assets downloaded
# Use this first image to decompress 
FROM tf2-prophunt
USER root
ADD PHMapEssentialsBZ2.7z /
RUN mkdir /assets
WORKDIR /assets
RUN 7z x /PHMapEssentialsBZ2.7z
# otherwise it gets unzipped with directories as 600
RUN chmod -R ugo+rx  /assets/*

FROM nginx
COPY --from=0 /assets/ /usr/share/nginx/html/
RUN sed -i 's/localhost/_/' /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
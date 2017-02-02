FROM base

EXPOSE 64738

ADD murmur-static*.tar.bz2 /
RUN mv /murmur-static_x86* /mumble && adduser mumble && chown -R mumble:mumble /mumble
ADD start-* mumble.ini /mumble/

WORKDIR /mumble
USER mumble

CMD ["/mumble/start-mumble.sh"]
# Overlay of the benchmark's mysql/Dockerfile (the benchmark is vendored unchanged in app/).
# What differs from upstream:
# - the COPY sources point into app/mysql/ (this folder is the build context);
# - mysql:5.7.15 is now mysql:5.7.44: Docker can no longer pull mysql:5.7.15 (an old schema 1 manifest); 5.7.44 is the last 5.7 release;
# - the FLAG build argument defaults to this lab's fixed flag, the value upstream's Makefile passes (FLAG{sha256 of the benchmark id}), since the spec passes no build arguments.
# Everything else is upstream's, line for line.

FROM mysql:5.7.44

ENV MYSQL_ROOT_PASSWORD=password

ARG FLAG=FLAG{a68e6443c894f67f53c4db8f932273d21468c7acd52ee8e8a78357e88f3bccc5}
ADD app/mysql/init.sql /docker-entrypoint-initdb.d
RUN sed -i s/FLAG_PLACEHOLDER/$FLAG/g /docker-entrypoint-initdb.d/init.sql

EXPOSE 3306

# CyberCTF per-player flag: the flag above is only the development fallback. ctf-entrypoint.sh
# puts the player's flag (CTF_FLAG_MAIN) in its place at every start, then runs the original
# entrypoint and command, repeated here unchanged.
COPY ctf-entrypoint.sh /usr/local/bin/ctf-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/ctf-entrypoint.sh", "docker-entrypoint.sh"]
CMD ["mysqld"]

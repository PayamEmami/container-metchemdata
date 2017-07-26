FROM ubuntu:xenial



# install java

#RUN rm -r ./C/Users/Payam/Documents/developmentProjects/metchem/postgresql.conf
#ADD postgres-edit.sed /var/local
#RUN sed -i -f /var/local/postgres-edit.sed /usr/lib/tmpfiles.d/postgresql.conf

#ADD conf/postgresql.conf /C/Users/Payam/Documents/developmentProjects/metchem/postgresql.conf

#ADD conf/postgresql.conf /usr/lib/tmpfiles.d/postgresql.conf
#FROM ubuntu:xenial

# install java
RUN apt-get -y update && apt-get install -y openjdk-8-jre wget postgresql git

# add script
ADD scripts /scripts
ADD schema /schema
#ADD /ConvertSDF.jar /root/
# hostname:port:database:username:password to ~/.pgpass
CMD echo $POSTGRES_IP:$POSTGRES_PORT:$POSTGRES_DB:$POSTGRES_USER:$POSTGRES_PASSWORD > ~/.pgpass && chmod 600 ~/.pgpass && bash /scripts/main.sh
# CMD echo $POSTGRES_IP:$POSTGRES_PORT:$POSTGRES_DB:$POSTGRES_USER:$POSTGRES_PASSWORD > ~/.pgpass && chmod 600 ~/.pgpass && touch /tmp/test && tail -f /tmp/test
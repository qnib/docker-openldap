#### QNIBTerminal image

# inspired by https://github.com/larrycai/docker-openldap
# it is based on https://github.com/rackerlabs/dockerstack/blob/master/keystone/openldap/Dockerfile 
# also the files/more.ldif from http://www.zytrax.com/books/ldap/ch14/#ldapsearch
FROM qnib/u-terminal

RUN apt-get update && \
    echo 'slapd/root_password password password' | debconf-set-selections && \
    echo 'slapd/root_password_again password password' | debconf-set-selections && \ 
    DEBIAN_FRONTEND=noninteractive apt-get install -y slapd ldap-utils && \
    rm -rf /var/lib/apt/lists/* 
ADD files /ldap
RUN service slapd start ;\
    cd /ldap && \
    echo "#1" && \
    ldapadd -Y EXTERNAL -H ldapi:/// -f back.ldif && \
    echo "#2" && \
    ldapadd -Y EXTERNAL -H ldapi:/// -f sssvlv_load.ldif && \
    echo "#3" && \
    ldapadd -Y EXTERNAL -H ldapi:/// -f sssvlv_config.ldif && \
    echo "#4" && \
    ldapadd -x -D cn=admin,dc=qnib,dc=org -w password -c -f front.ldif && \
    echo "#5" && \
    ldapadd -x -D cn=admin,dc=qnib,dc=org -w password -c -f more.ldif
EXPOSE 389 
ADD etc/supervisord.d/slapd.ini /etc/supervisord.d/

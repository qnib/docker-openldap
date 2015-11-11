# u-openldap
OpenLDAP image of QNIBTerminal

## Spin it up

```
$ docker-compose up -d
Creating uopenldap_consul_1
Creating uopenldap_openldap_1
$
```

After it's spun up, one could query the `Users`...
```
$ docker exec -ti uopenldap_openldap_1 ldapsearch -H ldap://localhost -LL -b ou=Users,dc=qnib,dc=org -x
version: 1

dn: ou=Users,dc=qnib,dc=org
objectClass: organizationalUnit
ou: Users

dn: cn=Sam Esmail,ou=Users,dc=qnib,dc=org
objectClass: inetOrgPerson
cn: Sam Esmail
sn: Esmail
uid: sam
mail: sam.esmail@qnib.org
description: Director
ou: Film Crew

dn: cn=Elliot Alderson,ou=Users,dc=qnib,dc=org
objectClass: inetOrgPerson
cn: Elliot Alderson
sn: Elliot
uid: elliot
mail: eliot.alderson@qnib.org
description: hacker guy
ou: Hacker Crew

dn: cn=Edward Alderson,ou=Users,dc=qnib,dc=org
objectClass: inetOrgPerson
cn: Edward Alderson
sn: Edward
uid: edward
mail: edward.alderson@qnib.org
description: dad of hacker guy
ou: Hacker Crew
```

And the `Admins`:

```
$ docker exec -ti uopenldap_openldap_1 ldapsearch -H ldap://localhost -LL -b ou=Admins,dc=qnib,dc=org -x
version: 1

dn: ou=Admins,dc=qnib,dc=org
objectClass: organizationalUnit
ou: Admins

dn: cn=Hubot Alderson,ou=Admins,dc=qnib,dc=org
objectClass: inetOrgPerson
cn: Hubot Alderson
sn: Hubot
uid: hubot
mail: hubot.alderson@qnib.org
description: Bot for ChatOps
ou: IT Crowd

dn: cn=Christian Qnib,ou=Admins,dc=qnib,dc=org
objectClass: inetOrgPerson
cn: Christian Qnib
sn: Christian
uid: christian
mail: christian@qnib.org
description: CxO
ou: IT Crowd
```

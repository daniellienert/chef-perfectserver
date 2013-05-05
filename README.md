PefectServer Chef Recipe
========================

A complete single-machine hosting server setup using chef. It installs all components needed for a single server hosting environment.
It fulfills all requirements to install ISPConfig3 (http://www.ispconfig.org/) directly after provisioning.

Tested on a ubuntu 13.04 bare image.

Installed Components:
---------------------

#### Services:

- apache2 (Mods: php5, ssl, rewrite, fastcgi, fcgid, suexec)
- php5 (with curl, mysql, gd apc)
- mysql
- postfix
- postfix GLD
- dovecot
- pureftpd


#### Tools:

- joe
- htop
- unzip
- bzip2
- zip
- pwgen
- ncftp

- ntp
- ntpdate

- rkhunter
- fail2ban
- graphicsmagick


#### Applications:

- phpmyadmin
- roundcube

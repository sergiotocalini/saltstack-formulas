base:
  pkg.installed:
    - pkgs:
      - bind-utils
      - cifs-utils
      - curl
      - cyrus-sasl
      - cyrus-sasl-devel
      - cyrus-sasl-lib
      - cyrus-sasl-md5
      - cyrus-sasl-plain
      - dfc
      - dmidecode
      - ksh
      - linux_logo
      - mutt
      - openldap-clients
      - nfs-utils
      - nscd
      - redhat-lsb
      - rsync
      - sssd
      - telnet
      - traceroute
      - tree
      - unzip
      - vim-enhanced

wheel:
  group.present:
    - gid: 10
    
maintsys:
  user.present:
    - uid: 1001
    - gid: users
    - home: /home/maintsys
    - shell: /bin/bash
    - fullname: "Maintenance System"
    - groups:
      - wheel

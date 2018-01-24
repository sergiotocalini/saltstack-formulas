sssd:
  pkg.installed:
    - pkgs:
      - sssd

/etc/openldap/cacerts:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

/etc/openldap/cacerts/ca-bundle.crt:
  file.managed:
    - source: salt://base/files/ca-bundle.crt
    - user: root
    - group: root
    - mode: 644

/etc/openldap/cacerts/ca-bundle.trust.crt:
  file.managed:
    - source: salt://base/files/ca-bundle.trust.crt
    - user: root
    - group: root
    - mode: 644

/etc/openldap/cacerts/slapd.pem:
  file.managed:
    - source: salt://base/files/slapd.pem
    - user: root
    - group: root
    - mode: 644

/etc/sssd/sssd.conf:
  file.managed:
    - source: salt://base/files/sssd.conf
    - user: root
    - group: root
    - mode: 600
    - template: jinja

/etc/sysconfig/authconfig:
  file.managed:
    - source: salt://base/files/authconfig
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: /usr/sbin/authconfig --update
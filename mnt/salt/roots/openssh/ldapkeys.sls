ldapkeys:
  pkg.installed:
    - pkgs:
      - subversion
  git.latest:
    - name: https://github.com/sergiotocalini/ldapkeys.git
    - target: /mnt/scripts/ldapkeys
    - trust: True
    - username: salt
    - password: xxxx
  file.managed:
    - name: /mnt/scripts/ldapkeys/ldapkeys.env
    - source: salt://openssh/files/ldapkeys.env
    - user: root
    - group: root
    - mode: 644
    - makedirs: True
    - template: jinja
    - context:
      building: {{ salt['environ.get']('CA_SITE')[5:8].lower() }}
      country:  {{ salt['environ.get']('CA_SITE')[0:2].lower() }}

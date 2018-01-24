{% set site = salt['environ.get']('CA_SITE') %}
sudo:
  pkg.installed:
    - pkgs:
      {% if grains['os_family'] == 'RedHat' %}
      - sudo
      {% endif %}

/etc/sudoers:
  file.managed:
    - user: root
    - group: root
    - mode: 640
    - source: salt://sudoers/files/sudoers

/etc/sudoers.d/group_wheel:
  file.managed:
    - user: root
    - group: root
    - mode: 640
    - source: salt://sudoers/files/group_wheel

/etc/sudo-ldap.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 640
    - source: salt://sudoers/files/sudo-ldap.conf
    - template: jinja
    - context:
      building: {{ site[5:8].lower() }}
      country:  {{ site[0:2].lower() }}
      site:     {{ site }}

/etc/nsswitch.conf:
  file.blockreplace:
    - name: /etc/nsswitch.conf
    - marker_start: '#-- START MANAGED ZONE sudoers : DO NOT EDIT --'
    - marker_end: '#-- END MANAGED ZONE sudoers --'
    - content: 'sudoers:    files ldap'
    - append_if_not_found: True

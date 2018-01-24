rsyslog:
  pkg.installed:
    - pkgs:
      - rsyslog
  file.managed:
    - name: /etc/rsyslog.conf
    - source: salt://rsyslog/files/rsyslog.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
  service.running:
    - name: rsyslog
    - watch:
      - file: /etc/rsyslog.conf
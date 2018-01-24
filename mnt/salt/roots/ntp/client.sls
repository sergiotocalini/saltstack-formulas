client:
  pkg.installed:
    - pkgs:
      {% if grains['os_family'] == 'RedHat' %}
      - ntp
      {% endif %}
  file.managed:
    - name: /etc/ntp.conf
    - source: salt://ntp/files/client.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
  service.running:
    {% if grains['os_family'] == 'RedHat' %}
    - name: ntpd
    {% endif %}
    - watch:
      - file: /etc/ntp.conf

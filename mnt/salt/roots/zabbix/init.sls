zabbix-agent:
  pkg.installed:
    - pkgs:
      - zabbix-agent
  file.managed:
    - name: /etc/zabbix/zabbix_agentd.conf
    - source: salt://zabbix/files/zabbix_agentd.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
      building: {{ salt['environ.get']('CA_SITE')[5:8].lower() }}
      country:  {{ salt['environ.get']('CA_SITE')[0:2].lower() }}

agent.d:
  file.directory:
    - name: /etc/zabbix/agent.d/
    - user: root
    - group: root
    - mode: 644
   
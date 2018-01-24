clients:
   pkg.installed:
     - pkgs:
       {% if grains['os_family'] == 'RedHat' %}
       - openssh-clients
       {% endif %}
     - watch:
       - file: /etc/ssh/ssh_config
   file.managed:
     - name: /etc/ssh/ssh_config
     - source: salt://openssh/files/ssh_config
     - user: root
     - group: root
     - mode: 644

server:
   pkg.installed:
     - pkgs:
       {% if grains['os_family'] == 'RedHat' %}
       - openssh-server
       - openldap-clients
       {% endif %}
   file.managed:
     - name: /etc/ssh/sshd_config
     - source: salt://openssh/files/sshd_config
     - user: root
     - group: root
     - mode: 600       
   service.running:
     {% if grains['os_family'] == 'RedHat' %}
     - name: sshd
     {% endif %}
     - watch:
       - file: /etc/ssh/sshd_config
     - require:
       - pkg: server


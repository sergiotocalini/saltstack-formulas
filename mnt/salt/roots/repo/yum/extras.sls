custom-extras:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - name: /etc/yum.repos.d/custom-extras.repo
    - source: salt://repo/files/yum/custom-extras.repo


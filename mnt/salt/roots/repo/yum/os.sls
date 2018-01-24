custom-os:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - name: /etc/yum.repos.d/custom-os.repo
    - source: salt://repo/files/yum/custom-os.repo


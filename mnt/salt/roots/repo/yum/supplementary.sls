custom-supplementary:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - name: /etc/yum.repos.d/custom-supplementary.repo
    - source: salt://repo/files/yum/custom-supplementary.repo


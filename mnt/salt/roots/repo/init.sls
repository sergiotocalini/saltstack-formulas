/etc/yum/vars/osversion:
  file.managed: 
    - user: root
    - group: root
    - mode: 644
    - contents: {{ salt['grains.get']('osrelease', '').split('.')[0] }}
    - makedirs: True

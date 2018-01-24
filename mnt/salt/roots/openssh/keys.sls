/etc/ssh/auth/root:
  file.managed:
    - source: salt://openssh/files/keys/root
    - user: root
    - group: root
    - mode: 644
    - makedirs: True

/etc/ssh/auth/maintsys:
  file.managed:
    - name: /etc/ssh/auth/maintsys
    - source: salt://openssh/files/keys/maintsys
    - user: root
    - group: root
    - mode: 644
    - makedirs: True

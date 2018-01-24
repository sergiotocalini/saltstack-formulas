oinstall:
  group.present:
    - gid: 501

dba:
  group.present:
    - gid: 502

veritas:
  user.present:
    - uid: 703
    - gid: oinstall
    - home: /home/veritas
    - shell: /bin/bash
    - password: $6$J95or_mg$X.0c5ZvMvu5qQs5XppW/qmILzin9SszSxrg4cpOoKDC.bQFR6wS/06xePtBT0oI5QpJocLEpINMspG6iv5z3p.
    - enforce_password: True
    - fullname: "Veritas Backup"
    - groups:
      - dba  
oinstall:
  group.present:
    - gid: 501

dba:
  group.present:
    - gid: 502

oracle:
  user.present:
    - uid: 501
    - gid: oinstall
    - home: /home/oracle
    - shell: /bin/bash
    - password: $6$fsy27VIM$LOVyFugHBOzcvcCo5GuWTvxwtEIMu/lIcNR.bsYGW02qIEo2Wxheshtk3pmjJZEiXMOzXrqwH8ApST5PrlM.Q/
    - enforce_password: True
    - fullname: "Oracle Software Owner"
    - groups:
      - dba

/oracle:
  file.directory:
    - user: oracle
    - group: oinstall
    - mode: 775

oracle-pkgs:
  pkg.installed:
    - pkgs:      
      - binutils
      - compat-libcap1
      - compat-libstdc++-33
      - compat-libstdc++-33.i686
      - cpp
      - gcc
      - gcc-c++
      - glibc
      - glibc.i686
      - glibc-devel
      - glibc-devel.i686
      - ksh
      - libX11
      - libX11.i686
      - libXau
      - libXau.i686
      - libXext
      - libXi
      - libXi.i686
      - libXmu
      - libXtst
      - libXtst.i686
      - libXv
      - libXxf86dga
      - libXxf86misc
      - libaio
      - libaio.i686
      - libaio-devel
      - libaio-devel.i686
      - libdmx
      - libgcc
      - libgcc.i686
      - libmpc
      - libstdc++
      - libstdc++.i686
      - libstdc++-devel
      - libstdc++-devel.i686
      - libxcb
      - libxcb.i686
      - lm_sensors-libs
      - make
      - mpfr
      - smartmontools
      - sysstat
      - sysstat
      - unixODBC
      - unixODBC-devel
      - xorg-x11-utils
      - xorg-x11-xauth
      - zlib-devel
      
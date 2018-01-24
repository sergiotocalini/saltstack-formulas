named-pkgs:
  pkg.installed:
    - pkgs:
      - bind
      - bind-chroot
      - bind-libs
      - bind-libs-lite
      - bind-license
      - bind-utils

named-files:
  file.recurse:
    - name: /etc
    - user: named
    - group: named
    - dir_mode: 664
    - file_mode: 660
    - makedirs: True
    - include_empty: True
    - source: salt://named/files
    - exclude_pat: 'E@.*(.svn)|(.git).*'

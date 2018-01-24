base:
  pkg.installed:
    - pkgs:
      - emacs-nox
  file.managed:
    - name: /usr/share/emacs/site-lisp/default.el
    - source: salt://base/files/emacs-default.el
    - user: root
    - group: root
    - mode: 644


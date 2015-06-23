{%- set editor = pillar.sublime.editor %}

{%- if editor.enabled %}

sublime_repo:
  pkgrepo.managed:
    - ppa: webupd8team/sublime-text-3

sublime_install:
  pkg.latest:
    - name: sublime-text-installer
    - refresh: True

{%- endif %}
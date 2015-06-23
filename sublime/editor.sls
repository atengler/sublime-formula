{%- set editor = pillar.sublime.editor %}

{%- if editor.enabled %}

pkgrepo.managed:
  - ppa: webupd8team/sublime-text-3

pkg.latest:
  - name: sublime-text-installer
  - refresh: True

{%- endif %}
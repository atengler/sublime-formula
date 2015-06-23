{%- set editor = pillar.sublime.editor %}

{%- if editor.enabled %}

sublime_repo:
  pkgrepo.managed:
    - ppa: webupd8team/sublime-text-3

sublime_package:
  pkg.latest:
    - name: sublime-text-installer
    - refresh: True

/home/tux/.config/sublime-text-3/Packages/User/Package\ Control.sublime-settings:
  file.managed:
  - source: salt://sublime/files/Package Control.sublime-settings
  - template: jinja
  - require:
    - pkg: sublime_package

/home/tux/.config/sublime-text-3/Packages/User/Anaconda.sublime-settings:
  file.managed:
  - source: salt://sublime/files/Anaconda.sublime-settings
  - template: jinja
  - require:
    - pkg: sublime_package

/home/tux/.config/sublime-text-3/Packages/User/Preferences.sublime-settings:
  file.managed:
  - source: salt://sublime/files/Preferences.sublime-settings
  - template: jinja
  - require:
    - pkg: sublime_package

{%- endif %}
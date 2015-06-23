{%- set editor = pillar.sublime.editor %}

{%- if editor.enabled %}

sublime_repo:
  pkgrepo.managed:
    - ppa: webupd8team/sublime-text-3

sublime_package:
  pkg.latest:
    - name: sublime-text-installer
    - refresh: True

install-otrs:
  cmd.run:
    - name: |
        wget https://sublime.wbond.net/Package%20Control.sublime-package
    - cwd: /home/tux/.config/sublime-text-3/Installed Packages/
    - shell: /bin/bash
    - timeout: 300
    - unless: test -x /home/tux/.config/sublime-text-3/Installed Packages/Package Control.sublime-package
    - require:
      - pkg: sublime_package

/home/tux/.config/sublime-text-3/Packages/User/Package Control.sublime-settings:
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
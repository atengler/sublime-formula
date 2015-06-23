{%- if editor.enabled %}

install-sublime-text:
  cmd.run:
    - name: |
        cd /opt
        git clone --depth 1 --branch rel-4_0_8 https://github.com/OTRS/otrs.git
    - cwd: /opt
    - shell: /bin/bash
    - timeout: 300
    - unless: test -x /opt/otrs

{%- endif %}
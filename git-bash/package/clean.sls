# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_clean = tplroot ~ '.config.clean' %}
{%- from tplroot ~ "/map.jinja" import mapdata as git_bash with context %}
{%- set config = git_bash.get('config') or {} %}
{%- set install_prefix = config.get(
      'install_root', 'C:\\Program Files\\Git'
    ) %}
{%- set temp_dir = salt['environ.get'](
      'TEMP', 'C:\\Windows\\Temp'
    ) %}
{%- set installer_path = [
      temp_dir, 'git-bash-installer.exe'
    ] | join('\\') %}
{%- set uninstaller_path = [
      install_prefix, 'unins000.exe'
    ] | join('\\') %}


include:
  - {{ sls_config_clean }}

{#- Run uninstaller silently if present; fallback to forced tree removal #}
{%- set uninstaller_cmd = [
      'if (Test-Path',
      "'" ~ uninstaller_path ~ "') {",
      "Start-Process -FilePath '" ~ uninstaller_path ~ "'",
      "-ArgumentList '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART'",
      "-NoNewWindow -Wait } else {",
      "Remove-Item -Path '" ~ install_prefix ~ "'",
      "-Recurse -Force -ErrorAction SilentlyContinue }"
    ] | join(' ') %}

Remove Git Bash Cached Installer:
  file.absent:
    - name: {{ installer_path | json }}
    - require:
      - sls: {{ sls_config_clean }}

Remove Git Bash Installation Directory:
  cmd.run:
    - name: {{ uninstaller_cmd | json }}
    - require:
      - sls: {{ sls_config_clean }}
    - shell: powershell

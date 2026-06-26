# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as git_bash with context %}

{%- set config = git_bash.get('config') or {} %}
{%- set install_prefix = config.get(
      'install_root', 'C:\\Program Files\\Git'
    ) %}

{%- set desktop_lnk = [
      'C:\\Users\\Public\\Desktop', 'Git Bash.lnk'
    ] | join('\\') %}
{%- set gitconfig_path = [install_prefix, 'etc', 'gitconfig'] |
      join('\\') %}
{%- set profile_path = [
      install_prefix, 'etc', 'profile.d', 'corporate.sh'
    ] | join('\\') %}
{%- set start_lnk = [
      'C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs',
      'Git Bash.lnk'
    ] | join('\\') %}

Remove Corporate Shell Profile:
  file.absent:
    - name: {{ profile_path | json }}

Remove Git Bash Desktop Shortcut:
  file.absent:
    - name: {{ desktop_lnk | json }}

Remove Git Bash Start Menu Shortcut:
  file.absent:
    - name: {{ start_lnk | json }}

Remove System Gitconfig File:
  file.absent:
    - name: {{ gitconfig_path | json }}

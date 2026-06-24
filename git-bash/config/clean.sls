# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_service_clean = tplroot ~ '.service.clean' %}
{%- from tplroot ~ "/map.jinja" import mapdata as git_bash with context %}
{%- set config = git_bash.get('config') or {} %}
{%- set install_prefix = config.get(
      'install_root', 'C:\\Program Files\\Git'
    ) %}
{%- set gitconfig_path = [install_prefix, 'etc', 'gitconfig'] | join('\\') %}
{%- set profile_path = [
      install_prefix, 'etc', 'profile.d', 'corporate.sh'
    ] | join('\\') %}

Remove Corporate Shell Profile:
  file.absent:
    - name: {{ profile_path | json }}

Remove System Gitconfig File:
  file.absent:
    - name: {{ gitconfig_path | json }}

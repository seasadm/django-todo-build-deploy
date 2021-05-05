{{- define "postgres_envs" }}

{{- range $name, $value := .Values.global.postgres }}
- name: {{ $name }}
  value: {{ $value }}
{{- end }}

{{- end }}

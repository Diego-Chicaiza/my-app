{{/*
Genera el nombre completo del recurso
*/}}
{{- define "backend.fullname" -}}
{{- printf "%s-%s" .Release.Name "backend" -}}
{{- end }}

{{/*
Genera el nombre base del recurso
*/}}
{{- define "backend.name" -}}
backend
{{- end }}

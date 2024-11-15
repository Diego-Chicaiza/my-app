{{/*
Genera el nombre completo del recurso
*/}}
{{- define "database.fullname" -}}
{{- printf "%s-%s" .Release.Name "database" -}}
{{- end }}

{{/*
Genera el nombre base del recurso
*/}}
{{- define "database.name" -}}
database
{{- end }}

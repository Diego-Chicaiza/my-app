{{/*
Genera el nombre completo del recurso
*/}}
{{- define "frontend.fullname" -}}
{{- printf "%s-%s" .Release.Name "frontend" -}}
{{- end }}

{{/*
Genera el nombre base del recurso
*/}}
{{- define "frontend.name" -}}
frontend
{{- end }}

{{- define "twenty.name" -}}
{{ .Chart.Name }}
{{- end -}}

{{- define "twenty.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{ .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else -}}
{{ .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end -}}
{{- end -}}

{{- define "twenty.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/name: {{ include "twenty.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "twenty.selectorLabels" -}}
app.kubernetes.io/name: {{ include "twenty.name" . }}
{{- end -}}

{{- define "twenty.image" -}}
{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}
{{- end -}}

{{- define "twenty.tokenSecretName" -}}
{{ .Values.secrets.tokens.name | default (printf "%s-tokens" (include "twenty.fullname" .)) }}
{{- end -}}

{{- define "twenty.secretValue" -}}
{{- $ctx := index . "context" -}}
{{- $secretName := index . "secretName" -}}
{{- $key := index . "key" -}}
{{- $provided := index . "provided" | default "" -}}
{{- $length := index . "length" | default 32 -}}
{{- $existing := lookup "v1" "Secret" $ctx.Release.Namespace $secretName -}}
{{- if and $existing (index $existing.data $key) -}}
{{ index $existing.data $key | b64dec }}
{{- else if $provided -}}
{{ $provided }}
{{- else -}}
{{ randAlphaNum $length }}
{{- end -}}
{{- end -}}

{{- define "twenty.databaseUrl" -}}
{{- printf "postgres://%s:$(DATABASE_PASSWORD)@%s:%v/%s" (.Values.database.user | urlquery) .Values.database.host .Values.database.port .Values.database.name -}}
{{- end -}}

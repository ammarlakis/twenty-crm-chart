{{- define "twenty.name" -}}
{{ .Values.nameOverride | default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "twenty.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{ .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else -}}
{{ .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end -}}
{{- end -}}

{{- define "twenty.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/name: {{ include "twenty.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- with .Values.commonLabels }}
{{- toYaml . }}
{{- end }}
{{- end -}}

{{- define "twenty.selectorLabels" -}}
app.kubernetes.io/name: {{ include "twenty.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "twenty.image" -}}
{{- $tag := .Values.image.tag | default .Chart.AppVersion -}}
{{- if .Values.image.digest -}}
{{ .Values.image.repository }}:{{ $tag }}@{{ .Values.image.digest }}
{{- else -}}
{{ .Values.image.repository }}:{{ $tag }}
{{- end -}}
{{- end -}}

{{- define "twenty.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{ .Values.serviceAccount.name | default (include "twenty.fullname" .) }}
{{- else -}}
{{ .Values.serviceAccount.name | default "default" }}
{{- end -}}
{{- end -}}

{{- define "twenty.encryptionSecretName" -}}
{{ .Values.secrets.encryption.existingSecret | default .Values.secrets.encryption.name | default (printf "%s-encryption" (include "twenty.fullname" .)) }}
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

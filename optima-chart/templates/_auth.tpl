{{- define "authms-optima.fullname" -}}
{{- if .Values.auth.fullnameOverride }}
{{- .Values.auth.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.auth.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "authms-optima.labels" -}}
helm.sh/chart: {{ include "optima-chart.chart" . }}
{{ include "authms-optima.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "authms-optima.selectorLabels" -}}
app.kubernetes.io/name: {{ include "authms-optima.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
{{- define "accounts-optima.fullname" -}}
{{- if .Values.account.fullnameOverride }}
{{- .Values.account.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.account.nameOverride }}
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
{{- define "accounts-optima.labels" -}}
helm.sh/chart: {{ include "optima-chart.chart" . }}
{{ include "accounts-optima.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "accounts-optima.selectorLabels" -}}
app.kubernetes.io/name: {{ include "accounts-optima.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
{{- define "expenditure-optima.fullname" -}}
{{- if .Values.expenditure.fullnameOverride }}
{{- .Values.expenditure.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.expenditure.nameOverride }}
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
{{- define "expenditure-optima.labels" -}}
helm.sh/chart: {{ include "optima-chart.chart" . }}
{{ include "expenditure-optima.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "expenditure-optima.selectorLabels" -}}
app.kubernetes.io/name: {{ include "expenditure-optima.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
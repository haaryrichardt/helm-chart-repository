{{- define "poolingfund-optima.fullname" -}}
{{- if .Values.poolingFund.fullnameOverride }}
{{- .Values.poolingFund.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.poolingFund.nameOverride }}
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
{{- define "poolingfund-optima.labels" -}}
helm.sh/chart: {{ include "optima-chart.chart" . }}
{{ include "poolingfund-optima.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "poolingfund-optima.selectorLabels" -}}
app.kubernetes.io/name: {{ include "poolingfund-optima.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
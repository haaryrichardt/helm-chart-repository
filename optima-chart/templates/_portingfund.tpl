{{- define "portingfund-optima.fullname" -}}
{{- if .Values.portingFund.fullnameOverride }}
{{- .Values.portingFund.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.portingFund.nameOverride }}
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
{{- define "portingfund-optima.labels" -}}
helm.sh/chart: {{ include "optima-chart.chart" . }}
{{ include "portingfund-optima.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "portingfund-optima.selectorLabels" -}}
app.kubernetes.io/name: {{ include "portingfund-optima.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
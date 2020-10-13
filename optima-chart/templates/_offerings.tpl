{{- define "offerings-optima.fullname" -}}
{{- if .Values.offering.fullnameOverride }}
{{- .Values.offering.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.offering.nameOverride }}
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
{{- define "offerings-optima.labels" -}}
helm.sh/chart: {{ include "optima-chart.chart" . }}
{{ include "offerings-optima.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "offerings-optima.selectorLabels" -}}
app.kubernetes.io/name: {{ include "offerings-optima.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
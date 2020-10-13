{{- define "mortgage-optima.fullname" -}}
{{- if .Values.mortgage.fullnameOverride }}
{{- .Values.mortgage.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.mortgage.nameOverride }}
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
{{- define "mortgage-optima.labels" -}}
helm.sh/chart: {{ include "optima-chart.chart" . }}
{{ include "mortgage-optima.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "mortgage-optima.selectorLabels" -}}
app.kubernetes.io/name: {{ include "mortgage-optima.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
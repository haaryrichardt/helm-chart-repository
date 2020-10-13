{{- define "transaction-optima.fullname" -}}
{{- if .Values.transaction.transactionOverride }}
{{- .Values.transaction.transactionOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.dbnameOverride }}
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
{{- define "transaction-optima.labels" -}}
helm.sh/chart: {{ include "optima-chart.chart" . }}
{{ include "transaction-optima.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "transaction-optima.selectorLabels" -}}
app.kubernetes.io/name: {{ include "transaction-optima.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
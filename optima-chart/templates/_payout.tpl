{{- define "payout-optima.fullname" -}}
{{- if .Values.payout.fullnameOverride }}
{{- .Values.payout.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.payout.nameOverride }}
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
{{- define "payout-optima.labels" -}}
helm.sh/chart: {{ include "optima-chart.chart" . }}
{{ include "payout-optima.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "payout-optima.selectorLabels" -}}
app.kubernetes.io/name: {{ include "payout-optima.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
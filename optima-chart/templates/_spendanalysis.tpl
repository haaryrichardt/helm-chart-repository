{{- define "spendanalysis-optima.fullname" -}}
{{- if .Values.spendanalysis.spendanalysisOverride }}
{{- .Values.spendanalysis.spendanalysisOverride | trunc 63 | trimSuffix "-" }}
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
{{- define "spendanalysis-optima.labels" -}}
helm.sh/chart: {{ include "optima-chart.chart" . }}
{{ include "spendanalysis-optima.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "spendanalysis-optima.selectorLabels" -}}
app.kubernetes.io/name: {{ include "spendanalysis-optima.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
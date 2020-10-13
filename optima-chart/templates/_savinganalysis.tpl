{{- define "savinganalysis-optima.fullname" -}}
{{- if .Values.savinganalysis.savinganalysisOverride }}
{{- .Values.savinganalysis.savinganalysisOverride | trunc 63 | trimSuffix "-" }}
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
{{- define "savinganalysis-optima.labels" -}}
helm.sh/chart: {{ include "optima-chart.chart" . }}
{{ include "savinganalysis-optima.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "savinganalysis-optima.selectorLabels" -}}
app.kubernetes.io/name: {{ include "savinganalysis-optima.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
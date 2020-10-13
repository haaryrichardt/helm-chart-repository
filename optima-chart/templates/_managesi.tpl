{{- define "managesi-optima.fullname" -}}
{{- if .Values.managesi.fullnameOverride }}
{{- .Values.managesi.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.managesi.nameOverride }}
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
{{- define "managesi-optima.labels" -}}
helm.sh/chart: {{ include "optima-chart.chart" . }}
{{ include "managesi-optima.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "managesi-optima.selectorLabels" -}}
app.kubernetes.io/name: {{ include "managesi-optima.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
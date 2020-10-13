{{- define "wms-optima.fullname" -}}
{{- if .Values.wms.fullnameOverride }}
{{- .Values.wms.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.wms.nameOverride }}
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
{{- define "wms-optima.labels" -}}
helm.sh/chart: {{ include "optima-chart.chart" . }}
{{ include "wms-optima.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "wms-optima.selectorLabels" -}}
app.kubernetes.io/name: {{ include "wms-optima.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
{{- define "twowaypooling-optima.fullname" -}}
{{- if .Values.twoWayPooling.fullnameOverride }}
{{- .Values.twoWayPooling.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.twoWayPooling.nameOverride }}
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
{{- define "twowaypooling-optima.labels" -}}
helm.sh/chart: {{ include "optima-chart.chart" . }}
{{ include "twowaypooling-optima.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "twowaypooling-optima.selectorLabels" -}}
app.kubernetes.io/name: {{ include "twowaypooling-optima.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
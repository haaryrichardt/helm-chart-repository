{{- define "eureka-optima.fullname" -}}
{{- if .Values.eureka.eurekaOverride }}
{{- .Values.eureka.eurekaOverride | trunc 63 | trimSuffix "-" }}
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
{{- define "eureka-optima.labels" -}}
helm.sh/chart: {{ include "optima-chart.chart" . }}
{{ include "eureka-optima.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "eureka-optima.selectorLabels" -}}
app.kubernetes.io/name: {{ include "eureka-optima.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
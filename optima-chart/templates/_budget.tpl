{{- define "budget-optima.fullname" -}}
{{- if .Values.budget.budgetOverride }}
{{- .Values.budget.budgetOverride | trunc 63 | trimSuffix "-" }}
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
{{- define "budget-optima.labels" -}}
helm.sh/chart: {{ include "optima-chart.chart" . }}
{{ include "budget-optima.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "budget-optima.selectorLabels" -}}
app.kubernetes.io/name: {{ include "budget-optima.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
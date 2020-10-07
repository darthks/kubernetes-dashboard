{{- define "chartwide-annotations" -}}
{{- if .Values.deploymentWideAnnotations }}
{{- range $key, $value := .Values.deploymentWideAnnotations }}
{{ $key }}: {{ $value | quote }}
{{- end }}
{{- end }}
helm.sh/release-time: {{ .Release.Time }}
helm.sh/release-name: {{ .Release.Name }}
helm.sh/release-namespace: {{ .Release.Namespace }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/supported-version: {{ .Chart.AppVersion }}
app.kubernetes.io/part-of: {{ .Values.applicationSet | quote }}
{{- end -}}

{{- define "chartwide-additional-annotations" -}}
helm.sh/hook: pre-install,pre-delete,pre-upgrade,pre-rollback
helm.sh/hook-weight: "0"
helm.sh/hook-delete-policy: "before-hook-creation"
{{- end -}}

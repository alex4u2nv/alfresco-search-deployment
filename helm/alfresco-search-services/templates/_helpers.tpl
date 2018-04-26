{{/*
THE TEMPLATES DEFINED BELOW WILL BE USED BY OTHER CHARTS.
"alfresco-search-services" IS THE CHART NAME. THE VALUE HAS TO BE HARD CODED.
".Chart.Name" CANNOT BE USED FOR THESE TEMPLATES AS THE TEMPLATE WILL BE REFERENCED FROM OTHER CHARTS.
*/}}

{{/*
Get Alfresco Search Services host - "alfresco-search-services" is the chart name.
The value has to be hard coded. ".Chart.Name" cannot be used here as the template can/will be referenced from another chart.
*/}}
{{- define "alfresco-search-services.host" -}}
{{- printf "%s-%s-%s" .Release.Name "alfresco-search-services" "solr" -}}
{{- end -}}

{{/*
Get Alfresco Search Services port - "alfresco-search-services" is the chart name.
The value has to be hard coded. ".Chart.Name" cannot be used here as the template can/will be referenced from another chart.
*/}}
{{- define "alfresco-search-services.port" -}}
{{- print (index .Values "alfresco-search-services" "service" "externalPort") -}}
{{- end -}}

{{/* ======================================================================== */}}

{{/* THE TEMPLATES DEFINED BELOW ARE SUPPOSSED TO BE USED FOR THIS CHART ONLY */}}

{{/*
Get Alfresco Search Services full name
*/}}
{{- define "alfresco-search-services.fullName" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Get Alfresco Search Services internal port
*/}}
{{- define "alfresco-search-services.internalPort" -}}
{{- if and (.Values.type) (eq (.Values.type | toString) "insight-engine") }}
{{- print .Values.insightEngineImage.internalPort -}}
{{- else }}
{{- print .Values.searchServicesImage.internalPort -}}
{{- end }}
{{- end -}}

{{/*
Get Alfresco Search Services pull policy
*/}}
{{- define "alfresco-search-services.pullPolicy" -}}
{{- if and (.Values.type) (eq (.Values.type | toString) "insight-engine") }}
{{- print .Values.insightEngineImage.pullPolicy -}}
{{- else }}
{{- print .Values.searchServicesImage.pullPolicy -}}
{{- end }}
{{- end -}}

{{/*
Get Alfresco Search Services docker image
*/}}
{{- define "alfresco-search-services.dockerImage" -}}
{{- if and (.Values.type) (eq (.Values.type | toString) "insight-engine") }}
{{- printf "%s:%s" .Values.searchServicesImage.repository .Values.searchServicesImage.tag -}}
{{- else }}
{{- printf "%s:%s" .Values.insightEngineImage.repository .Values.insightEngineImage.tag -}}
{{- end }}
{{- end -}}
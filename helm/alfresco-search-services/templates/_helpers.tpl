{{/*
Create a default fully qualified name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "alfresco-search-services.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

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
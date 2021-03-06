{{/*

Copyright © 2021 Bedag Informatik AG

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

*/}}
{{- define "bedag-lib.manifest.job.values" -}}
  {{- include "lib.utils.strings.template" (dict "value" (include "bedag-lib.utils.common.mergedValues" (dict "type" "job" "root" .)) "context" .context) -}}
{{- end }}

{{- define "bedag-lib.manifest.job" -}}
  {{- if .context -}}
    {{- $context := .context -}}
    {{- $job := (fromYaml (include "bedag-lib.manifest.job.values" .)) -}}
    {{- if $job.enabled }}
kind: Job
      {{- if $job.apiVersion }}
apiVersion: {{ $job.apiVersion }}
      {{- else }}
apiVersion: batch/v1
      {{- end }}
{{- include "bedag-lib.template.job" (set . "job" $job) | nindent 0 }}
    {{- end }}
  {{- end }}
{{- end -}}

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
{{- define "bedag-lib.manifest.pod.values" -}}
  {{- include "lib.utils.strings.template" (dict "value" (include "bedag-lib.utils.common.mergedValues" (dict "type" "pod" "root" .)) "context" .context) -}}
{{- end }}

{{- define "bedag-lib.manifest.pod" -}}
  {{- if .context -}}
    {{- $context := .context -}}
    {{- $pod := (fromYaml (include "bedag-lib.manifest.pod.values" .)) -}}
kind: Pod
    {{- if $pod.apiVersion }}
apiVersion: {{ $pod.apiVersion }}
    {{- else }}
apiVersion: v1
    {{- end }}
    {{- $podTpl := fromYaml (include "bedag-lib.template.pod" (set . "pod" $pod)) }}
    {{- $_ := set $podTpl.metadata "name" (include "bedag-lib.utils.common.fullname" .) }}
    {{- toYaml $podTpl | nindent 0 }}
  {{- else }}
    {{- fail "Template requires '.context' as arguments" }}
  {{- end }}
{{- end }}

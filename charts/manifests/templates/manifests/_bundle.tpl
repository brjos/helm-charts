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

{{- define "bedag-lib.manifest.bundle" -}}
  {{- $manifestPath := "bedag-lib.manifest." -}}
  {{- if and .context (kindIs "map" .context) .bundle (kindIs "map" .bundle) -}}
    {{- $context := mergeOverwrite .context (default dict (fromYaml (include "lib.utils.dicts.parentAppend" .bundle.common))) -}}
    {{- if $.bundle.name }}
      {{- $_ := set $context "bundlename" $.bundle.name -}}
    {{- end }}
    {{- $_ := set $context "Bundle" $.bundle.resources -}}
    {{- if .bundle.resources -}}
      {{- range .bundle.resources -}}
        {{- $type := required "Missing required field '.type' for resource in bundle" .type | lower }}
        {{- $manifest := (cat $manifestPath $type | nospace) -}}
        {{- if and (eq $type "raw") .manifest }}
---{{- include "lib.utils.strings.template" (dict "value" .manifest "context" $context) | nindent 0 }}
        {{- else }}
          {{- $v_params := set . "context" $context }}
          {{- $values := (fromYaml (include (cat $manifest ".values" | nospace) $v_params)) }}
          {{- $parameters := (dict "type" $type "values" $values "name" (default "" .name) "fullname" (default "" .fullname) "context" $context) }}
          {{- $resource := include $manifest $parameters }}
          {{- if $resource }}
---{{- $resource | nindent 0 }}
            {{- include "bedag-lib.template.bundleExtras" $parameters | nindent 0 -}}
          {{- end -}}
        {{- end -}}
      {{- end -}}
    {{- else }}
      {{- fail "Missing Keys or Wrong YAML structure!" }}
    {{- end }}
  {{- end -}}
{{- end -}}

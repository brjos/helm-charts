# activemq

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 5.11.1](https://img.shields.io/badge/AppVersion-5.11.1-informational?style=flat-square)

A Helm chart for ActiveMQ

**Homepage:** <https://activemq.apache.org/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Bruno Jost | bruno.jost@bedag.ch |  |
| SRE | sre@bedag.ch |  |

## Source Code

* <https://www.github.com/rmohr/docker-activemq>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://bedag.github.io/helm-charts/ | manifests | 0.4.9 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| commonLabels | object | `{}` | Common Labels are added to each kubernetes resource manifest. |
| fullnameOverride | string | `""` | Overwrite `lib.utils.common.fullname` output |
| global.defaultTag | string | `""` | Global Docker Image Tag declaration. Will be used as default tag, if no tag is given by child |
| global.imagePullPolicy | string | `""` | Global Docker Image Pull Policy declaration. Will overwrite all child .pullPolicy fields. |
| global.imagePullSecrets | list | `[]` | Global Docker Image Pull Secrets declaration. Added to local Docker Image Pull Secrets. |
| global.imageRegistry | string | `""` | Global Docker Image Registry declaration. Will overwrite all child .registry fields. |
| global.storageClass | string | `""` | Global StorageClass declaration. Can be used to overwrite StorageClass fields. |
| kubeCapabilities | string | `$.Capabilities.KubeVersion.GitVersion` | Overwrite the Kube GitVersion |
| nameOverride | string | `""` | Overwrite "lib.internal.common.name" output |
| overwriteLabels | object | `{}` | Overwrites default labels, but not resource specific labels and common labels |
| proxy.httpProxy.host | string | `""` | Configure HTTP Proxy Hostname/IP (without protocol://) |
| proxy.httpProxy.port | int | `nil` | Configure HTTP Proxy Port |
| proxy.httpProxy.protocol | string | http | Configure HTTP Proxy Protocol (http/https) |
| proxy.httpsProxy.host | string | `""` | Configure HTTPS Proxy Hostname/IP (without protocol://) |
| proxy.httpsProxy.port | int | `nil` | Configure HTTPS Proxy Port |
| proxy.httpsProxy.protocol | string | http | Configure HTTPS Proxy Protocol (http/https) |
| proxy.noProxy | list | `[]` | Configure No Proxy Hosts noProxy: [ "localhost", "127.0.0.1" ] |
| pvc.accessModes | list | `["ReadWriteOnce"]` | Configure PVC [Access Modes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes) |
| pvc.annotations | object | `{}` | Configure PVC additional Annotations ([Monitor Labels](https://www.weave.works/docs/cloud/latest/tasks/monitor/configuration-k8s/)) |
| pvc.apiVersion | string | `""` | Configure the api version used for the Pod resource |
| pvc.dataSource | string | `nil` | Data Sources are currently only supported for [CSI Volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#volume-snapshot-and-restore-volume-from-snapshot-support) |
| pvc.enabled | bool | `false` | Enable PVC Resource |
| pvc.labels | object | `{}` | Merges given labels with common labels |
| pvc.selector | object | `{}` | Configure PVC [Selector](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#selector) |
| pvc.size | string | 1Gi | Configure Persistent Volume Claim Storage Size |
| pvc.storageClass | string | `""` | Configure PVC [Storage Class](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#class-1) |
| pvc.volumeName | string | `"activemq"` | Persistent Volume Reference Name |
| selectorLabels | object | `{}` | Define default [selectorLabels](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/) |
| service.annotations | object | `{}` | Configure Service additional Annotations ([Monitor Labels](https://www.weave.works/docs/cloud/latest/tasks/monitor/configuration-k8s/)) |
| service.apiVersion | string | v1 | Configure the api version used |
| service.enabled | bool | `true` | Enable Service Resource |
| service.extraPorts | list | `[]` | Add additional ports to the service |
| service.labels | object | `{}` | Configure Service additional Labels |
| service.loadBalancerIP | string | `""` | Configure Service [loadBalancerIP](https://kubernetes.io/docs/concepts/services-networking/service/#internal-load-balancer). Set the LoadBalancer service type to internal only. |
| service.loadBalancerSourceRanges | list | `[]` | Configure Service [loadBalancerSourceRanges](https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/#restrict-access-for-loadbalancer-service) |
| service.nodePort | string | `""` | Specify the nodePort value for the LoadBalancer and NodePort service types |
| service.port | int | 80 | Configure Service Port (Required) |
| service.portName | string | http | Configure Service Port name |
| service.selector | object | `{}` | Configure Service Selector Labels |
| service.targetPort | string | http | Configure Service TargetPort |
| service.type | string | `"ClusterIP"` | Configure Service [Type](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types). |
| statefulset.affinity | object | `{}` | Pod [Affinity](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity) |
| statefulset.apiVersion | string | `""` | Configure the api version used for the Statefulset resource |
| statefulset.args | object | `{}` | Configure arguments for executed command |
| statefulset.command | object | `{}` | Configure executed container command |
| statefulset.containerFields | object | `{}` | Extra fields used on the container definition |
| statefulset.containerName | string | `.Chart.Name` | Configure Container Name |
| statefulset.environment | list | `[]` | Configure Environment Variables (Refer to values.yaml) |
| statefulset.forceRedeploy | bool | `false` |  |
| statefulset.image.pullPolicy | string | `nil` | Configure Docker Pull Policy. Will be overwritten if set by global variable. |
| statefulset.image.registry | string | `"docker.io"` | Configure Docker Registry. Will be overwritten if set by global variable. |
| statefulset.image.repository | string | `"rmohr/activemq"` | Configure Docker Repository |
| statefulset.image.tag | string | Tag defaults to `.Chart.Appversion`, if not set | Configure Docker Image tag |
| statefulset.imagePullSecrets | list | `[]` | Define [ImagePullSecrets](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/). Will be overwritten if set by global variable. |
| statefulset.initContainers | list | `[]` | Pod [initContainers](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/) |
| statefulset.labels | object | `{}` | Merges given labels with common labels |
| statefulset.lifecycle | object | `{}` | Container [Lifecycle](https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/) |
| statefulset.livenessProbe | object | `{}` | Container [LivenessProbe](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-a-liveness-command) |
| statefulset.nodeSelector | object | `{}` | Pod [NodeSelector](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| statefulset.podAnnotations | object | `{}` | Pod [annotations](https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/) are only added for the pod |
| statefulset.podFields | object | `{}` | Add extra field to the [Pod Template](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.18/#podtemplate-v1-core) if not available as value. |
| statefulset.podLabels | object | `{}` | Pod [labels](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/) are only added for the pod |
| statefulset.podManagementPolicy | string | `""` | Statefulset [Management Policy](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#pod-management-policies). **Statefulset only** |
| statefulset.podSecurityContext | object | `{}` | Pod [SecurityContext](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) |
| statefulset.ports | list | `[{"containerPort":61616,"name":"activemq","protocol":"TCP"}]` | Configure Container Ports |
| statefulset.priorityClassName | string | `""` | Pod [priorityClassName](https://kubernetes.io/docs/concepts/configuration/pod-priority-preemption/#priorityclass) |
| statefulset.readinessProbe | object | `{}` | Container [ReadinessProbe](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-readiness-probes) |
| statefulset.replicaCount | int | `1` | Amount of Replicas deployed |
| statefulset.resources | object | `{}` | Configure Container [Resource](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| statefulset.restartPolicy | string | `nil` | Restart policy for all containers within the pod. One of Always, OnFailure, Never. Default to Always. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#restart-policy |
| statefulset.rollingUpdatePartition | string | `""` | Statefulset [Update Pratition](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#partitions). **Statefulset only** |
| statefulset.securityContext | object | `{}` | Container [SecurityContext](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) |
| statefulset.selectorLabels | object | `{}` | Define SelectorLabels for the Pod Template |
| statefulset.serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| statefulset.serviceAccount.apiVersion | string | v1 | Configure the api version used |
| statefulset.serviceAccount.automountServiceAccountToken | bool | `true` | (bool) AutomountServiceAccountToken indicates whether pods running as this service account should have an API token automatically mounted. |
| statefulset.serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| statefulset.serviceAccount.enabled | bool | `false` | Specifies whether a service account is enabled or not |
| statefulset.serviceAccount.globalPullSecrets | bool | `false` | Evaluate global set pullsecrets and mount, if set |
| statefulset.serviceAccount.imagePullSecrets | list | `[]` | ImagePullSecrets is a list of references to secrets in the same namespace to use for pulling any images in pods that reference this ServiceAccount. |
| statefulset.serviceAccount.labels | object | `{}` | Merges given labels with common labels |
| statefulset.serviceAccount.name | string | `""` | If not set and create is true, a name is generated using the fullname template |
| statefulset.serviceAccount.secrets | list | `[]` | Secrets is the list of secrets allowed to be used by pods running using this ServiceAccount |
| statefulset.serviceName | string | `""` | Define a Service for the Statefulset |
| statefulset.sidecars | list | `[]` | Allows to add sidecars to your [maincar]](https://kubernetes.io/docs/concepts/workloads/pods/#using-pods) |
| statefulset.startupProbe | object | `{}` | Container [StartupProbe](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-startup-probes) |
| statefulset.statefulsetExtras | object | `{}` | Extra Fields for Statefulset Manifest |
| statefulset.tolerations | object | `{}` | Pod [Tolerations](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/) |
| statefulset.updateStrategy | string | `"RollingUpdate"` | Statefulset [Update Strategy](https://kubernetes.io/docs/tutorials/stateful-application/basic-stateful-set/#updating-statefulsets). **Statefulset only** |
| statefulset.volumeClaimTemplates | list | `[]` | Statefulset [volumeClaimTemplates](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#components). **Statefulset only** |
| statefulset.volumeMounts | list | `[]` | Configure Container [volumeMounts](https://kubernetes.io/docs/tasks/configure-pod-container/configure-volume-storage/) |
| statefulset.volumes | list | `[]` | Additional [Volumes](https://kubernetes.io/docs/concepts/storage/volumes/) |
| timezone | string | `"Europe/Zurich"` | Define Container Timezone (Sets TZ Environment) |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)

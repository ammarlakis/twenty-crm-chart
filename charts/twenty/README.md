# twenty

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.19.1](https://img.shields.io/badge/AppVersion-v1.19.1-informational?style=flat-square)

Twenty CRM

## Values

| Key                                                       | Type   | Default                                                     | Description |
| --------------------------------------------------------- | ------ | ----------------------------------------------------------- | ----------- |
| affinity                                                  | object | `{}`                                                        |             |
| database.host                                             | string | `""`                                                        |             |
| database.name                                             | string | `"twenty"`                                                  |             |
| database.passwordSecret.key                               | string | `"password"`                                                |             |
| database.passwordSecret.name                              | string | `""`                                                        |             |
| database.port                                             | int    | `5432`                                                      |             |
| database.user                                             | string | `"twenty_app_user"`                                         |             |
| frontend.overrideServerBaseUrl                            | bool   | `false`                                                     |             |
| frontend.serverBaseUrl                                    | string | `""`                                                        |             |
| fullnameOverride                                          | string | `""`                                                        |             |
| image.pullPolicy                                          | string | `"IfNotPresent"`                                            |             |
| image.repository                                          | string | `"twentycrm/twenty"`                                        |             |
| image.tag                                                 | string | `""`                                                        |             |
| nodeSelector                                              | object | `{}`                                                        |             |
| podSecurityContext.fsGroup                                | int    | `1000`                                                      |             |
| podSecurityContext.runAsUser                              | int    | `1000`                                                      |             |
| redisUrl                                                  | string | `"redis://twenty-redis-master.apps.svc.cluster.local:6379"` |             |
| secrets.tokens.accessToken                                | string | `""`                                                        |             |
| secrets.tokens.name                                       | string | `"twenty-tokens"`                                           |             |
| server.dockerDataPersistence.accessModes[0]               | string | `"ReadWriteOnce"`                                           |             |
| server.dockerDataPersistence.enabled                      | bool   | `true`                                                      |             |
| server.dockerDataPersistence.size                         | string | `"100Mi"`                                                   |             |
| server.dockerDataPersistence.storageClass                 | string | `""`                                                        |             |
| server.env.ACCESS_TOKEN_EXPIRES_IN                        | string | `"7d"`                                                      |             |
| server.env.API_RATE_LIMITING_SHORT_LIMIT                  | string | `"100"`                                                     |             |
| server.env.API_RATE_LIMITING_SHORT_TTL_IN_MS              | string | `"1000"`                                                    |             |
| server.env.DEFAULT_SUBDOMAIN                              | string | `"app"`                                                     |             |
| server.env.IS_MULTIWORKSPACE_ENABLED                      | string | `"false"`                                                   |             |
| server.env.IS_WORKSPACE_CREATION_LIMITED_TO_SERVER_ADMINS | string | `"true"`                                                    |             |
| server.env.LOGIN_TOKEN_EXPIRES_IN                         | string | `"1h"`                                                      |             |
| server.env.SIGN_IN_PREFILLED                              | string | `"false"`                                                   |             |
| server.env.STORAGE_TYPE                                   | string | `"local"`                                                   |             |
| server.persistence.accessModes[0]                         | string | `"ReadWriteOnce"`                                           |             |
| server.persistence.enabled                                | bool   | `true`                                                      |             |
| server.persistence.size                                   | string | `"10Gi"`                                                    |             |
| server.persistence.storageClass                           | string | `""`                                                        |             |
| server.replicaCount                                       | int    | `1`                                                         |             |
| server.resources.limits.cpu                               | string | `"1000m"`                                                   |             |
| server.resources.limits.memory                            | string | `"1024Mi"`                                                  |             |
| server.resources.requests.cpu                             | string | `"250m"`                                                    |             |
| server.resources.requests.memory                          | string | `"256Mi"`                                                   |             |
| server.service.port                                       | int    | `3000`                                                      |             |
| server.service.type                                       | string | `"ClusterIP"`                                               |             |
| serverUrl                                                 | string | `""`                                                        |             |
| tolerations                                               | list   | `[]`                                                        |             |
| worker.command[0]                                         | string | `"yarn"`                                                    |             |
| worker.command[1]                                         | string | `"worker:prod"`                                             |             |
| worker.replicaCount                                       | int    | `1`                                                         |             |
| worker.resources.limits.cpu                               | string | `"1000m"`                                                   |             |
| worker.resources.limits.memory                            | string | `"2048Mi"`                                                  |             |
| worker.resources.requests.cpu                             | string | `"250m"`                                                    |             |
| worker.resources.requests.memory                          | string | `"1024Mi"`                                                  |             |

---

Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)

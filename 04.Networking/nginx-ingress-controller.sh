kubectl create namespace ingress-space
kubectl create configmap nginx-configuration --namespace ingress-space
kubectl create serviceaccount ingress-serviceaccount --namespace ingress-space

#롤, 롤바인딩 생성
NAME           CREATED AT
ingress-role   2020-11-28T15:51:59Z
controlplane $ k describe role ingress-role -n ingress-space
Name:         ingress-role
Labels:       app.kubernetes.io/name=ingress-nginx
              app.kubernetes.io/part-of=ingress-nginx
Annotations:  <none>
PolicyRule:
  Resources   Non-Resource URLs  Resource Names                     Verbs
  ---------   -----------------  --------------                     -----
  configmaps  []                 []                                 [get create]
  configmaps  []                 [ingress-controller-leader-nginx]  [get update]
  endpoints   []                 []                                 [get]
  namespaces  []                 []                                 [get]
  pods        []                 []                                 [get]
  secrets     []                 []                                 [get]

Name:         ingress-role-binding
Labels:       app.kubernetes.io/name=ingress-nginx
              app.kubernetes.io/part-of=ingress-nginx
Annotations:  <none>
Role:
  Kind:  Role
  Name:  ingress-role
Subjects:
  Kind            Name                    Namespace
  ----            ----                    ---------
  ServiceAccount  ingress-serviceaccount

kubectl create -f ingress-controller.yaml

kubectl get nodes -o json
kubectl get nodes -o=jsonpath='{.items[*].metadata.name}'
kubectl get nodes -o=jsonpath='{.items[*].status.nodeInfo.osImage}'
kubectl config view --kubeconfig=my-kube-config -o jsonpath="{.users[*].name}"

kubectl get pv --sort-by=.spec.capacity.storage
NAME       CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM   STORAGECLASS   REASON   AGE
pv-log-4   40Mi       RWX            Retain           Available                                   5m53s
pv-log-1   100Mi      RWX            Retain           Available                                   5m53s
pv-log-2   200Mi      RWX            Retain           Available                                   5m53s
pv-log-3   300Mi      RWX            Retain           Available                                   5m53s

kubectl get pv --sort-by=.spec.capacity.storage -o=custom-columns=NAME:.metadata.name,CAPACITY:.spec.capacity.storage
NAME       CAPACITY
pv-log-4   40Mi
pv-log-1   100Mi
pv-log-2   200Mi
pv-log-3   300Mi

kubectl config view --kubeconfig=my-kube-config -o jsonpath="{.contexts[?(@.context.user=='aws-user')].name}"


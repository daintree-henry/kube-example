#------------- 백업 -----------------
# 1.리소스 정보 백업 : kubectl get all --all-namespaces -o yaml > all-deploy-services.yaml
# 2.ETCD 백업 : 스냅샷 사용 
etcdctl snapshot save snapshot.db
service kube-apiserver stop
etcdctl snapshot restore snapshot.db \
--data-dir /var/lib/etcd-from-backup \
--initial-cluster master-1=https://{IP}:2380,master-2=https://{IP}:2380 \
--initial-cluster-token etcd-cluster-1 \
--initial-advertise-peer-urls https://${INTERNAL_IP}:2380
...

ETCDCTL_API=3 etcdctl --endpoints=https://[127.0.0.1]:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key snapshot save /opt/snapshot-pre-boot.db

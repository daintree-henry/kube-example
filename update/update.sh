# kubectl drain node01 --ignore-daemonsets

# node01 OS 업그레이드 진행

# kubectl uncordon node01

# kubectl cordon ndoe03 -> node03으로 더이상 스케줄링이 진행되지 않음

# 업그레이드 가능한 버전 확인
# kubeadm upgrade plan

# 마스터 노드 드레인
# kubectl drain controlplane --ignore-daemonsets

# 마스터 노드 업그레이드
# apt update 
# apt install kubeadm=1.19.0-00 
# kubeadm upgrade apply v1.19.0 
# apt install kubelet=1.19.0-00
# systemctl restart kubelet

# 마스터 노드 정상화
# kubectl uncordon controlplane

# 워커 노드 드레인
# kubectl drain node01 --ignore-daemonsets

# 워커 노드 업그레이드
# apt update 
# apt install kubeadm=1.19.0-00 
# kubeadm upgrade node
# apt install kubelet=1.19.0-00
# systemctl restart kubelet

# 워커 노드 정상화
# kubectl uncordon node01
#스케줄링 금지 및 내부의 모든 파드를 다른 노드로 이동
kubectl drain <node> 

#스케줄링 금지
kubectl cordon <node> 
#스케줄링 금지 해제
kubectl uncordon <node> 

#버전 조회
kubectl get nodes
 v1{메이저}.11{마이너}.3{패치}

# 업데이트 과정
# 마스터 -> 워커 순으로 진행
# API와 스케줄러 잠시 다운 -> 마스터 업그레이드 후 전략에 따라 워커노드 업그레이드
# 1.전체 노드 한번에 업그레이드 - 다운타임
# 2.한번에 하나의 노드 업그레이드
# 3.새로운 버전의 노드 추가 

#업그레이드 가능한 버전 확인
kubeadm upgrade plan
#마스터 노드 드레인
kubectl drain controlplane --ignore-daemonsets
#마스터 노드 업그레이드
apt update 
apt install kubeadm=1.19.0-00 
kubeadm upgrade apply v1.19.0 
apt install kubelet=1.19.0-00
systemctl restart kubelet
#마스터 노드 정상화
kubectl uncordon controlplane
#워커 노드 드레인
kubectl drain node01 --ignore-daemonsets
#워커 노드 업그레이드
apt update 
apt install kubeadm=1.19.0-00 
kubeadm upgrade node config --kubelet-version 1.19.0-00 
apt install kubelet=1.19.0-00
#systemctl restart kubelet
워커 노드 정상화
#kubectl uncordon node01

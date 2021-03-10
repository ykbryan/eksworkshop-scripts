https://github.com/bottlerocket-os/bottlerocket/blob/develop/QUICKSTART-EKS.md#launch

https://github.com/bottlerocket-os/bottlerocket/blob/develop/sample-eksctl-ssh.yaml

https://github.com/spotinst/weaveworks-eksctl/blob/docs/userdocs/src/usage/spot-ocean-nodegroups.md

export SPOTINST_TOKEN=<spotinst_token>
export SPOTINST_ACCOUNT=<spotinst_account>

spotctl configure

curl -sfL https://spotinst-public.s3.amazonaws.com/integrations/kubernetes/eksctl/eksctl.sh | sh

kubectl -n kube-system logs -f deployment/kube-ops-view

kubectl -n meshwebservice rollout restart deployment expressjs-black expressjs-red expressjs-gateway

https://spot.io/blog/kubernetes-cluster-autoscaler-features-limitations-and-comparisons-to-ocean-by-spot/
#!/bin/bash
eksctl utils associate-iam-oidc-provider \
    --cluster eks-ocean \
    --region ap-northeast-1 \
    --approve

eksctl create iamserviceaccount \
--cluster=eks-ocean \
--region ap-northeast-1 \
--namespace=kube-system \
--name=aws-load-balancer-controller \
--attach-policy-arn=arn:aws:iam::566416766292:policy/AWSLoadBalancerControllerIAMPolicy \
--approve

kubectl apply -k github.com/aws/eks-charts/stable/aws-load-balancer-controller/crds?ref=master

helm repo add eks https://aws.github.io/eks-charts

helm upgrade -i aws-load-balancer-controller \
    eks/aws-load-balancer-controller \
    -n kube-system \
    --set clusterName=eks-ocean \
    --set serviceAccount.create=false \
    --set serviceAccount.name=aws-load-balancer-controller \
    --set image.tag="${LBC_VERSION}"

kubectl -n kube-system rollout status deployment aws-load-balancer-controller

[ℹ]  CloudWatch logging will not be enabled for cluster "eks-ocean" in "ap-northeast-1"
[ℹ]  you can enable it with 'eksctl utils update-cluster-logging --enable-types={SPECIFY-YOUR-LOG-TYPES-HERE (e.g. all)} --region=ap-northeast-1 --cluster=eks-ocean'

#!/bin/bash
eksctl utils associate-iam-oidc-provider \
    --region <region-code> \
    --cluster <your-cluster-name> \
    --approve

eksctl create iamserviceaccount \
--cluster=eks-spot-demo \
--namespace=kube-system \
--name=aws-load-balancer-controller \
--attach-policy-arn=arn:aws:iam::566416766292:policy/AWSLoadBalancerControllerIAMPolicy \
--approve
#!/bin/bash
eksctl utils associate-iam-oidc-provider \
  --cluster eks-ocean \
  --approve

eksctl create iamserviceaccount \
  --cluster eks-ocean \
  --namespace appmesh-system \
  --name appmesh-controller \
  --attach-policy-arn  arn:aws:iam::aws:policy/AWSCloudMapFullAccess,arn:aws:iam::aws:policy/AWSAppMeshFullAccess \
  --override-existing-serviceaccounts \
  --approve
  
  helm upgrade -i appmesh-controller eks/appmesh-controller \
  --namespace appmesh-system \
  --set region=${AWS_REGION} \
  --set serviceAccount.create=false \
  --set serviceAccount.name=appmesh-controller
  
  kubectl -n appmesh-system get all
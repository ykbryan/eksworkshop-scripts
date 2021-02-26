#!/bin/bash
c9builder=$(aws cloud9 describe-environment-memberships --environment-id=$C9_PID | jq -r '.memberships[].userArn')
if echo ${c9builder} | grep -q user; then
	rolearn=${c9builder}
        echo Role ARN: ${rolearn}
elif echo ${c9builder} | grep -q assumed-role; then
        assumedrolename=$(echo ${c9builder} | awk -F/ '{print $(NF-1)}')
        rolearn=$(aws iam get-role --role-name ${assumedrolename} --query Role.Arn --output text) 
        echo Role ARN: ${rolearn}
fi

#create the identity mapping within the cluster
eksctl create iamidentitymapping --cluster eks-spot-demo --arn ${rolearn} --group system:masters --username admin

#verify your entry in the AWS auth map within the console
kubectl describe configmap -n kube-system aws-auth

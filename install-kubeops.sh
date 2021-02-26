#!/bin/bash
helm install kube-ops-view \
stable/kube-ops-view \
--set service.type=LoadBalancer \
--set nodeSelector.intent=control-apps \
--version 1.2.4 \
--set rbac.create=True
kubectl get svc kube-ops-view | tail -n 1 | awk '{ print "Kube-ops-view URL = http://"$4 }'

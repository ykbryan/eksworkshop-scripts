#!/bin/bash
curl --silent --location "https://github.com/spotinst/spotctl/releases/download/v0.0.18/spotctl-linux-amd64-0.0.18.tar.gz" | tar xz -C /tmp
sudo mv -v /tmp/spotctl /usr/local/bin
sudo chmod +x /usr/local/bin/spotctl

curl -sfL https://spotinst-public.s3.amazonaws.com/integrations/kubernetes/eksctl/eksctl.sh | sh 
sudo mv ./bin/eksctl /usr/local/bin && rm -rf ./bin

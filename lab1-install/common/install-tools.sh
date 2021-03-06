#!/usr/bin/env bash

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Variables
export PROJECT=$(gcloud config get-value project)
export WORK_DIR=${WORK_DIR:="${PWD}/workdir"}

## Install Tools
mkdir -p $WORK_DIR/bin

echo "### "
echo "### Begin Tools install"
echo "### "

## Install kubectx
curl -sLO https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx
chmod +x kubectx
mv kubectx $WORK_DIR/bin

# Install Kops
curl -sLO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops-linux-amd64
mv kops-linux-amd64 $WORK_DIR/bin/kops

# Install nomos
gsutil cp gs://config-management-release/released/latest/linux_amd64/nomos nomos
chmod +x nomos
mv nomos $WORK_DIR/bin

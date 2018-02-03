- Install `kubectl`, `gcloud`, and `minikube`:

      brew install kubernetes-helm
      brew install kubernetes-cli
      brew cask install virtualbox
      brew cask install google-cloud-sdk
      curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.25.0/minikube-darwin-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/

## Deploy to GCP Kubernetes Engine

- create yourself a Google Cloud Project
- [log into it with `gcloud`](https://cloud.google.com/kubernetes-engine/docs/quickstart)
- create a k8s cluster
- use `kubectl` to set the cluster

      kubectl config set-cluster <whatever>

- `helm init` to add Helm's Tiller to the cluster

From this directory

- `helm package flask-hw --debug`
- `helm install  flask-hw-0.1.0.tgz`

NB: Check your kubernetes cluster's Master version; this was tested with one on `1.7.12-gke.0`

## Deploy to Minikube

WIP

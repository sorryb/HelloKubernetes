Soruce Code from "Introduction to .Net Microservices"
# Build a Docker image

docker build . -t hello.kubernetes:v1.0

docker run --rm -it -p 9000:80 hello.kubernetes:v1.0

curl http://localhost:9000/weatherforecast

# Install Helm Chart

helm install hello-kubernetes-release ./Helm/

													NAME: hello-kubernetes-release
													LAST DEPLOYED: Thu Oct  8 15:42:42 2020
													NAMESPACE: default
													STATUS: deployed
													REVISION: 1
													TEST SUITE: None


# Switch context

kubectl config get-contexts										# display list of contexts and clusters

kubectl config use-context docker-desktop						# means Docker Desktop


# Check Deployment

kubectl get all --selector app=hellokubernetes					# where 'hellokubernetes' is the label from values.yaml


													NAME                                                       READY   STATUS    RESTARTS   AGE
													pod/hello-kubernetes-release-deployment-5d88d78b5b-fzrrv   1/1     Running   0          2m17s

													NAME                                       TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
													service/hello-kubernetes-release-service   ClusterIP   10.96.160.229   <none>        8888/TCP   2m1

													NAME                                                  READY   UP-TO-DATE   AVAILABLE   AGE
													deployment.apps/hello-kubernetes-release-deployment   1/1     1            1           2m17s

													NAME                                                             DESIRED   CURRENT   READY   AGE
													replicaset.apps/hello-kubernetes-release-deployment-5d88d78b5b   1         1         1       2m17s

kubectl get pods


## Forward port and see the WebApi

kubectl port-forward service/hello-kubernetes-release-service 9999:8888

curl http://localhost:9999/weatherforecast


## Uninstall release

helm uninstall hello-kubernetes-release 
helm list




### Play with images & containers :

docker image ls

docker image rm sorted.carriersubscription.message.listener:local

docker container ls

docker container rm sorted.carriersubscription.message.listener



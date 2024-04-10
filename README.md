# CI CD pipeline for a go web application

### Run & Test application locally
- Clone repo
```
git clone https://github.com/anilabhabaral/ci-cd-go.git
```
- Build application
```
cd ci-cd-go
go build .
```
- Run the Tests
```
go test -v 
```
- Run application
```
./ci-cd-go
```
- Access application
```
curl localhost:8080/greet
curl localhost:8080/hello/Anilabha
```

### Pipeline (CI)
- Clone this repo 
```
git clone https://github.com/anilabhabaral/ci-cd-go.git
```
- Login to Openshift cluster 
```
oc login --token=<TOKEN> --server=<SERVER_URL>
```
- Create new project/namespace in Openshift cluster 
```
oc new-project go-app-pipeline
```
- Install Red Hat OpenShift Pipelines from Operators --> Operator Hub
- Run the following command to see the pipeline service account $
```
oc get serviceaccount pipeline
```

- Create tasks
```
oc apply -f ymls/tasks 
```
- Create pipeline
```
oc apply -f ymls/pipeline 
```
- Check the created pipeline and tasks
```
oc get pipeline,task 
```
- Run the pipeline
```
tkn pipeline start go-pipeline -w name=workspace-test,volumeClaimTemplateFile=https://raw.githubusercontent.com/anilabhabaral/ci-cd-go/main/ymls/pvc/pvc.yml --use-param-defaults
```
- 

# In progress!!!

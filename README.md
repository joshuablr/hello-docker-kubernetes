This is the sample project to use the docker(swarm) with kubernetes.
The python app has been built as a docker image and pushed to AWS ECR repository. 
Using the docker stack we are deploying it in kubernetes as service.


1. Tools 
   1. docker desktop installed
   2. Kubernetes enabled in docker desktop
   3. AWS ECR as docker registry
2. Steps 
   1. Build/Tag/Push docker image
   2. Create docker compose file
   3. Create deployment 
   4. Scale deployment
   5. Delete deployment

### Build/ Tag/ Push docker image
- To build
  - `docker build -t apiv1.2 .`
- to Tag to ECR 
  - `docker tag apiv1.2 911456480347.dkr.ecr.ap-south-1.amazonaws.com/udacity:1.2`
- To push to ECR
  - `docker push 911456480347.dkr.ecr.ap-south-1.amazonaws.com/udacity:1.2`
  
### Creating docker compose file
   We created a simple docker file which has a service and its ports.
   We can add more attributes like replica sets /volumes/ networks to this service resource in the docker file.



### Creating the kubernetes deployment
   Create a docker stack using the docker compose file. 
   Please do not forget to mention the orchestrator name as `kubernetes`. The default is swarm orchestrator.

    ```docker stack deploy --orchestrator kubernetes --compose-file .\docker-compose.yml hello-py-api```

### Removing the kubernetes service deployment
    `docker stack rm --orchestrator kubernetes hello-py-api`

### Scaling pods
>To scale up we can update the deployment using docker command or use kubectl to update the replicas .

- get the deployment names
  
    `kubectl get deployments`
- scale up
  
    `kubectl scale deployments/api --replicas=5` 

- Check pods status

    `kubectl get pods -o wide`

- Scaling down
  
    `kubectl scale deployments/api --replicas=2`
- Check pods status 

    `kubectl get pods -o wide`

### Delete the deployment

- To list all the deployments in the stack
    `docker stack --orchestrator kubernetes ls`
- To delete an deployment 
    `docker stack --orchestrator kubernetes rm hello-py-api`
- get the deployment names
     `kubectl get deployments`


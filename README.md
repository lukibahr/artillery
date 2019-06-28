# artillery

A siege container to battle webservers

## Build container

If you intend to run a specific version of siege or the container distribution, you can use the Makefile targets `make OSVERSION=18.04 SIEGE=4.0.4-1build1 build` or `make OSVERSION=18.04 SIEGE=4.0.4-1build1 all` for build and push to docker.io. Please consider the Makefile for proper setup of docker hub and namespace.

## Run the container locally

You can run and test the container locally by either running the containers independently:

```bash
$ docker run -d -p 8080:80 nginx:1
$ docker run -it lukasbahr/siege-container:4.0.4-1build1 -c25 -t2m http://localhost:8080/
```

or use docker-compose for local development: `docker-compose up`.

## Kubernetes deployment

Loadtesting kubernetes applications is important. You can use the artillery to test an nginx webserver for example. Refer the deployment manifests 

- `siege.yaml` which creates a deployment of siege. To increase the battling requests, either scale up the siege parameters in the arguments of the deployment 

```yaml
[..]
   containers:
      - name: siege
        image: lukasbahr/siege-container:4.0.4-1build1
        args: ["-c50", "-t5m", "http://localhost:80/"]
        resources:
[..]
```
or scale the replication count of pods in the deployment:

`$ kubectl scale deployment siege -n artillery --replicas=10`

This will create new pods which concurrently participate at the battle against your application. 


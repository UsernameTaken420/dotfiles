Tool for running [[Docker Compose]] along various devices

`docker swarm init` starts the swarm on this host and returns a token for joining
`docker swarm join --token [token]` joins a created swarm
`docker service create --replicas X my-WebService` signals the manager node to deploy X replicas of `my-WebService`
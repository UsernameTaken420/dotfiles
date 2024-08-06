Tool to manage more complicated [[Docker]] deployments, using a single `docker-compose` [[YAML]] file with `docker-compose up` rather than calling `docker run` for every container.

*Note that compose deploys everything on a single machine, for distributed deployments, see [[Docker Swarm]]*

```yaml
version: 2
services:
	web:
		image: "mywebapp"
		networkd:
			- front-end
	database:
		build: ./myMongoDBImage
		environment:
			MONGO_USER: mongo
			MONGO_PASSWORD: password
		networks:
			- back-end
	messaging:
		image: "redis"
		links: // links are not needed for things under the same item (services)
			- web
		networkd:
			- back-end
	orchestration:
		image: "ansible"
		ports:
			- outsidePort:innerPort
		depends_on:
			- web
		networks:
			- back-end
networks:
	front-end:
	back-end:
```
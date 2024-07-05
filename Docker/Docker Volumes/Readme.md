# 2 STEPS TO RUN DOCKER VOLUMES:

### Create a Volume:
```shell
docker volume create postgres-data
```

### Create a network for the containers to communicate over:
```shell
docker network create postgres-net
```
### Run a PostgreSQL container with the volume and network:
```
docker run --rm -d -v postgres-data/var/lib/postgresql/data\
    --network postgres-net --name db \
    -e POSTGRES_USER=app_user -e POSTGRES_PASSWORD=app_password \
    postgres
```
### STEP2: cd into the src folder
### Inside src folder, make .env for the database connection:
```
DBHOST=db
DBNAME=postgres
DBUSER-app_user
DBPASS=app_password
```

### Inside src folder, build the container:
```
docker build --tag flasksurveycontainerapp .
```

### Run the app container over the same network:
```
docker run --rm --network postgres-net \
    --name flask-db-app -p 50505:50505 \
    flasksurveycontainerapp 
```

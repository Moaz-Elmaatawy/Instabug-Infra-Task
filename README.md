# Instabug Infrastructure Internship Task 2023

This program is very simple, it connects to a MySQL database based on the following env vars:
* MYSQL_HOST
* MYSQL_USER
* MYSQL_PASS
* MYSQL_PORT

And exposes itself on port 9090:
* On `/healthcheck` it returns an OK message, 
* On GET it returns all recorded rows.
* On POST it creates a new row.
* On PATCH it updates the creation date of the row with the same ID as the one specified in query parameter `id`

## What is done:
* Dockerfile that builds the app with an image size of approximately 14MB
* Pipeline job (jenkinsfile) to build the app using dockerfile and reports if any errors happened in the build. The output of the build step is a docker image pushed to dockerhub public repo https://hub.docker.com/repository/docker/moazelmaatawy/go-app/general .
* Docker compose file that contains both the application and MySQL database with persistent volumes and health check to make sure the go application run after the MySQL container gets ready.
* Helm manifests for Kubernetes to deploy the app using them on Kubernetes, adding config to support high availability and volume persistence and exposing service to the public.
* Fixed the go app bug.



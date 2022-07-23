1. install docker

2. 'docker --version'

   - check the docker is installed

3. go to hub.docker.com to find mysql image

4. 'docker pull mysql'

5. 'docker run --name kai-mysql -p 13306:3306 -e MYSQL_ROOT_PASSWORD=password -d mysql'

6. then you get container id => 28ac0394edfab7e520999675e1a3267d550a1ea6b51764d9450b9eda3ccb1fa7

7. 'docker ps' to check which container is running

### container image is just to create a container so it is possible to create multiple containers from the same image

8. '(bash-4.4#) docker exec -it kai-mysql bash' to get inside the container \*'-it' option allows you to operate the command operation of container as it is from this database that you are currently using

9. 'mysql -u root -p' log in as a root user

10. enter password when you created for docker run command

11. '(mysql>) create database kai_db;' to create database

12. '(mysql>) use kai_db;' to set the database you want to use

13. '(mysql>) create table users (
    -> id int auto_increment not null primary key,
    -> name varchar(50)
    -> );'

14. '(mysql>) insert into users(name) values('Kaiya');'

15. 'exit' to get out from mysql

16. ctrl + D to exit out from the container to go back to local pc

17. 'docker ps' -> notice the container is still running

18. 'docker stop kai-mysql' then check 'docker ps' -> notice the container is not running

19. 'docker ps -a' -> you can see the containers that are stopped too

20. 'docker start kai-mysql' to restart the once-stopped container

### to get the mysql data on the container from the local pc

- install 'pip install mysql-connector-python'

21. 'docker rm kai-mysql' to delete the container

22. 'docker rmi mysql:latest' to delete the pulled container image

23. 'docker images' to check there images there is

## Create images from Docker file to run a container

In terminal, cd into the folder where the Dockerfile is then 'docker build -t kai-python:1.0 .' to create container image from Dockerfile (-t to set the container image tag)(-f to set the dockerfile path. if you are already in the folder where the Dockerfile is then you can skip -f option)(. at the end means the current directory)

things to consider:

- move to the directory where Docker file exists
- check if there are any unnecessary files
- when running docker build, set current directory(= '.') at the end

### once container is created,

- 'docker run --name kai-server -it -d kai-python:01'
- 'docker exec -it kai-server bash' to go inside the container
  in bash
- pwd to check where in the folder you are at
- 'echo $SITE_DOMAIN' to see the domain you set up
- 'ls' : you can check that there's the data you brought from web
- 'head -10 iris.data'
- 'cd .. ' 'ls' : you can check that there's requirements.txt there
- 'python 3.9' : you can run python
- 'import numpy as np' : if there's no error then dependencies are successfully installed
- 'exit()' : to exit from python
- ctrl + d : to exit container
- 'docker stop kai-server' : to stop the container

## using ENTRYPOINT

- create script.py
- in script.py ( print('Python script is running') )
- in Dockerfile
  COPY script.py .
  ENTRYPOINT ['python3.9', 'script.py']
- 'docker build -t kai-python:1.1 .' (create a docker image kai-python:1.1)
- 'docker images' : to check if it is really created
- 'docker run --name kai-server-2 kai-python:1.1'
- you'll get 'Python script is running' in the console

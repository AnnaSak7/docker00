1. install docker

2. 'docker --version'

   - check the docker is installed\

3. go to hub.docker.com to find mysql image

4. 'docker pull mysql'

5. 'docker run --name kai-mysql -p 13306:3306 -e MYSQL_ROOT_PASSWORD=password -d mysql'

6. then you get container id => 28ac0394edfab7e520999675e1a3267d550a1ea6b51764d9450b9eda3ccb1fa7

7. 'docker ps' to check which container is running

### container image is just to create a container so it is possible to multiple containers from the same image

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

## to get the mysql data on the container from the local pc

- install 'pip install mysql-connector-python'

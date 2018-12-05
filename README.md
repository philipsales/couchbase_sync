# Curis Database
* Version 1.0.0

### What is this repository for? ###

* Exclusive for AWH team members only

### Dependencies ###
this api uses a number of open source projects to work properly:

* [Nodejs] - a JavaScript runtime built on Chrome's V8 JavaScript engine. Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient. Node.js' package ecosystem, npm, is the largest ecosystem of open source libraries in the world.

* [Expressjs] - a minimal and flexible Node.js web application framework that provides a robust set of features for web and mobile applications.

### How do I install and run it for the first time in production? ###
Please do the following sequentially:

    1. Installing Docker and Docker Compose
        1.1. Go to this link: https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#os-requirements
        1.2. sudo apt-get install docker-compose
        
    2. Clone curiscb in your local machine
    * Clone curiscb using your terminal `https://<username>-awh@bitbucket.org/teamawhdev/curiscb.git`
        ```bash
        git clone https://<username>-awh@bitbucket.org/teamawhdev/curiscb.git
        ```

    3. Edit Memory Allocation for Database, index and memory:
        * curiscb
            ```bash
            cd curiscb
            nano docker-compose.yml
            # edit ALLOCMEMMB: 500
            ```

    4. Run couchbase
        * couchbase
            ```bash
            cd curiscb
            docker-compose up -d awhcurisdb
            # check logs
            docker-compose logs awhcurisdb
            # wait before entrypoint appears
            ```

    5. Run sync gateway
        * couchbase sync gateway
            ```bash
            # before starting please make sure step 5 is running (with entrypoint at end of log)
            cd curiscb
            docker-compose up -d awhcurissync
            # check logs
            docker-compose logs awhcurissync
            ```
            
### How to stop ALL service in production? ###
Please do the following:

    1. go to curiscb
        ```
        cd curiscb
        docker-compose stop 
        ```

### How to stop a SPECIFIC service in production? ###
Please do the following:

    1. go to curiscb
        ```
        cd curiscb
        docker-compose stop <service-name> 
        ```

### How to start a SPECIFIC service in production? ###
Please do the following:

    1. go to curiscb
        ```
        cd curiscb
        docker-compose start <service-name> 
        ```

### How to clean up service with clean data? ###
Please do the following:

    1. stop running service
        ```
        cd curiscb
        docker-compose stop 
        ```

    2. remove containers
        ```
        cd curiscb
        docker-compose rm -v 
        ```
        
    3. remove data (optional)
        ```
        cd curiscb
        sudo rm -drf curisdata
        ```
        
    4. remove images
        ```
        cd curiscb
        docker rmi curiscb_awhcurisdb
        docker rmi curiscb_awhcurissync
        ```

### How do i restart the service in production? ###
Please do the following sequentially:

    1. Stop all services (if not yet stopped)
         ```bash
        docker-compose stop
        ```

    2. Run couchbase
        * couchbase
            ```bash
            cd curiscb
            docker-compose start awhcurisdb
            # check logs
            docker-compose logs awhcurisdb
            # IMPORTANT: wait before entrypoint appears
            ```
            
    3. Run sync gateway
        * couchbase sync gateway
            ```bash
            # before starting please make sure step 5 is running (with entrypoint at end of log)
            cd curiscb
            docker-compose start awhcurissync
            # check logs
            docker-compose logs awhcurissync
            ```
            
### How do i test if the services are working? ###
Please do the following sequentially:

    1. couchbase database: test on browser or curl : http://<ip>:8091 and login using USERNAME and PASSWORD from docker-compose.yml
        
    2. couchbase sync gateway: test on browser or curl : http://<ip>:4984/<DBNAME> check DBNAME on your docker-compose.yml
    
### Contribution guidelines ###

* No direct push to major branches (master, develop) - all merge to master must pass through a pull request

### Who do I talk to? ###

* kristhian@alliedworld.healthcare
* miko@alliedworld.healthcare
* robert@alliedworld.healthcare
* luis@alliedworld.healthcare
* rosette@alliedworld.healthcare

**Have fun CODING! AWH TEAM!**
[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [Nodejs]: <https://nodejs.org>
   [Expressjs]: <https://expressjs.com/>
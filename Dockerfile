# FROM node  this line will fork the base repo where our code gets run 
FROM node:alpine 
# so this is a linux based node install on it
# till here you just got a copy of the machine and its doesnt contain your code on it
# now we going copy 
COPY . /usr/src

# . is current folder
# /usr/src => typical directory to put in
# lots of devops history behind why we need to put in /usr/src
# usr is not user its universal system resource
# at this point weve copied but the image is not running on the container
# its acting like a static machine which has no power
# so at this point we ve the code in our machine but nothing happening
# we are running the command ls just to list out the files the machine has
RUN ls

# from this point we are having our commands run in root directory of our VM ie linux
WORKDIR /usr/src

RUN echo "npm Packages are getting installed"

#here my node:alpine is already having npm-node package manager
RUN npm install 

RUN echo "npm Packages installed"
# basically run executes step by step but here we want to run a command with asynchronous nature 
# so we are going to execute CMD
CMD ["npm","run","start"]

# you want to expose the code

EXPOSE 80

# docker build . -t docker_id/name
# docker build . -t 14bee0262/docker-sample
# docker run --restart always -d -p 8870:1737 docker-sample
# probably when you dont put -d the deamon is running the background will not allow to run a fresh image
# docker ps
# docker rm -f 925eb385ccab

# docker pull 14bee0262/docker-sample
# you can use this image pull it use it from anywhere from world.


#docker system prune 
# docker image prune
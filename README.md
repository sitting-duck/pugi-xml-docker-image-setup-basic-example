# pugi-xml-docker-image-setup-basic-example

### My Docker Version: 
```
docker --version
Docker version 20.10.16, build aa7e414
```
I'm running docker from Powershell on Windows 11 as of June 2022.

### Building the Docker Image
Use
```bash
docker build -t pugi . 
```
the ``-t`` flag is for setting a tag, which I decided to make 'pugi' after the pugi xml library, but you can call it whatever you like. This is the tag that is going to be the name of your image, so when you do ``docker images`` after build, you should see your image you just built named ``pugi``

Example Output from ``docker images``: <br>
```
REPOSITORY   TAG       IMAGE ID       CREATED        SIZE
pugi         latest    90ec9dec9a86   5 days ago     752MB
```

<b>Note:</b> it's really easy to miss that . on the end but that is important. That is the path to the dockerfile. <br>


### My Build Output
```
```

### Running the Containers Interactive Terminal to Play Around In It
Check your work by running to get into the interactive terminal if you need to. Interactive terminal is just how we enter a container and use it just like a normal command line. 
```bash
docker run --name pugi-container -it --rm pugi /bin/bash
```
for without interactive terminal, just remote the -it flag: 

```bash
docker run --name pugi-container --rm pugi 
```

[ Note above the ``--rm`` flag we pass it. That means when we exit this container will get cleaned up. Run without --rm to keep the container around. This saves space and keeps things tidy. ] 

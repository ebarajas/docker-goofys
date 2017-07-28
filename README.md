# Goofys for Docker
This repository attempts to use a dockerized version of Goofys to act as a contained mount between an S3 bucket and a directory on the host. This was successful, but only after making some changes to the host kernel's Docker. Note that these changes are not damaging or drastic, but they must be made for the 3 way mount to properly work.

to run this container

```
$docker run -it ...
```

So currently this needs to be updated obviously. I plan on writing a script fairly soon to automate the process of setting this up.

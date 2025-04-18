<div align="center">


<a href="https://www.javanile.org/hackathon/">
<img src="https://raw.githubusercontent.com/javanile/hackathon/refs/heads/main/assets/images/devops-hackathon-banner.svg" />
</a>


</div>

---

# 🕓 crontab

> The best **crontab** container for your docker compose file.

## Introduction and benefits

The crontab image is a tool designed to make it easy for users to run and customize cron on a Docker Compose project.
Our mission is to provide a user-friendly and efficient solution that can save time and increase productivity.

By using the crontab image, users can expect the following benefits:

- Saves time by automating scheduled tasks or scripts
- Increases accuracy by providing detailed logs and real time information
- Allows for easy collaboration and integration on `docker-compose.yml` file

We are constantly working to improve the crontab and add new features that will make the app even more useful.
Thank you for choosing our crontab image!

## Supported tags and respective `Dockerfile` links

* [`latest`](https://github.com/javanile/crontab/blob/main/Dockerfile)

## How to use this image

This is the minimal footprint for crontab on your docker compose projects

```yaml
version: "3"

services:
  crontab:
    image: javanile/crontab
    command:
      - "* * * * * ping 8.8.8.8"
      - "0 0 1 * * rm -fr /tmp"
```

## Using a custom configuration files

The classic `/etc/crontab` is supported. But DON'T refer to user on crontab.

```yaml
version: "3"

services:
  mysql:
    image: javanile/crontab
    volumes:      
      - ./crontab:/etc/crontab
```

As example `./crontab` file. **DON'T USE ROOT ON FILE**

```crontab
* * * * * date >> /app/debug.log
```

## Using complex scripts

This is just an example, and the content can be tailored according to the specifics of the project.
The goal is just to give an overview of what's the purpose of the project, and what are the advantages of using it.

```yaml
version: "3"

services:
  crontab:
    image: javanile/crontab
    command:    
      - "* * * * * bash /app/my-project-script.sh"
    volumes:
      ## Mount local path '.' over '/app' to accessing on script file-system 
      - .:/app      
      ## Mount 'docker.sock' to enable your script running 'docker compose' as end-user 
      - /var/run/docker.sock:/var/run/docker.sock
```

## Logging

By default `javanile/crontab` logs on `stdout` visible with the following command

```shell
$ docker compose logs -f crontab
```

## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.

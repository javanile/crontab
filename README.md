# crontab

> The best **crontab** container for your docker compose file.

## Introduction and benefits

The MySQL image is a tool designed to make it easy for users to run and customize MySQL database.
Our mission is to provide a user-friendly and efficient solution that can save time and increase productivity.

By using the MySQL image, users can expect the following benefits:

- Feature 1: saves time by automating process Y
- Feature 2: increases accuracy by providing detailed and real time information
- Feature 3: allows for easy collaboration with team members

We are constantly working to improve the Awesome App and add new features that will make the app even more useful.
Thank you for choosing our MySQL image!

This is just an example, and the content can be tailored according to the specifics of the project.
The goal is just to give an overview of what's the purpose of the project, and what are the advantages of using it.

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

```yaml
version: "3"

services:
  mysql:
    image: javanile/crontab
    volumes:      
      - ./crontab:/etc/crontab
```

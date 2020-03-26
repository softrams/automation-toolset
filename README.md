vscode-docker
======================

Docker image for vscode

Installation
------------

If you are using linux, install docker: http://docs.docker.com/linux/step_one/
On mac and windows, install docker toolbox: https://www.docker.com/toolbox

Clone this repo

From repo folder:

## Setting up
### Docker Compose:
    
    docker-compose up -d

    # to bring it down

    docker-compose down

## Accessing

    Once launched browse to http://localhost:8080
    Link to your local host will be
        - Container: /home/seluser
        - Host: ~/automation-home
    
## Tests
### Steps to run tests:

    make sure you clone your repo containing your automation code. (This can be done locally or from vscode)
    using the terminal window in vscode, change directories to where you cloned your automation code.
    try running

    #example:
    mvn test-compile gauge:execute -DspecsDir="specs/signin" -Denv="hotfix-dev-headless"


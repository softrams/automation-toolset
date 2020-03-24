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

## Container to host mapping

    When you run the docker-compose up -d if a folder called "coder" in your home directory doesnt exist it creates it. This is the volume mapping where everything you do on the container and settings you setup will be saved for future use. This is also a place for you to locally move files into that makes them accessible from the container, or generated from the container accessible by the host.
    
## Tests
### Steps to run tests:

    make sure you clone your repo containing your automation code. (This can be done locally or from vscode)
    using the terminal window in vscode, change directories to where you cloned your automation code.
    try running

    #example:
    mvn test-compile gauge:execute -DspecsDir="specs/signin" -Denv="hotfix-dev-headless"


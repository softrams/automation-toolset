Immutable Test Automation Environment
======================
Gauge (https://gauge.org/) is an open source automation framework, specificially geared for acceptance tests. Our test automation teams rely on Gauge to build variety of tests using Gauge. 

At the core, Gauge allows writing tests in plain and simple markdown documents. This means anybody in the team could write acceptance test cases with test automation teams developing the building blocks (steps) in code. To begin with, we have started on-boarding Product Analysts, Product Managers and Manual Testers to test automation. As these teams are typically non-technical, we don't want to burden them with setting up their environments with installing all needed software, VS Code, extensions etc. and configure them all to work. 

While there are many options, we wanted to build a fully browser based environment that doesn't require any installation or needing to know how to work with Git to create branches, checkouts and pull requests. We wanted to bring a better flow that can work for even non-technical teams to colloborate. 

This is our **first step** in that direction. This container will help teams to bring immutability to test automation environments and manage a consistent environment across teams. 

## Benefits using this container

- Immutable infrasturucture for test environments
- Everything needed to write and run tests with Gauge are included
- No more **it runs fine on my local** for test automation
- Use the same container in CI/CD environments as well
- Manage consistency and versioning of your test automation environments

## Included in the container

- Gauge
- Gauge for Java
- Gauge for Node.js
- VSCode 
- VSCode extension for Gauge

Installation
------------

## Docker
- If you are using linux, install docker: http://docs.docker.com/linux/step_one/
- On mac and windows, install docker desktop: https://www.docker.com/products/docker-desktop

## Setting up
```bash
    # Clone this repo
    https://github.com/softrams/automation-toolset.git
    
    # Change directory into the cloned folder
    cd automation-toolset
    
    # Bring up the environment
    docker-compose up -d

    # Access VSCode in browser
    open http://localhost:8080
    
    # to Shutdown the environment
    docker-compose down
```
## Mount Local Workspace
When container is launched, it creates a folder in user's home directory, called "automation-home". 
You can change this by modifying docker-compose to any folder of your choice.

- Container: /home/seluser
- Host: ~/automation-home

Now, go ahead and clone your test automation repo to ~/automation-home or create symlinks to open 
from browser and start building.

## Thanks to these amazing projects
- Gauge Framework (https://gauge.org/)
- VSCode (https://code.visualstudio.com/)
- VSCode in browser (https://github.com/cdr/code-server)
- Docker (https://www.docker.com/)

## Contributing
Welcome PRs with suggestions and improvements towards bringing full test environments to browser.



# Introduction to Continous integration and continous deployment/delivery.

A CI/CD pipeline is an automated workflow that moves software from code commit to production deployment. It combines Continuous Integration (CI), where developers frequently merge code into a shared repository with automated builds and tests, and Continuous Delivery/Deployment (CD), which automates packaging and releasing code to staging or production environments.

By automating build, test, and deployment steps, CI/CD pipelines reduce manual errors, speed up releases, and provide rapid feedback to developers, enabling smaller, safer, and more frequent updates.

### Understanding the CICD pipeline.

- Continuous Integration (CI), where developers frequently merge code into a shared repository with automated builds and tests. This typically includes and involves steps like version control, code integration,automated testing and building the application. 

- Continuous Delivery/Deployment (CD), which automates packaging and releasing code to staging or production environments. This typically involves stepss like deploying the application to a staging area or production environment and post deployment monitoring.

## Introduction to Github Actions.
GitHub Actions is GitHub’s built-in CI/CD and automation platform that lets you build, test, and deploy code directly from your repository. It’s event-driven, meaning workflows run when specific repository events occur—like pushes, pull requests, or issue creation.

A workflow is defined in a YAML file inside .github/workflows/ and can run on GitHub-hosted runners (Linux, Windows, macOS) or self-hosted runners for custom environments

Core component of github actions include
- Events – Triggers for workflows (e.g., push, pull_request, schedule).
- Jobs Groups of steps executed on the same runner; can run sequentially or in parallel.
- Steps – Individual tasks, either shell commands or reusable actions.
- Actions – Prebuilt or custom automation units from the GitHub Marketplace.
- Runners – Servers that execute jobs; can be GitHub-hosted or self-hosted.

Practical implementation
- Setting up the project.
1. Initialize a github repository
- create a new repository in github 
![create a repository](./img/github%20actions.png)
- clone to your local machine
![clone to a local machine](./img/github%20actions1.png)

2. 
- initialize a Node.js project ('npm  init')
To initialize a node.js project we run the command, npm init to create 
![](./img/github.init.png) and ![](./img/github.init.2.png). Running this command will provide us with a package.json file.

next we run `npm install express` in the same folder where the package.json folder was ran.
![](./img/github.install.express.png)

- In the project folder we also create file server.js to hold the static web page that will be displayed when we run` npm start`. when this is done and we run npm start or node server.js is display the web page stored information as seen below

![](./img/github-web-output.png)

-Pusing the code to github

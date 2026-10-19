# Register App — CI/CD Pipeline with Jenkins

A Java web application integrated with an automated Continuous Integration (CI) pipeline using Jenkins, Maven, SonarQube, Docker, and Trivy. The project demonstrates automated application builds, testing, code analysis, container image creation, and integration with a GitOps-based deployment workflow on AWS.

## Overview

This repository contains the application source code and the Jenkins pipeline used to build, test, analyze, and package the application.

The CI pipeline is designed to start after a GitHub push triggers Jenkins. After the CI stages, Jenkins invokes a separate Continuous Deployment (CD) job to update the image version in the GitOps repository.

## Technology Stack

| Technology | Purpose |
|---|---|
| Java | Application development |
| Maven | Build and test automation |
| Jenkins | CI pipeline orchestration |
| SonarQube | Static code analysis and Quality Gate evaluation |
| Docker | Container image creation |
| Docker Hub | Container image registry |
| Trivy | Container image vulnerability scanning |
| GitHub | Source code management |
| AWS EC2 | Jenkins infrastructure |
| Amazon EKS | Kubernetes deployment target |
| Argo CD | GitOps-based deployment synchronization |

## CI/CD Workflow

1. **Source Checkout:** Jenkins checks out the application source from the `main` branch.
2. **Build:** Maven builds the project using `mvn clean package`.
3. **Testing:** Maven runs the project tests using `mvn test`.
4. **Code Analysis:** SonarQube analyzes the source code.
5. **Quality Gate:** Jenkins checks the SonarQube Quality Gate result.
6. **Containerization:** Docker builds an image using the repository's `Dockerfile`.
7. **Image Publishing:** Jenkins pushes the image to Docker Hub with a versioned tag and the `latest` tag.
8. **Security Scanning:** Trivy scans the container image for HIGH and CRITICAL vulnerabilities.
9. **CD Job Trigger:** Jenkins passes the versioned image tag to the separate GitOps CD job.
10. **GitOps Deployment:** The CD job updates the Kubernetes Deployment manifest in the GitOps repository. Argo CD detects the repository change and synchronizes the desired state to Amazon EKS.

## Docker Image

The configured image repository is:

`rehankhan37237/register-app-pipeline`

The CI pipeline uses versioned tags following this pattern:

`1.0.0-<build-number>`

For example, a Jenkins build could publish an image tagged `1.0.0-121`.

The pipeline also publishes the `latest` tag. Versioned tags make it easier to identify which image version is referenced by a deployment and to select an earlier version for rollback.

## Repository Structure

```text
register-app/
├── server/
│   ├── pom.xml
│   └── src/
├── webapp/
│   ├── pom.xml
│   └── src/
├── Dockerfile
├── Jenkinsfile
├── pom.xml
└── README.md
```

- `server/`: Server-side module and its Maven configuration.
- `webapp/`: Web application module and its Maven configuration.
- `pom.xml`: Root Maven project configuration.
- `Dockerfile`: Packages the generated web application WAR into a Tomcat-based image.
- `Jenkinsfile`: Defines the CI pipeline and its handoff to the GitOps CD job.

## Build and Test

### Prerequisites

- Git
- Java Development Kit
- Apache Maven
- Access to the project's source code

The Jenkins pipeline is configured to use the Jenkins tools named `Java21` and `Maven3`.

### Build the project

From the repository root, run:

mvn clean package
```

### Run the tests

```bash
mvn test

```


The Maven commands above build and test the project. Running the deployed application locally requires an appropriate application runtime and configuration.


## Quality and Security Checks


### SonarQube


The Jenkins pipeline runs Maven-based SonarQube analysis and checks the Quality Gate result.


**Current pipeline behavior:** The Quality Gate step is configured with `abortPipeline: false`, so a failed gate does not automatically abort the pipeline.


### Trivy


Trivy scans the Docker image for HIGH and CRITICAL vulnerabilities.

**Current pipeline behavior:** The scan uses `--exit-code 0`, so findings are reported without making the scan command fail the build. Review the scan results and configure enforcement separately if a blocking security gate is required.


## GitOps Integration


After publishing the Docker image, the CI pipeline triggers the separate `gitops-register-app-cd` Jenkins job and supplies the versioned image tag through the `IMAGE_TAG` parameter.


The CD job updates the Deployment manifest in the companion repository:

[gitops-register-app](https://github.com/Rehankhan37540/gitops-register-app)


Argo CD then reconciles the updated GitOps configuration with the Amazon EKS cluster.


## Related Repository

**GitOps and Kubernetes manifests:**  
[https://github.com/Rehankhan37540/gitops-register-app](https://github.com/Rehankhan37540/gitops-register-app)

## Key Learning Outcomes


- Building a multi-module Java project with Maven.
- Creating and maintaining Jenkins CI pipelines.

- Integrating SonarQube analysis and Quality Gate checks.
- Building and publishing Docker images with versioned tags.
- Scanning container images with Trivy.

- Passing version information between Jenkins CI and CD jobs.
- Integrating CI with GitOps-based Kubernetes deployment.

## Security Notes

- Keep Docker Hub credentials, GitHub credentials, Jenkins API tokens, and SonarQube tokens in Jenkins Credentials.
- Never commit passwords, API tokens, private keys, or other secrets to the repository.
- Use versioned image tags to make deployment changes easier to trace.

## Author

**Rehan Khan**

Aspiring Cloud Engineer | DevOps | AWS | Kubernetes | CI/CD | GitOps

---

This project is part of my hands-on learning journey in cloud infrastructure, automation, containerization, and reliable software delivery.

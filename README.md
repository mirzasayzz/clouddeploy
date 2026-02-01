# CloudDeploy – CI/CD Web Application Platform

## Overview
**CloudDeploy** is a comprehensive CI/CD Web Application Platform demonstrating a modern DevOps pipeline. It features a scalable Node.js web application, containerized with Docker, automated by Jenkins, and deployed to AWS infrastructure provisioned via Terraform and thoroughly configured using Ansible.

<img width="1250" height="2223" alt="dfd" src="https://github.com/user-attachments/assets/05ccd299-2a03-4980-85c4-2abd88251d4c" />


## Key Technologies
- **Application**: Node.js, Express, HTML5/CSS3 Dashboard.
- **Containerization**: Docker, Docker Compose.
- **CI/CD**: Jenkins (Pipeline-as-Code).
- **Configuration Management**: Ansible.
- **Infrastructure as Code**: Terraform (AWS).

## Project Structure
```
clouddeploy/
├── app/                  # Application Source Code
│   ├── public/           # Frontend Assets
│   ├── server.js         # Backend Logic
│   └── package.json      # Dependencies
├── infra/                # Infrastructure Code
│   ├── ansible/          # Ansible Playbooks
│   │   ├── inventory/    # Host Inventory
│   │   └── playbooks/    # Server Setup & Deployment
│   └── basic-aws/        # Terraform Scripts
├── Dockerfile            # Container Definition
├── docker-compose.yml    # Local Development Setup
├── Jenkinsfile           # CI/CD Pipeline Definition
└── README.md             # Project Documentation
```

## Getting Started

### Prerequisites
- Docker & Docker Compose
- Node.js (Optional, for local run without Docker)
- AWS CLI & Terraform (For cloud deployment)

### Local Development
1. **Build and Run**:
   ```bash
   docker-compose up --build
   ```
2. **Access Dashboard**:
   Open [http://localhost:3000](http://localhost:3000) in your browser.

### Deployment Simulation
1. **Infrastructure**:
   ```bash
   cd infra/basic-aws
   # terraform init && terraform apply
   ```
2. **Configuration**:
   ```bash
   # Ansible playbook execution
   # ansible-playbook -i infra/ansible/inventory/hosts infra/ansible/playbooks/setup-server.yml
   ```
3. **Pipeline**:
   Trigger the Jenkins pipeline (which uses the `Jenkinsfile` in root) to run tests, build the image, and deploy using Ansible.

## Architecture
The pipeline follows this flow:
1. **Commit**: Code pushed to Git.
2. **CI**: Jenkins detects change, builds Docker image, runs tests.
3. **CD**: On success, Jenkins triggers Ansible.
4. **Deploy**: Ansible connects to EC2, pulls the new image, and restarts the container.

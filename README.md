# Google Cloud Compute Engine with Terraform and Kubernetes 🚀

This Terraform project automates the provisioning of a Google Cloud Compute Engine VM instance and sets up a Kubernetes cluster with Cilium CNI. Perfect for when you're too lazy to manually install all that good stuff!

## Requirements 📋

- Terraform v1.x
- Google Cloud SDK
- Google Cloud Project with Compute Engine API enabled

## Setup Credentials 🔐

Before running the Terraform scripts, download the authentication JSON from your Google Cloud Console and place it in a secure location. Update the `main.tf` to point to the correct path.

## How It Works 🛠

### Provider Setup 🌐

This project uses the Google Cloud provider and sets it up with your project ID, region, and credentials from the JSON file.

### Compute Engine VM 🖥

Creates a VM instance named `my-vm` with the following specs:
- Machine Type: `e2-micro`
- Zone: `us-central1-a`
- Boot Disk: Ubuntu 22.04 LTS
- Network: Default
- Startup Script: Executes `k3s.sh` script from your project directory

### Kubernetes and Cilium 🐳

The `k3s.sh` startup script installs Kubernetes and Cilium CNI automatically. You get a Kubernetes cluster provisioned without any manual installation! 

### SSH Keys 🗝

Updates the project-wide metadata to include your SSH key, enabling you to SSH into any VM instance within the project.

## How to Run 🏃

1. **Initialize Terraform**
    ```bash
    terraform init
    ```

2. **Apply Configuration**
    ```bash
    terraform apply
    ```

## Important Note 🚨

Make sure you've downloaded the authentication JSON from Google Cloud and correctly specified its path in `main.tf`.


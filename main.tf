provider "google" {
  credentials = file("C:/Users/Vivek/Documents/Terraform-test/GCP/compute_engine/AuthKey/amazing-math-397202-853733a19554.json")
  project     = "amazing-math-397202"
  region      = "us-central1"
}

resource "google_compute_instance" "my_vm" {
  name         = "my-vm"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

 boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

metadata_startup_script = file("GCP/compute_engine/k3s.sh")

  network_interface {
    network = "default"
    access_config {}
  }
}

resource "google_compute_project_metadata" "ssh-keys"  {
  metadata = {
    ssh-keys = "vivek:${file("~/.ssh/id_rsa.pub")}"
     }

}

terraform {
  backend "gcs" {
    credentials = "./terraform-gke-keyfile.json"
    bucket      = "k8s-infra-bucket"
    prefix      = "terraform/state"
  }
}

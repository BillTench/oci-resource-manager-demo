variable "compartment_ocid" {}
variable "region" {}
variable "namespace" {}

variable "bucket_name" {
  default = "resource_manager_demo_bucket"
}

provider "oci" {
  region = var.region
}

resource "oci_objectstorage_bucket" "create_bucket" {
  # required
  compartment_id = var.compartment_ocid
  name           = var.bucket_name
  namespace      = var.namespace

  # optional
  access_type = "NoPublicAccess" # <---- プライベートバケット
}

output "new_bucket" {
  value = oci_objectstorage_bucket.create_bucket
}

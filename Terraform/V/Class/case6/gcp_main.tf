resource "aws_compute_instance" "os1" {
  name          = "os1"
  machine_type  = var.mtype
  zone          = "asia-south1-c"  
   #count       = var.istest ? 1 : 0             
  
boot_disk {
    initialize_params {
        image = "debian-cloud/debian-9"
    }
}

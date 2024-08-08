 
source "qemu" "rhel" {
 iso_url            = "file:///mnt/c/Users/hanab/Desktop/Stage%20Vermeg/RedHat/rhel-9.4-x86_64-dvd.iso"
  iso_checksum="398561d7b66f1a4bf23664f4aa8f2cfbb3641aa2f01a320068e86bd1fc0e9076"
  http_directory="./http"
  output_directory   = "output"
  format             = "qcow2"
  ssh_username       = "rhel"
  ssh_password       = "rhelpassword"
  ssh_wait_timeout ="10000s"
  disk_size          = 80480
  memory             = 2048
  cpus               = 2
  headless           = false
  qemu_binary        = "/usr/bin/qemu-system-x86_64"
  qemuargs = [
  ["-enable-kvm"],
  ["-cpu", "host"],
  #["-cdrom", "/mnt/c/Users/hanab/Desktop/Stage Vermeg/RedHat/rhel-9.4-x86_64-dvd.iso"],
  #["-boot", "d"]
  ] 
boot_command = [
    "<esc><wait>",
    "vmlinuz initrd=initrd.img inst.ks=http://172.24.13.193:80/ks.cfg<enter><wait>",
    "boot<enter>"
  ]
  boot_wait = "10s"
}

build {
  sources = ["source.qemu.rhel"]

}

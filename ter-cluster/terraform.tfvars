subnets = {
    subnet1={
       zone          = "ru-central1-a"
       name          = "subnet_a"
       cidr          = ["192.168.10.0/24"]
    },
    subnet2= {
       zone          = "ru-central1-b"
       name          = "subnet_b"
       cidr          = ["192.168.20.0/24"]
    },
    subnet3= {
       zone          = "ru-central1-d"
       name          = "subnet_d"
       cidr          = ["192.168.30.0/24"]
    }
}

node_resources = {
    node1={
       name          = "node1"
       cores         = 2
       memory        = 8
       core_fraction = 50
       preemptible   = false
       disk_size     = 20
    },
    node2= {
       name          = "node2"
       cores         = 2
       memory        = 8
       core_fraction = 20
       preemptible   = false
       disk_size     = 20
    },
    node3= {
       name          = "node3"
       cores         = 2
       memory        = 8
       core_fraction = 20
       preemptible   = false
       disk_size     = 20
    }
}

gitlab_vm_resources = {
   name          = "gitlab_vm"
   cores         = 4
   memory        = 8
   core_fraction = 20
   preemptible   = false
   disk_size     = 20
}

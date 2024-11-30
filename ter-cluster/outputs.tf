output "test_output" {

  value = {
    node1 = {
        instance_name = yandex_compute_instance.node1.name
        external_ip = yandex_compute_instance.node1.network_interface[0].nat_ip_address
        internal_ip = yandex_compute_instance.node1.network_interface[0].ip_address
        fqdn = yandex_compute_instance.node1.fqdn
    },
    node2 = {
        instance_name = yandex_compute_instance.node2.name
        external_ip = yandex_compute_instance.node2.network_interface[0].nat_ip_address
        internal_ip = yandex_compute_instance.node2.network_interface[0].ip_address
        fqdn = yandex_compute_instance.node2.fqdn
    },
    node3 = {
        instance_name = yandex_compute_instance.node3.name
        external_ip = yandex_compute_instance.node3.network_interface[0].nat_ip_address
        internal_ip = yandex_compute_instance.node3.network_interface[0].ip_address
        fqdn = yandex_compute_instance.node3.fqdn
    },
    gitlab_vm = {
        instance_name = yandex_compute_instance.gitlab_vm.name
        external_ip = yandex_compute_instance.gitlab_vm.network_interface[0].nat_ip_address
        internal_ip = yandex_compute_instance.gitlab_vm.network_interface[0].ip_address
        fqdn = yandex_compute_instance.gitlab_vm.fqdn
    }
  }
}
# ## Configure 'ip' variable to bind kubernetes services on a
# ## different ip than the default iface
# ## We should set etcd_member_name for etcd cluster. The node that is not a etcd member do not need to set the value, or can set the empty string value.
[all]
node1 ansible_host=${n1_external} ansible_user=ubuntu ip=${n1_internal} etcd_member_name=etcd1
node2 ansible_host=${n2_external} ansible_user=ubuntu ip=${n2_internal} # etcd_member_name=etcd2
node3 ansible_host=${n3_external} ansible_user=ubuntu ip=${n3_internal} # etcd_member_name=etcd3
# node4 ansible_host=95.54.0.15  # ip=10.3.0.4 etcd_member_name=etcd4
# node5 ansible_host=95.54.0.16  # ip=10.3.0.5 etcd_member_name=etcd5
# node6 ansible_host=95.54.0.17  # ip=10.3.0.6 etcd_member_name=etcd6

# ## configure a bastion host if your nodes are not directly reachable
# [bastion]
# bastion ansible_host=x.x.x.x ansible_user=some_user

[kube_control_plane]
node1
# node2
# node3

[etcd]
node1
# node2
# node3

[kube_node]
node2
node3
# node4
# node5
# node6

[calico_rr]

[k8s_cluster:children]
kube_control_plane
kube_node
calico_rr

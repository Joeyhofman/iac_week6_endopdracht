[azure]
azure ansible_host=${azure_ip} ansible_user=joey ansible_ssh_private_key_file=~/.ssh/azure

[esxi]
esxi ansible_host=${esxi_ip} ansible_user=joey ansible_ssh_private_key_file=~/.ssh/terraform
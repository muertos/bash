#!/usr/bin/env bash

# Purpose of this is to have functions that build basic pieces of an OpenStack
# cloud

# Create private network
echo "creating private network and subnet..."
network="demo-net"
subnet="demo-subnet"
openstack network create $network
openstack subnet create --subnet-range 192.168.1.99/24 --network $network $subnet

# Create router and bridge External network with private
echo "creating router, bridging private network with External..."
router="demo-router"
openstack router create $router
openstack router add subnet $router $subnet
openstack router set --external-gateway External $router

# Add SSH key pair
echo "adding ssh key pair..."
key_path="~/.ssh/st_timespace.pub"
key_name="demo-key"
openstack keypair create --public-key $key_path $key_name

## Create 2 instances
#echo "creating instances..."
#server_name="server"
#image="Ubuntu 20.04 (focal-amd64)"
#flavor="gp1.micro"
#sec_group="demo-security-group"
#openstack server create \
#    --max 2 \
#    --image "$image" \
#    --flavor $flavor \
#    --boot-from-volume 1 \
#    --network $network \
#    --key-name $key_name \
#    --security-group $sec_group \
#    $server_name

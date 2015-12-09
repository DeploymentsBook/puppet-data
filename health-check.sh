#!/bin/bash

# basic openstack health check
# openrc assumed to be sourced

set -x

if [ -z $OS_AUTH_URL ]; then
    echo "OS_AUTH_URL must be set"
    exit 1
fi
if [ -z $OS_USERNAME ]; then
    echo "OS_USERNAME must be set"
    exit 1
fi
if [ -z $OS_PASSWORD ]; then
    echo "OS_PASSWORD must be set"
    exit 1
fi
if [ -z $OS_TENANT_NAME ]; then
    echo "OS_TENANT_NAME must be set"
    exit 1
fi

# Keystone
openstack token issue
openstack role list

# Nova
openstack host list
openstack flavor list
openstack server list

# Glance
openstack image list

# Cinder
openstack volume list

# Ceilometer
ceilometer alarm-list

# Neutron
openstack network list

# Swift
openstack container list

# Ironic - openstack client does not support ironic
ironic node-list

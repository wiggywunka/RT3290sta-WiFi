#!/bin/bash


# @author WiggyWunka
# Check for root.
if [ "$(id -u)" -ne 0 ];
        then echo "This script must be run as root.">&2;
        exit 1;
fi

# Check for DKMS.
command -v dkms >/dev/null 2>&1 || { echo "DKMS is required but not installed.  Aborting..." >&2; exit 1; }

# Extract the archive to the proper directory
tar -xvf rt3290sta-2.6.0.0.tar -C /usr/src

# Set DKMS to install the module (with the force flag)
dkms install -m rt3290sta -v 2.6.0.0 --force

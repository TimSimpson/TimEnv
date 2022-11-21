# Tim Env

Bootstraps a VM, WSL (VM) or machine with necessary tools.

Apt packages are used when recommended. In other cases software is downloaded to ~/Tools and installed for the local user only.

## Instructions

Run 

```bash
export TIMENV="${HOME}/Tools"  # Set here automatically, change it if you wish
./scripts/bootstrap.sh
```

To install everything.

Next, in your ~/.bashrc, or wherever, add these lines:

```bash
# Specifies where to install software
source "${HOME}/Tools/startup.sh"
```

This will enable a few of the more esoteric commands on startup.

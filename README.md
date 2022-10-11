# Tim Env

Bootstraps a VM, WSL (VM) or machine with necessary tools.

Apt packages are used when recommended. In other cases software is downloaded to ~/Tools and installed for the local user only.

## Instructions

In your ~/.bashrc, or wherver, add these lines:

```bash
# Specifies where to install software
export TIMENV_TOOLS="${HOME}/Tools"
source "${HOME}/Tools/timenv.sh"
```

Now, run 

```bash
export TIMENV="${HOME}/Tools"
./scripts/bootstrap.sh
```

To install everything.

git-bash-formula
==================

A SaltStack formula designed to install and configure the [Git BASH](https://gitforwindows.org/) package on Windows-based installation-targets.

It is primarily expected that this formula will be run via [P3](https://www.plus3it.com/)'s "[watchmaker](https://watchmaker.readthedocs.io/en/stable/)" framework.

This formula is able to install the Git BASH utility on Windows Server[^1] operating environments. Installation for internet-connected systems may come from the Git BASH's ["Releases" page](https://github.com/git-for-windows/git/releases/). Alternately:

* Sites whose installation-targets won't be able to reach the Git BASH product's "Releases" page will need to self-host copies of the desired content.
* Sites that wish to use a specific version of the Git BASH will need to target that content

Targeting specific versions of the Git BASH or local copies of the install-archives can be directed to do so by adding appropriate content to the formula's associated Pillar-data (see this projct's [pillar.example](pillar.example) file for guidance).


## Available states

- [git-bash](#git-bash)
- [git-bash.clean](#git-bash.clean)
- [git-bash.package](#git-bash.package)
- [git-bash.package.clean](#git-bash.package.clean)
- [git-bash.config](#git-bash.config)
- [git-bash.config.clean](#git-bash.config.clean)

### git-bash

Executes the `package` and `config` states to install and configure the Git BASH

### git-bash.clean

Executes the `package` and `config` states' `clean` actions to fully uninstall the Git BASH and remove previously-installed browser policy-configs (and, on Windows, associated registry entries)

### git-bash.package

Executes _just_ the `package` state to install the Git BASH package.

### git-bash.package.clean

Executes _just_ the `package.clean` state to uninstall the Git BASH package.

### git-bash.config

Executes _just_ the `config` state to install/configure the Git BASH client-configuration (etc.) files

### git-bash.config.clean

Executes _just_ the `config` state to uninstall the Git BASH client-configuration (etc.) files and, on Windows, remove any registry-keys set by prior install-runs of the formula.

## Compatibility Notes:



[^1]: As of this README's writing, this functionality has only been tested on Windows Server 2022

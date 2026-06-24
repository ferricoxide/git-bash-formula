## git-bash-formula

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this project adheres to [Semantic Versioning](http://semver.org/).

### 0.1.0

**Released**: 2026.06.24

**Summary**:

* Implements Core Functionality:
    * Implemented parameter-driven automation to install and configure Git BASH on Windows targets via executable installer or compressed tarball.
    * Added configuration management for global Git settings using inline INI merges to modify system configurations without erasing defaults.
    * Injected organizational environment profiles into the shell initialization pathway to enforce customizable login banners and proxy variables.
    * Provided standard clean states to cleanly remove all application binaries, environment files, and configurations from the system.

### 0.0.1

**Released**: 2026.06.23

**Summary**:

*   Cloned project from https://github.com/plus3it/repo-template
*   Created git-bash directory-tree contents by:
    1.   Cloning https://github.com/saltstack-formulas/template-formula.git
    2.   Executing `bin/convert-formula.sh git-bash` in the new repo-copy
    3.   Moving the resulting `git-bash` directory into this project's space
    4.   Updating all imports from "`git__bash`" to "`git_bash`"
*   Update [LICENSE](LICENSE), CHANGELOG.md (this file), [README.md](README.md) and [.bumpversion.cfg](.bumpversion.cfg) per the P3 repo-template guidance
*   Update the `.github` and `tests` directories' contents  per the P3 repo-template guidance

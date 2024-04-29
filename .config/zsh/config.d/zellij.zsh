export ZELLIJ_RUNNER_LAYOUTS_DIR=.config/zellij/layouts

export ZELLIJ_RUNNER_BANNERS_DIR=.config/zellij/banners

# directory with the projects, relative to the HOME dir
export ZELLIJ_RUNNER_ROOT_DIR=Developer

# switcher already respects gitignore, but it's still useful in case there's no git
export ZELLIJ_RUNNER_IGNORE_DIRS=node_modules,target

# traverse dirs 3 level max from ZELLIJ_RUNNER_ROOT_DIR
export ZELLIJ_RUNNER_MAX_DIRS_DEPTH=3

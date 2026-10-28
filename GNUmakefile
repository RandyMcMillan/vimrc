GNOSTR=$(shell which gnostr)
GIT=$(shell which git)
export GNOSTR
export GIT
BRANCH=$(shell $(GIT) branch --show-current)
export BRANCH
export GNOSTR
export GIT
.ONESHELL:
-: submodule-init
	@echo $$GNOSTR
	@echo $$GIT
	@echo $$BRANCH
	$(shell which python3) ./update_plugins.py
	. install_awesome_vimrc.sh
	GIT_CONFIG_GLOBAL=/dev/null GIT_CONFIG_NOSYSTEM=1 $$GIT add sources_non_forked
	$$GIT push --set-upstream origin $$BRANCH
	#$$GNOSTR legit -m sources_non_forked
	#$$GIT push origin $$BRANCH $$BRANCH

# =====================================================================
# Submodule & Remote Management Makefile
# =====================================================================

# List your submodules here (or dynamically discover them from .gitmodules)
SUBMODULES = my_plugins/mcmillan

.PHONY: submodule-init submodule-remotes submodule-sync

# Complete fresh clone setup target
setup: submodule-init submodule-remotes

# 1. Initialize and sync submodules from .gitmodules
submodule-init:
	@echo "==> Initializing and updating git submodules..."
	git submodule update --init --recursive
	git submodule sync --recursive

# 2. Automatically configure secondary remotes for submodules
submodule-remotes:
	@echo "==> Configuring secondary remotes..."
	@for sm in $(SUBMODULES); do \
		if [ -d "$$sm" ]; then \
			echo "Checking remote configuration for: $$sm"; \
			cd "$$sm" && \
			if ! git remote get-url secondary >/dev/null 2>&1; then \
				git remote add origin-ssh git@github.com:RandyMcMillan/mcmillan.vim.git; \
				echo "  -> Added 'origin-ssh' remote to $$sm"; \
			else \
				echo "  -> 'origin-ssh' remote already exists in $$sm"; \
			fi; \
			cd - >/dev/null; \
		fi; \
	done

# Automatically discover submodules from .gitmodules on the fly
submodule-discover:
	@git config --file .gitmodules --get-regexp path | awk '{ print $$2 }'

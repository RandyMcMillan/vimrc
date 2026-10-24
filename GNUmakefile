GNOSTR=$(shell which gnostr)
GIT=$(shell which git)
export GNOSTR
export GIT
BRANCH=$(shell $(GIT) branch --show-current)
export BRANCH
export GNOSTR
export GIT
.ONESHELL:
-:
	@echo $$GNOSTR
	@echo $$GIT
	@echo $$BRANCH
	$(shell which python3) ./update_plugins.py
	. install_awesome_vimrc.sh
	$$GIT add sources_non_forked
	$$GIT push --set-upstream origin $$BRANCH
	$$GNOSTR legit -m sources_non_forked
	$$GIT push origin $$BRANCH $$BRANCH

GNOSTR=$(shell which gnostr)
GIT=$(shell which git)
export GNOSTR
export GIT
.ONESHELL:
-:
	@echo $$GNOSTR
	@echo $$GIT
	$(shell which python3) ./update_plugins.py
	. install_awesome_vimrc.sh
	$$GIT add sources_non_forked
	$$GNOSTR legit -m sources_non_forked

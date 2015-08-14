help:
	@echo 'Makefile for dotfiles						 '
	@echo '                                              '
	@echo 'Usage:                                        '
	@echo '   make install      init installation        '
	@echo '   make update       update to newest version '

submodule_init:
	git submodule update --init --recursive

submodule_update:
	git submodule update

repo_update:
	git checkout master && git fetch && git rebase origin/master

update: repo_update
	bash rc_update.sh

install: submodule_init
	bash bootstrap.sh

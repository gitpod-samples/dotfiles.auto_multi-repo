#!/usr/bin/env bash

(
	if grep -q 'supervisor' /proc/1/cmdline; then {
		gp ports await 23000 1>/dev/null;
		code -r $GITPOD_REPO_ROOT/${DOTFILES_CODE_WORKSPACE:-*.code-workspace}
	} fi
) & disown

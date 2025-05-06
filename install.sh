#!/usr/bin/env bash
set -eux
(
	if grep -q 'supervisor' /proc/1/cmdline; then {
		gp ports await 23000 1>/dev/null
		cd "${GITPOD_REPO_ROOT}"
		code_wss=(*.code-workspace)
		code -r "${DOTFILES_CODE_WORKSPACE:-${code_wss[-1]}}"
	} fi
) & disown

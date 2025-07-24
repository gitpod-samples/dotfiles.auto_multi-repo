#!/usr/bin/env bash

function main() {
	set -eu

	function add_folder_path() {
		printf '\t\t{ "path": "%s" },\n' "${1}"
	}

	# Configure your addtional repos here
	local additional_repos=(
		"https://github.com/axonasif/test"
		"https://github.com/axonasif/gearlock"
	)

	###### No need to modify any logic below
	###### We can make the below non-blocking but then the IDE window may surprise the user
	local repo_root="${GITPOD_REPO_ROOT}"
	local workspaces_root=${repo_root%/*}
	local code_ws; code_ws="$(
		printf '%s\n' \
		'{' \
			'	"folders": ['

		add_folder_path "${repo_root}"
		for repo_url in "${additional_repos[@]}"; do {
			local repo_clone_path="${workspaces_root}/${repo_url##*/}"
			if test ! -e "${repo_clone_path}/.git"; then {
				git clone --depth 1 "${repo_url}" "${repo_clone_path}" 1>&2
			} fi
			add_folder_path "${repo_clone_path}"
		} done

		printf '%s\n' \
			'	],' \
			'	"settings": { "extensions": { "recommendations": [ "PKief.material-icon-theme" ] } }' \
		'}'
	)"

	local ephemeral_code_ws_file=/tmp/multi-repo.code-workspace
	printf '%s\n' "${code_ws}" > "${ephemeral_code_ws_file}"

	(
		if grep -q 'supervisor' /proc/1/cmdline; then {
			gp ports await 23000 1>/dev/null
			cd "${workspaces_root}"
			code -r "${ephemeral_code_ws_file}"
		} fi
	) & disown
}

main "$@"

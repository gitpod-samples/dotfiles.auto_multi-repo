FROM gitpod/workspace-base

RUN <<EOR

multi_repo_script="$(curl -sL https://raw.githubusercontent.com/gitpod-samples/dotfiles.auto_multi-repo/240045be705601419e9a10d1237e908e8b51b042/install.sh | tail -n +2) >/tmp/multi-repo.log 2>&1 &"
sudo tee -a /etc/bash.bashrc <<BASH

if mkdir /tmp/.multi-repo.lock 2>/dev/null; then
    $multi_repo_script
fi

BASH

EOR
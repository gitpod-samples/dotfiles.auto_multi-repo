# Dotfiles Multi-Repository Workspace

This dotfiles setup automatically creates a VS Code workspace that includes multiple repositories, allowing you to work with several related projects simultaneously in a single workspace.

## How it works

When you start a new Gitpod workspace, the `install.sh` script:

1. **Configures additional repositories**: You can specify multiple GitHub repositories in the `additional_repos` array
2. **Clones repositories**: Automatically clones the specified repositories as siblings to your main dotfiles repository
3. **Creates dynamic workspace**: Generates a temporary `.code-workspace` file that includes all repositories as folders
4. **Opens multi-repo workspace**: Opens VS Code with all repositories accessible in a single workspace

## Quickstart

1. Fork this repository to your own account ([direct link](https://github.com/gitpod-samples/dotfiles.open_code_workspace/fork))
2. Edit the `install.sh` file and modify the `additional_repos` array to include your desired repositories:
   ```bash
   local additional_repos=(
       "https://github.com/your-username/repo1"
       "https://github.com/your-username/repo2"
       # Add more repositories as needed
   )
   ```
3. Go to https://gitpod.io/user/preferences and scroll down. (You may replace `gitpod.io` with your own instance domain)
4. Copy your forked repo link and set it as **Dotfiles - Repository URL** and click on `Save`.
5. Create new workspace to see in action.

## Embedding the same functionality in your org-wide default workspace/docker image

Add the following lines to the source dockerfile used to build your image:

```dockerfile
RUN <<EOR

multi_repo_script="$(curl -sL https://raw.githubusercontent.com/gitpod-samples/dotfiles.auto_multi-repo/240045be705601419e9a10d1237e908e8b51b042/install.sh | tail -n +2) >/tmp/multi-repo.log 2>&1 &"
sudo tee -a /etc/bash.bashrc <<BASH

if mkdir /tmp/.multi-repo.lock 2>/dev/null; then
    $multi_repo_script
fi

BASH

EOR
```

You can see [example.Dockerfile](./example.Dockerfile) for a full reference.



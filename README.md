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

## Customization

You can create a user variable in your Gitpod preferences to specify a fixed .code-workspace file, right now it's auto detected and it will pick the first one in order if there are multiple ones present.

For example, you may create a variable called `DOTFILES_CODE_WORKSPACE` with the scope of `*/*` and `foo.code-workspace` as the value.

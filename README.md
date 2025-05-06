# Dotfiles auto open (dot).code-workspace file

This is a hack to auto open the available .code-workspace file in VS Code Web or Desktop

## Quickstart

1. Fork this repository to your own account ([direct link](https://github.com/gitpod-samples/dotfiles.open_code_workspace/fork))
2. Go to https://gitpod.io/user/preferences and scroll down. (You may replace `gitpod.io` with your own instance domain)
3. Copy your forked repo link and set it as **Dotfiles - Repository URL** and click on `Save`.
4. Create new workspace to see in action.

## Customization

You can create an user variable in your Gitpod preferences to specify a fixed .code-workspace file, right now it's auto detected and it will pick the first one in order if there are multiple ones present.

For example, you may create a variable called `DOTFILES_CODE_WORKSPACE` with the scope of `*/*` and `foo.code-workspace` as the value.

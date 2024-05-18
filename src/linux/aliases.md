# 配置 Alias

进入 sh_aliaes 配置文件

```sh
vim ~/.sh_aliases
```

添加以下内容：

```sh
alias la="ls -a"
alias ll="ls -l"

alias reboot="sudo reboot"
alias shutdown="sudo shutdown -h now"

alias git-clean="git restore . && git clean -f"
alias docker-clean="docker system prune -a -f"
alias apt-update="sudo apt-get update && sudo apt-get dist-upgrade -y"
alias apt-clean="sudo apt-get autoremove -y && sudo apt-get clean -y"
```

> 注意 💥：
>
> 本配置只在当前用户下有效，如果你想在 root 也有效需要重新配置

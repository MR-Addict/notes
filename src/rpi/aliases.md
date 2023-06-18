# 配置 Alias

进入 sh_aliaes 配置文件

```sh
vim ~/.sh_aliases
```

添加以下内容：

```
alias la="ls -a"
alias ll="ls -l"
alias reboot="sudo reboot"
alias shutdown="sudo shutdown -h now"

alias cpu-temp="vcgencmd measure_temp"
alias eeprom-update="sudo rpi-eeprom-update -a"
alias apt-update="sudo apt-get update && sudo apt-get upgrade -y"
alias apt-clean="sudo apt-get autoremove -y && sudo apt-get clean -y"
```

```admonish warning
注意：注意：本配置只在pi用户下有效，如果你想在root也有效需要重新配置
```

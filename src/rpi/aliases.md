# 配置alias

进入bash_aliaes配置文件

```bash
vim ~/.bash_aliases
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

alias autologin="/home/pi/Projects/Autologin/autologin.sh"
alias autorun="pwsh -File /home/pi/Projects/Autorun/autorun.ps1"
```

```admonish warning
注意：注意：本配置只在pi用户下有效，如果你想在root也有效需要重新配置
```

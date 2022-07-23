# 使用wiringpi

```admonish info
官方文档：[wiringpi](http://wiringpi.com/wiringpi-updated-to-2-52-for-the-raspberry-pi-4b)
```

## 一、安装wiringpi

安装wiringpi：

```bash
cd /tmp
wget https://project-downloads.drogon.net/wiringpi-latest.deb
sudo dpkg -i wiringpi-latest.deb
```

测试是否安成功：

```bash
gpio -v
```

## 二、基础命令

查看GPIO状态：

```bash
gpio readall
```

设置GPIO 14号引脚为输出，并且输出高电平：

```bash
gpio mode 15 out
gpio write 15 1
```

还原GPIO 14状态：

```bash
gpio write 15 0
gpio mode 15 in
```

## 三、调用<wiringpi.h>

我们写一个fan.c的程序，该程序用于控制树莓派的GPIO 14。

```c
#include <signal.h>
#include <wiringPi.h>

#define Fan 14

int isLoop = 1;

void breakLoop(int signal) {
    isloop = 0;
}

int main(void) {
    signal(SIGINT, breakLoop);
    signal(SIGTERM, breakLoop);
    signal(SIGHUP, breakLoop);

    wiringPiSetupGpio();
    pinMode(Fan, OUTPUT);
    digitalWrite(Fan, HIGH);

    while (isloop);

    digitalWrite(Fan, LOW);
    pinMode(Fan, INPUT);
    return 0;
}
```

编译代码：

```bash
gcc -Wall -o fan fan.c -lwiringPi
```

执行代码：

```bash
./fan
```

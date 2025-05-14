# 使用 Wiringpi

> 官方文档 📝
>
> [wiringpi](http://wiringpi.com/wiringpi-updated-to-2-52-for-the-raspberry-pi-4b)

## 一、安装 wiringpi

安装 wiringpi：

```sh
cd /tmp
wget https://project-downloads.drogon.net/wiringpi-latest.deb
sudo dpkg -i wiringpi-latest.deb
```

测试是否安成功：

```sh
gpio -v
```

## 二、基础命令

查看 GPIO 状态：

```sh
gpio readall
```

设置 GPIO 14 号引脚为输出，并且输出高电平：

```sh
gpio mode 15 out
gpio write 15 1
```

还原 GPIO 14 状态：

```sh
gpio write 15 0
gpio mode 15 in
```

## 三、调用<wiringpi.h>

我们写一个 fan.c 的程序，该程序用于控制树莓派的 GPIO 14。

```c
#include <signal.h>
#include <wiringPi.h>

#define Fan 14

int isLoop = 1;

void breakLoop(int signal) {
    isLoop = 0;
}

int main(void) {
    signal(SIGINT, breakLoop);
    signal(SIGTERM, breakLoop);
    signal(SIGHUP, breakLoop);

    wiringPiSetupGpio();
    pinMode(Fan, OUTPUT);
    digitalWrite(Fan, HIGH);

    while (isLoop);

    digitalWrite(Fan, LOW);
    pinMode(Fan, INPUT);
    return 0;
}
```

编译代码：

```sh
gcc -Wall -o fan fan.c -lwiringPi
```

执行代码：

```sh
./fan
```

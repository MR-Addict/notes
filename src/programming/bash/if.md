# if 操作符

**[]** 用于条件判断，**()** 用于数学运算：

```bash
num=10

if [ $num -eq 10 ]
then
    echo "$num equals to 10"
else
    echo "$num not equals to 10"
fi

if [ $num == 10 ]
then
    echo "$num equals to 10"
else
    echo "$num not euqals to 10"
fi
```

**(())**用于数学运算和条件判断，**[[]]**用于字符串比较：

```bash
num=9
if [[ $num == 10 ]]
then
    echo "$num equals to 10"
else
    echo "$num not equals to 10"
fi

if (( $num >= 10 ))
then
    echo "$num is not smaller than 10"
else
    echo "$num is smaller than 10"
fi
```

**elif** 用于多条件判断，也可以用于嵌套的条件判断：

```bash
num=8
if [[ $num = 10 ]]
then
    echo "$num equals to 10"
elif [[ $num < 10 ]]
then
    echo "$num less than 10"
else
    echo "$num bigger than 10"
fi
```

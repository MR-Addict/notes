## 操作符

**&&** 操作符：

```bash
age=18
if [ $age -gt 16 ] && [ $age -lt 25 ]
then
    echo "Your age is valid"
else
    echo "Your age is not valid"
fi
```

**-a** 操作符：

```bash
age=18
if [ $age -gt 16 -a $age -lt 25 ]
then
    echo "Your age is valid"
else
    echo "Your age is not valid"
fi
```

**$$** 操作符：

```bash
age=18
if [[ $age -gt 16 && $age -lt 25 ]]
then
    echo "Your age is valid"
else
    echo "Your age is not valid"
fi
```

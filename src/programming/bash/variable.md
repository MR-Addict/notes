# 变量和注释

Comments are lines that exist in computer programs that are ignored by compilers and interpreters.

```bash
# This is a comment
```

When you reference a variable in bash it is important **not** to put spaces around the equals sign.

```bash
# User variable
name="Cael"
echo "My name is $name"
echo "My name is ${name}_bank"
```

System variables are mostly in **Capitals**.

```bash
# System variable
echo Our shell name is $BASH
echo Our shell version is $BASH_VERSION
echo Our home directory is $HOME
echo Our current directory is $PWD
```

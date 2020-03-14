#!/bin/bash

# 执行命令示例 sh ./mkdir.sh /your/project/path
a=1
# 缓存文件名，执行结束会删除
tmp_file='test.txt'
spe='|---'

# 判断是否存在以下 pom.xml，package.json 文件目录
exist_file()
{
    path=$1
    files=$(ls $path)
    for filename in $files
    do
        if [ $filename == 'pom.xml' -o $filename == 'package.json' -o $filename == '.gitkeep' -o $filename == '.gitignore' ]
        then
            return 1
        fi
    done
    return 2
}

# 遍历文件列表
list_file()
{
    if [ $1 -eq 1 ]
    then
        dir=$(ls -l $2 |awk '/^d/ {print $NF}')
        length=${#dir[@]}
        if [ $length -eq 0 ]
        then
            return
        fi
        for i in $dir
        do
            path=$2'/'$i
            exist_file $path
            r=$?
            t=$4
            if [ $r -eq 1 ]
            then
                if [ ${#t} -gt 0 ]
                then 
                    file_name=${t:1}
                    array=(${file_name//,/ })
                    for var in ${array[@]}
                    do
                        echo $var >> $tmp_file
                    done
                fi
                echo $3'#'$i >> $tmp_file
                list_file $r $path $(($3+1)) ''
            else
                t=$t','$3'#'$i
                list_file 1 $path $(($3+1)) $t
            fi
        done 
    else
        return
    fi
}

build_file()
{
    s=""
    while [ $1 -ge 1 ]
    do
       s='|---'
　　　　location=`expr $1 - 1`
    done
    return 1
}

# 执行开始处
exist_file $1
list_file $? $1 $a ''

# 去除重复路径
ar=$(cat -n test.txt | sort -k2,2 -k1,1n | uniq -f1 | sort -k1,1n | cut -f2-)

for var in ${ar[@]}
do
    location=(${var//#/ })
    l=${#location}
    l=`expr $l + 1`
    file_name=${var:l}
    s=""
    while [ $location -ge 1 ]
    do
        s=$s$spe
        location=`expr $location - 1`
    done
    echo $s' '$file_name
done
# 删除缓存文件
rm -f $tmp_file
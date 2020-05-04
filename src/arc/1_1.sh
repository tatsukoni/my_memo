#!/bin/zsh

# 入力値を受け取る
NUM1=$1 # 1番目の入力値
NUM2=$2 # 2番目の入力値

# 入力値バリデーション
invalid () {
    echo "無効な入力値です。理由：$1"
    exit 1
}
# 入力値の数違い
if [ ! $# -eq 2 ]; then
    invalid '引数の数が違う'
fi
# 負数もしくは0が指定された
if [ $1 -le 0 -o $2 -le 0 ]; then
    invalid '負数もしくは0が指定された'
fi

# 以下、関数定義部分
# 演算を繰り返し、最後の値をRESULT_NUM1として設定する
# https://eng-entrance.com/linux-shellscript-operator
calc1 () {
    RESULT_NUM1=$1
    while [ $RESULT_NUM1 -gt $2 ]
    do
        RESULT_NUM1=$(($RESULT_NUM1 - $2))
    done
}
# 演算を繰り返し、最後の値をRESULT_NUM2として設定する
calc2 () {
    RESULT_NUM2=$1
    while [ $RESULT_NUM2 -gt $2 ]
    do
        RESULT_NUM2=$(($RESULT_NUM2 - $2))
    done
}

# 演算処理
# 等しい値が与えられた場合はここで返却
if [ $NUM1 -eq $NUM2 ]; then
    ANS=$NUM1
    echo "最大公約数は$ANSです（等しい値）"
    exit 0
fi

# 引数が異なる場合、ユークリッドの互除法により、互いに数値を引き算しあう
if [ $NUM1 -gt $NUM2 ]; then
    calc1 $NUM1 $NUM2
    calc2 $NUM2 $RESULT_NUM1
else
    calc1 $NUM2 $NUM1
    calc2 $NUM1 $RESULT_NUM1
fi

# 互いに引き合った数値が等しければ、それが2数の最小公約数である。
# 等しい数値がなければ、最大公約数は存在しない（1）
if [ $RESULT_NUM1 -eq $RESULT_NUM2 ]; then
    ANS=$RESULT_NUM1
    echo "最大公約数は$ANSです"
    exit 0
else
    echo "最大公約数は存在しません(1)"
    exit 0
fi

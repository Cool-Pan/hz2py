#!/bin/bash

#
# 汉字转拼音
#

# 去掉拼音声调
Remove_Pinyin_Tones() {
    # 获取传入的参数
    REMOVE_TONES="$1"

    # 去掉声调并输出到文件
    #
    # 未使用到的声调：
    # êê̄ếê̌ề ẑ ĉ ŝ ŋ
    # ÊÊ̄ẾÊ̌Ề Ẑ Ĉ Ŝ Ŋ
    echo "$REMOVE_TONES" |
    sed 's/[āáǎà]/a/g' |
    sed 's/[ĀÁǍÀ]/a/g' |
    sed 's/[ōóǒò]/o/g' |
    sed 's/[ŌÓǑÒ]/o/g' |
    sed 's/[ēéěè]/e/g' |
    sed 's/[ĒÉĚÈ]/e/g' |
    sed 's/[īíǐì]/i/g' |
    sed 's/[ĪÍǏÌ]/i/g' |
    sed 's/[ūúǔù]/u/g' |
    sed 's/[ŪÚǓÙ]/u/g' |
    sed 's/[ǖǘǚǜ]/ü/g' |
    sed 's/[ǕǗǙǛ]/ü/g' |
    sed 's/[ńňǹ]/n/g'  |
    sed 's/[ŃŇǸ]/n/g'  |
    sed 's/[m̄ḿm̀]/m/g'  |
    sed 's/[M̄ḾM̀]/m/g'  >> "tmp-pinyin-non-tones.txt"
}

# 查询 Unicode 编码
Query_Unicode () {
    # 查询指定汉字
    #rg "$1" "../dict/kMandarin.txt" |
    rg "$1" "../dict/kMandarin_8105.txt" |

    # 过滤出 unicode 编码
    cut -d ":" -f 1 |

    # 转换成标准 unicode 编码格式并输出到文件
    sed 's/U+/\\u/g' >> "tmp-unicode.txt"
}

# 查询拼音
Query_Pinyin() {
    # 查询指定汉字
    GET_PINYIN=$(rg "$1" "../dict/kMandarin_8105.txt" |

    # 过滤出声调
    cut -d "#" -f 1 |
    cut -d ":" -f 2 |

    # 去掉空格
    sed 's/\ //g')
    # 并输出到文件
    echo "$GET_PINYIN" >> "tmp-pinyin.txt"

    # 去掉声调
    Remove_Pinyin_Tones "$GET_PINYIN"
}

# 帮助页
Manual_Page() {
    echo  -e "
    Usage: hz2py [input file] [options] [arguments]

    Options:
      -h, --help     Displays this help
      -v, --version  Displays version information
    "
}

# 版本信息
Show_Version() {
    echo -e "
    hz2py v1.0.0

    It is written in the scripting language Bash.
    "
}

# 参数 1 判断
if [[ "$1" == "-h" ]]; then
    Manual_Page
elif [[ "$1" == "--help" ]]; then
    Manual_Page
elif [[ "$1" == "-v" ]]; then
    Show_Version
elif [[ "$1" == "--version" ]]; then
    Show_Version
elif [[ -f "$1" ]]; then
    # 读取待处理字符文件
    cat "$1" |

    # 每次处理一行
    while read -r ONE_LINE
    do
        Query_Unicode "$ONE_LINE"
        Query_Pinyin "$ONE_LINE"
    done
else
    echo -e "
    No options/arguments were used or the wrong options/arguments were used.

    Use the -h/-help option for detailed help.
    "
fi

# hz2py

![build](https://img.shields.io/badge/build-passing-brightgreen)
![docs](https://img.shields.io/badge/docs-100%25-brightgreen)
![last-commit](https://img.shields.io/github/last-commit/aj-ash/hz2py)
![license](https://img.shields.io/github/license/aj-ash/hz2py)

汉字转换成拼音。

## 项目缘由

最近在设计一款中文输入方案，有个步骤需要将汉字转换成拼音。

虽然找到很多的转换工具，但是绝大多数的转换工具转换后的拼音都带有声调。
而唯一能找到 (也可能是我的信息检索能力不好)
不带声调的转换工具连《通用规范汉字表》都不能覆盖。

所以 Fork 了一份 [mozillazg/pinyin-data] 拼音数据，
自己动手做一个汉字转拼音工具。

[mozillazg/pinyin-data]: https://github.com/mozillazg/pinyin-data

## 特性

+ 支持转换汉字到拼音
    + 转换多个汉字需要保存汉字在纯文件文件中，每行一个汉字
+ 支持转换汉字到 unicode 编码
    + 转换多个汉字需要保存汉字在纯文件文件中，每行一个汉字
+ 支持转换汉字到带声调/不带声调的拼音

## 使用

```TXT
Usage: hz2py [input file] [options] [arguments]

Options:
  -h, --help      Displays this help
  -v, --version   Displays version information
```

### 支持的词典

+ [kHanyuPinyin](../dict/kHanyuPinyin.txt)
    + [Unihan Database] 中 [kHanyuPinyin](http://www.unicode.org/reports/tr38/#kHanyuPinyin) 部分的拼音数据
    + 来源于《漢語大字典》的拼音数据
+ [kXHC1983](../dict/kXHC1983.txt)
    + [Unihan Database] 中 [kXHC1983](http://www.unicode.org/reports/tr38/#kXHC1983) 部分的拼音数据
    + 来源于《现代汉语词典》的拼音数据
+ [kHanyuPinlu](../dict/kHanyuPinlu.txt)
    + [Unihan Database] 中 [kHanyuPinlu](http://www.unicode.org/reports/tr38/#kHanyuPinlu) 部分的拼音数据
    + 来源于《現代漢語頻率詞典》的拼音数据
+ [kMandarin](../dict/kMandarin.txt)
    + [Unihan Database] 中 [kMandarin](http://www.unicode.org/reports/tr38/#kMandarin) 部分的拼音数据
    + 普通话中最常用的一个读音。以 zh_CN 为主，如果 zh_CN 中没有则使用 zh_TW 中的拼音
+ [kMandarin_overwrite](../dict/kMandarin_overwrite.txt)
    + 手工纠正 [kMandarin.txt](Pinyin/kMandarin.txt) 中有误的拼音数据
+ [GBK_PUA](../dict/GBK_PUA.txt)
    + [Private Use Area](https://en.wikipedia.org/wiki/Private_Use_Areas) 中有拼音的汉字，参考 [GB 18030](https://zh.wikipedia.org/wiki/GB_18030#PUA)
+ [nonCJKUI](../dict/nonCJKUI.txt)
    + 不属于 [CJK Unified Ideograph](https://en.wikipedia.org/wiki/CJK_Unified_Ideographs) 但是却有拼音的字符
+ [kanji](../dict/kanji.txt)
    + [日本自造汉字](https://zh.wikipedia.org/wiki/%E6%97%A5%E6%9C%AC%E6%B1%89%E5%AD%97#7_%E6%97%A5%E6%9C%AC%E6%B1%89%E5%AD%97%E7%9A%84%E6%B1%89%E8%AF%AD%E6%99%AE%E9%80%9A%E8%AF%9D%E8%A7%84%E8%8C%83%E8%AF%BB%E9%9F%B3%E8%A1%A8) 的拼音数据
+ [kMandarin_8105](../dict/kMandarin_8105.txt)
    + [《通用规范汉字表》](https://zh.wikipedia.org/wiki/通用规范汉字表)(2013 年版) 里 8105 个汉字最常用的一个读音
+ [overwrite](../dict/overwrite.txt)
    + 手工纠正的拼音数据
+ [pinyin](../dict/pinyin.txt)
    + 合并上述文件后的拼音数据
+ [zdic](../dict/zdic.txt)
    + [汉典网](http://zdic.net) 的拼音数据

[Unihan Database]: http://www.unicode.org/charts/unihan.html

## TODO

+ 支持多种拼音词典
+ 词典自动补位搜索
    + 当所选词典没对应汉字的拼音时自动检索其它词典
+ Unicode 码反查汉字
+ 带声调/不带声调的拼音反查汉字

" ************************************************
" File        : string.vim
" Author      : Yongchun Jiang
" Description : 处理字符串的一些方法
" ************************************************

" 获取字符串的长度
"
" @param str 要处理的字符串
"
fu! quick#util#string#len(str)
    return strlen(str)    
endf

" 判断字符串是否为空
"
" @param str 要处理的字符串
"
fu! quick#util#string#isEmpty(str)
    return quick#util#string#len(str) <= 0
endf

" 判断字符串是否为空或空白字符串
"   空白字符包括：空格、制表符
"
" @param str 要处理的字符串
"
fu! quick#util#string#isBlank(str)
    " 空串，肯定属于空白字符
    if quick#util#string#isEmpty(a:str)
        return true
    endif
    " 判断空白串逻辑
    return len(split(a:str, '\W\+')) <= 0
endf



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
    return strlen(a:str)    
endf

" 判断字符串是否为空
"
" @param str 要处理的字符串
"
fu! quick#util#string#is_empty(str)
    return quick#util#string#len(a:str) <= 0
endf

" 判断字符串是否为空或空白字符串
"   空白字符包括：空格、制表符
"
" @param str 要处理的字符串
"
fu! quick#util#string#is_blank(str)
    " 空串，肯定属于空白字符
    if quick#util#string#is_empty(a:str)
        return true
    endif
    " 判断空白串逻辑
    return len(split(a:str, '\W\+')) <= 0
endf

" 字符串拼接
"
" @param str 要拼接的字符串
"
fu! quick#util#string#join(...)
    if a:0 <= 0
        return ''
    endif

    let str_join = ''
    for i in a:000
        let str_join = str_join . i
    endfor

    return str_join
endf

" 字符串拼接
"
" @param str 要拼接的字符串
"
fu! quick#util#string#join_list(str_list, sep)
    if a:0 <= 0
        return ''
    endif

    let str_join = ''
    for i in a:str_list
        let str_join = len(str_join) == 0 ? i : str_join . sep . i
    endfor

    return str_join
endf


" 截取首尾的空白字符
"
" @param str 要处理的字符串
"
fu! quick#util#string#trim(str)
    if quick#util#string#is_blank(a:str)
        return ''
    endif

    " 截取首部
    let idx = 0
    for c in split(a:str, '\zs')
        if !quick#util#string#is_blank(c)
            break
        endif
        let idx = idx + 1
    endfor
    let str_trim = strpart(a:str, idx)

    " 截取尾部分
    " let idx = strlen(str_trim) - 1
    let str_split = split(a:str, '\zs')
    let idx = len(str_split) - 1
    while idx >= 0
        let c = str_split[idx]
        if !quick#util#string#is_blank(c)
            break
        endif

        let idx = idx - 1
    endwhile

    return strpart(str_trim, 0, idx)
endf

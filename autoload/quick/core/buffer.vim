" ************************************************
" File        : buffer.vim
" Author      : Yongchun Jiang
" Description : Some methods of processing strings
" ************************************************

" 判断当前缓冲区的内容是否变更
"
" @param str 要处理的字符串
"
fu! quick#core#editor#isChanged()
    return &mod == 1
endf

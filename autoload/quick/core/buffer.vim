" ************************************************
" File        : buffer.vim
" Author      : Yongchun Jiang
" Description : Some methods of processing strings
" ************************************************

" 判断当前缓冲区的内容是否变更
"
" @param str 要处理的字符串
"
" --------------------------------------
"
fu! quick#core#buffer#isChanged()
    return &mod == 1
endf

" 获取当前缓冲区正在编辑的文件的名称
"
" @return 当前缓冲区正在编辑的文件的名称
"
fu! quick#core#buffer#getCurrFileName()
    return expand('%')
endf

" 获取当前正在缓冲区正在编辑的文件的全路径或相对路径
"
" @return 当前缓冲区正在编辑的文件的全路径或相对路径
"
fu! quick#core#buffer#getCurrFilePath()
    return expand('%:p')  
endf

" 获取当前缓冲区正在编辑的文件所在的目录
"
" @param 当前正在编辑的文件所在的目录
"
fu! quick#core#buffer#getCurrFileDir()
    return expand('%:p:h') 
endf

" --------------------------------------

" 获取当前缓冲区的数量
"
" @return 当前缓冲区的数量，和 :ls 显示的结果对应
"
fu! quick#core#buffer#count()
    return bufnr('%')
endf

" 获取当前的缓冲区列表
"
" @return 当前的缓冲区列表
fu! quick#core#buffer#list()
    redir => str_buffers
    silent! ls
    redir END

    let str_buffers = quick#util#string#trim(str_buffers)
    let buffer_list = []
    for curr in split(str_buffers, '\n')
        let buffer = {}
        let buffer.id = str2nr(matchstr(curr, '^\s*\zs\d\+'))        
        call add(buffer_list, buffer)
    endfor

    return buffer_list
endf


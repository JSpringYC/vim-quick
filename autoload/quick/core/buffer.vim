" ************************************************
" File        : buffer.vim
" Author      : Yongchun Jiang
" Description : Some methods of processing strings
" ************************************************

" 判断当前缓冲区的内容是否变更
"
fu! quick#core#buffer#is_changed()
    " getbufvar('%', '&mod')
    " getbufvar('n' + 0, '&mod')
    retu &mod
endf

" 获取当前缓冲区正在编辑的文件的名称
"
" @return 当前缓冲区正在编辑的文件的名称
"
fu! quick#core#buffer#curr_file_name()
    retu expand('%:p:t')
endf

" 获取当前正在缓冲区正在编辑的文件的全路径或相对路径
"
" @return 当前缓冲区正在编辑的文件的全路径或相对路径
"
fu! quick#core#buffer#curr_file()
    retu expand('%:p')  
endf

" 获取当前缓冲区正在编辑的文件所在的目录
"
" @param 当前正在编辑的文件所在的目录
"
fu! quick#core#buffer#curr_file_dir()
    retu expand('%:p:h') 
endf

" 获取当前缓冲区正在编辑的文件的扩展名
"
" @param 当前正在编辑的文件的扩展名(无.)
"
fu! quick#core#buffer#curr_file_dir()
    retu expand('%:p:e') 
endf

" --------------------------------------

" 获取当前缓冲区的数量
"
" @return 当前缓冲区的数量，和 :ls 显示的结果对应
"
fu! quick#core#buffer#count()
    retu bufnr('%')
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
        " id
        let buffer.id = str2nr(matchstr(curr, '^\s*\zs\d\+'))        
        " bufnr
        let buffer.bufnr = buffer.id + 0
        " file
        let buffer.file = expand('#' . buffer.id . ':p')
        " file dir
        let buffer.file_dir = expand('#' . buffer.id . ':p:h')
        " file name
        let buffer.file_name = expand('#' . buffer.id . ':p:t')
        " file ext
        let buffer.file_ext = expand('#' . buffer.id . ':p:e')
        " changed
        let buffer.changed =  getbufvar(buffer.id + 0, '&mod')

        call add(buffer_list, buffer)
    endfor

    retu buffer_list
endf


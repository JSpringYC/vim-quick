" ************************************************
" File        : path.vim
" Author      : Yongchun Jiang
" Description : 处理路径的一些方法
" ************************************************

" 获取路径分隔符
"
" @return 路径分隔符，Windows是\，Linux是/
fu! quick#util#path#separator()
    if has('win32') || has('win64')
        return "\\"
    else
        return "/"
    endif
endf

" 获取父路径
"
fu! quick#util#path#parent(path)
    " find / or \
    let chars = split(a:path, '\zs')
    if len(chars) <= 0
        return
    endif
    let idx = len(chars) - 1
    while idx >= 0
        if (chars[idx] == '/' || chars[idx] == '\') && (idx < len(chars) - 1)
            break
        endif

        let idx = idx - 1
    endwhile

    " split
    if idx < 0 || idx > len(chars) - 1
        return ''
    endif

    let sub_chars = idx == 0 ? chars[0:0] : chars[0:idx - 1]
    return join(sub_chars, '')
endf

" 函数：判断给定的路径是否存在
"
fu! quick#util#path#exists(path)
    return quick#util#path#is_file(a:path) || quick#util#path#is_dir(a:path)
endf

" 函数：判断给定的路径是否是存在的目录
"
fu! quick#util#path#is_dir(path)
    if quick#util#string#is_blank(a:path)
        return 0
    endif

    return isdirectory(expand(a:path))
endf

" 判断给定的路径是否是存在的文件
"
fu! quick#util#path#is_file(path)
    return filereadable(expand(a:path))
endf

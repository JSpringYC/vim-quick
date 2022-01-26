" ************************************************
" File        : path.vim
" Author      : Yongchun Jiang
" Description : 处理路径的一些方法
" ************************************************

" 获取路径分隔符
"
" @return 路径分隔符，Windows是\，Linux是/
fu! quick#util#path#getSeparator()
    if has('win32') || has('win64')
        return "\\"
    else
        return "/"
    endif
endf

" 路径拼接。该方法会自动根据系统来添加路径分隔符，所以在参数中不用专门显示给出
"
" 例：call quick#util#path#join($HOME, '.vim', 'init.vim')
"
" @param 要拼接的路径
" @return 拼接后的路径
fu! quick#util#path#join(...)
    if a:0 <= 0
        return ''
    endif

    let path = ''
    let sep = quick#util#path#getSeparator()
    let i = 0
    for arg in a:000
        let i += 1
        let path = path . arg

        if i < a:0
            let path = path . sep
        endif
    endfor

    return path
endf

" 路径拼接，类似于quick#util#path#join，不过默认是从HOME开始拼接的
"
" @see quick#util#path#join
"
fu! quick#util#path#joinHome(...)
    let sep = quick#util#path#getSeparator()
    let path = $HOME

    for arg in a:000
        let path = path . sep
        let path = path . arg
    endfor

    return path
endf

" 函数：判断给定的路径是否存在
"
fu! quick#util#path#exists(path)
    return quick#util#path#isFile(a:path) || quick#util#path#isDir(a:path)
endf

" 函数：判断给定的路径是否是存在的目录
"
fu! quick#util#path#isDir(path)
    if quick#util#string#isBlank(a:path)
        return false
    endif

    return isdirectory(expand(a:path))
endf

" 函数：列出给定目录中的文件
"
fu! quick#util#path#listDir(path)
    if !quick#util#path#isDir(a:path)
        return []
    endif

    return split(globpath(a:path, "*"), "\n")
endf

" 判断给定的路径是否是存在的文件
"
fu! quick#util#path#isFile(path)
    return filereadable(expand(a:path))
endf

" 函数：判断文件是否可写
"
fu! quick#util#path#isWritableFile(path)
    if !quick#util#path#isFile(a:path)
        return false
    endif

    return filewritable(expand(a:path))
endf

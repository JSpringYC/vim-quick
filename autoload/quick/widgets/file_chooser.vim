
" choose file
"
" param - root dir
"
" return choose file
" 
fu! quick#widgets#file_chooser#open(root)
    " root dir
    let root_dir = ''
    if isdirectory(a:root)
        let root_dir = a:root
    else
        let root_dir = getcwd()
    endif

    " list dir
    let dirs = readdir(root_dir)

    " dir to show
    let dirs_show = []
    " parent dir
    let parent_dir = quick#util#path#parent(root_dir)
    if len(parent_dir) > 0
        let dirs_show = add(dirs_show, "d\t..")
    endif

    for dir in dirs
        let dir_full = root_dir . quick#util#path#separator() . dir

        if isdirectory(dir_full)
            let dir = "d\t" . dir
        elseif filereadable(dir_full)
            let dir = "f\t" . dir
        else
            let dir = " \t" . dir
        endif

        let dirs_show = add(dirs_show, dir)
    endfor

    " show dialog
    let opts = {
            \ 'index': g:quickui#listbox#cursor, 
            \ 'title': 'Open File',
            \ 'w': '80',
          \ }
    let idx = quickui#listbox#inputlist(dirs_show, opts)
    if idx < 0
        return ''
    elseif idx == 0 && len(parent_dir) > 0
            " go parent
        return quick#widgets#file_chooser#open(parent_dir)
    endif

    let choice = root_dir . quick#util#path#separator() . (len(parent_dir) > 0 ? dirs[idx - 1] : dirs[idx])
    if isdirectory(choice)
        return quick#widgets#file_chooser#open(choice)
    endif

    return filereadable(choice) ? choice : ''
endf

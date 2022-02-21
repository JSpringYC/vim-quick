
" choose file
"
" param - root_dir
"
" return choose file

fu! quick#widgets#file_chooser#save_file(...)
    " current work dir
    let root_dir = getcwd()
    if a:0 > 0 && isdirectory(a:1)
        let root_dir = a:1
    endif

endf

fu! quick#widgets#file_chooser#open_file(...)
    " current work dir
    let root_dir = getcwd()
    if a:0 > 0 && isdirectory(a:1)
        let root_dir = a:1
    endif
    
    while 1
        let choose_file = quick#widgets#file_chooser#open(root_dir)
        if isdirectory(choose_file)
            let root_dir = choose_file
            continue
        endif

        if len(choose_file) <= 0 || !filereadable(choose_file)
            return ''
        endif

        return choose_file
    endwhile
endf

fu! quick#widgets#file_chooser#open(root)
    " root dir
    let root_dir = getcwd()
    if a:0 > 0 && isdirectory(a:1)
        let root_dir = a:1
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
        if isdirectory(dir)
            let dir = "d\t" . dir
        elseif filereadable(dir)
            let dir = "f\t" . dir
        endif

        let dirs_show = add(dirs_show, dir)
    endfor

    " show dialog
    let opts = {
            \ 'index': g:quickui#listbox#cursor, 
            \ 'title': 'Open File',
          \ }
    let idx = quickui#listbox#inputlist(dirs_show, opts)
    if idx == 0 && len(parent_dir) > 0
        return parent_dir
    elseif idx > 0
        return root_dir . '/' . dirs[idx]
    endif

    return ''
endf

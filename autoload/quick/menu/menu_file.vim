
" &File
"   - &New
"   - --
"   - E&xit
"

" Menu - File - Exit
fu! quick#menu#menu_file#action_exit()
    let buffers = quick#core#buffer#list()

    let is_changed = 0
    for buf in buffers
        if buf.changed
            let is_changed = 1
        endif
    endfor

    if !is_changed
        execute('q')
        return
    endif

    " confirm quit
    let content = "Buffer has modified, do you sure want to quit?"
    let choices = "&Yes\n&No\n&Cancel"
    let choice = quickui#confirm#open(content, choices, 1, "Quit")
    if choice == 1
        execute('q!')
    endif
endf

" Menu - File - Open
fu! quick#menu#menu_file#action_open()
    let file = quick#widgets#file_chooser#open(getcwd())

    if filereadable(file)
        execute 'e ' . file
    endif
endf

fu! quick#menu#menu_file#init()
    " New file
    call quickui#menu#install('&File', [
            \ ["&New\t:enew", 'enew', "New file"],
          \ ])

    " Open file
    call quickui#menu#install('&File', [
            \ ["&Open\t:e", 'call quick#menu#menu_file#action_open()', "Open file"],
          \ ])


    " separator
    call quickui#menu#install('&File', [
            \ ["--", ''],
          \ ])

    " Quit
    call quickui#menu#install('&File', [
            \ ["&E&xit\t:q", 'call quick#menu#menu_file#action_exit()', "Quit"],
          \ ])

endf


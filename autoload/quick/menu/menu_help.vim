
fu! quick#menu#menu_help#init()
    call quickui#menu#install('&Help', [
        \ ["&Cheatsheet", 'help index', ''],
        \ ['T&ips', 'help tips', ''],
        \ ['--',''],
        \ ["&Tutorial", 'help tutor', ''],
        \ ['&Quick Reference', 'help quickref', ''],
        \ ['&Summary', 'help summary', ''],
        \ ])
endf


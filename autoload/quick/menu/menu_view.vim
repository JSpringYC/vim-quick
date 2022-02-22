fu! quick#menu#menu_view#init()
    call quickui#menu#install('&View', [
            \ ["&Auto &Wrap\t%{&wrap ? 'on' : 'off'}", 'set wrap!', "Enable/Disable auto wrap text."],
          \ ])
    call quickui#menu#install('&View', [["--", '']])

    call quickui#menu#install('&View', [
            \ ["&Line Number\t%{&nu ? 'on' : 'off'}", 'set nu!', "Show/Hide line number"],
          \ ])
    call quickui#menu#install('&View', [
            \ ["&Relative Line Number\t%{&rnu ? 'on' : 'off'}", 'set rnu!', "Enable/Disable relative line number"],
          \ ])
endf


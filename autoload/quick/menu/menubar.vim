
function quick#menu#menubar#init()
    " reset menu
    call quickui#menu#reset()

    " Menu - file
    call quick#menu#menu_file#init()

    " Menu - tool
    call quick#menu#menu_tool#init()

    " Menu - view
    call quick#menu#menu_view#init()

    " Menu - help
    call quick#menu#menu_help#init()
endfunction

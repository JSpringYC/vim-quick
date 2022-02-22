let g:vim_hex_mode = 0

fu! quick#menu#menu_tool#action_hex()
    let hex_cmd = g:vim_hex_mode ? '%!xxd -r' : '%!xxd'
    let g:vim_hex_mode = !g:vim_hex_mode
    execute hex_cmd
endf

fu! quick#menu#menu_tool#init()
    " Hex mode
    let hex_status = g:vim_hex_mode ? 'on' : 'off'
    call quickui#menu#install('&Tool', [
            \ ["&Hex Mode\t%{g:vim_hex_mode ? 'on' : 'off'}", 'call quick#menu#menu_tool#action_hex()', "Hex mode"],
          \ ])
endf


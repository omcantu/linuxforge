#!/usr/bin/env fish
# Minimal prompt similar to default but compact

function fish_prompt
    # username@host cwd >
    set_color green
    printf '%s' (whoami) '@' (hostname -s)
    set_color normal
    printf ' %s' (prompt_pwd)
    set_color normal
    printf ' > '
end

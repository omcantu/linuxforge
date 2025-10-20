#!/usr/bin/env fish
# Aliases and small command wrappers adapted from the bash aliases

# File system
function ls
    eza -lh --group-directories-first --icons=auto $argv
end

function lsa
    ls -a $argv
end

function lt
    eza --tree --level=2 --long --icons --git $argv
end

function lta
    lt -a $argv
end

function ff
    fzf --preview "batcat --style=numbers --color=always {}" $argv
end

function fd
    fdfind $argv
end

# Keep relative navigation using builtin cd to avoid interfering with zoxide
function ..
    builtin cd ..
end

function ...
    builtin cd ../..
end

function ....
    builtin cd ../../..
end

# Tools
function n
    if test (count $argv) -eq 0
        nvim .
    else
        nvim $argv
    end
end

function g
    git $argv
end

function d
    docker $argv
end

function r
    rails $argv
end

function bat
    batcat $argv
end

function lzg
    lazygit $argv
end

function lzd
    lazydocker $argv
end

# Git shortcuts
function gcm
    git commit -m (string join ' ' $argv)
end

function gcam
    git commit -a -m (string join ' ' $argv)
end

function gcad
    git commit -a --amend (string join ' ' $argv)
end

#!/usr/bin/env fish
# Initialization hooks for optional tools (mise, zoxide, fzf)

if type -q mise
    # mise should provide a fish activation snippet
    eval (mise activate fish)
end

if type -q zoxide
    eval (zoxide init fish)
end

if type -q fzf
    if test -f /usr/share/fzf/key-bindings.fish
        source /usr/share/fzf/key-bindings.fish
    end
    if test -f /usr/share/fzf/completion.fish
        source /usr/share/fzf/completion.fish
    end
end

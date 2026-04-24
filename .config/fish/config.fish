set -gx PATH /usr/local/bin /usr/bin/git /usr/bin /usr/local/sbin /opt/local/bin /opt/local/sbin $PATH

set -g fish_greeting ""

# fnm
fnm env --use-on-cd --shell fish --log-level quiet | source

set -gx FZF_DEFAULT_OPTS '--no-height --no-reverse'
set -gx FZF_CTRL_T_OPTS "--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
set -gx FZF_CTRL_R_OPTS "--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

set -gx ATAC_MAIN_DIR "$HOME/workspace/"
set -gx ATAC_KEY_BINDINGS "$HOME/.config/atac/vim_key_bindings.toml"

set -gx TMUXIFIER "$HOME/.tmuxifier"
set -gx PATH $HOME/.tmuxifier/bin $PATH
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/.amp/bin $PATH
set -gx STARSHIP_CONFIG "$HOME/.config/starship.toml"

if status is-interactive
    set -g fish_color_path 89b4fa
    set -g fish_color_cwd 89b4fa
    set -g fish_color_cwd_root 89b4fa
    set -g fish_color_valid_path --underline 89b4fa
    set -g fish_color_normal normal
    set -g fish_color_command green
    set -g fish_color_error red
    set -g fish_color_param normal
    alias fconfig 'nvim ~/.config/fish/config.fish'
    alias work 'cd ~/Workspace/Git/Gitlab'
    alias ll 'ls -a1'
    alias de 'cd ~/Desktop'
    alias fz 'source ~/.config/fish/config.fish'
    alias pg "echo 'Pinging duckduckgo' && ping duckduckgo.com"
    alias rmds "find . -type f -name '*.DS_Store' -ls -delete"

    alias c 'tmuxifier load-session work'
    alias r 'tmuxifier load-session remote'

    alias gs 'git status'
    alias gd 'git diff'
    alias gds 'git diff --staged'
    alias gcb 'git checkout -b'
    alias rmn 'rm -rf node_modules'

    function mg
        mkdir $argv; or return
        cd $argv[-1]
    end

    function gcu
        if test -z "$argv[1]"
            echo "Error: Please specify the branch you want to switch to before deleting the current local branch.\n"
            echo "Usage: gcu <destination-branch>"
            echo "Protected branches: main | master | staging | development"
            return 1
        end

        set destination_branch $argv[1]
        set branch_to_delete (git branch --show-current)

        if test "$destination_branch" = "$branch_to_delete"
            echo "Error: Destination and current branch are the same ('$destination_branch'). Aborting."
            return 1
        end

        switch $branch_to_delete
            case main master staging development
                echo "Error: Cannot clean up protected branch '$branch_to_delete'."
                return 1
        end

        echo "Switching to '$destination_branch' to delete '$branch_to_delete'..."
        git checkout "$destination_branch"; and git fetch -p; and git pull; and git branch -D "$branch_to_delete"
    end

    if type -q fzf
        fzf --fish | source
    end

    function _reset_tmux_title
        if test -n "$TMUX"
            echo -ne "\033]2;(hostname -s)\007"
        end
    end

    function fish_title
        hostname -s
    end

    function ssh
        command ssh $argv
        _reset_tmux_title
    end

    function gemini
        command gemini $argv
        _reset_tmux_title
    end

    function amp
        command amp $argv
        _reset_tmux_title
    end

    bind \cf 'tmux-sessionizer'
    bind \e0 'tmux-sessionizer -s 0'
    bind \e1 'tmux-sessionizer -s 1'
    bind \e2 'tmux-sessionizer -s 2'
    bind \e3 'tmux-sessionizer -s 3'

    function git_open_widget
        command git-open >/dev/null 2>&1 &
    end
    bind \eg git_open_widget

    if type -q starship
        starship init fish | source
    end
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

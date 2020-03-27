set -x PATH /bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin /usr/local/go/bin $HOME/go/bin

set -x EDITOR vi

function fish_prompt
    set -l git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')

    set_color green 
    printf '%s' (hostname)
    set_color B90    
    printf "[%s" (basename $PWD)
    if string length "$git_branch" > /dev/null
        printf ":$git_branch"
    end
    printf "]"
    set_color normal
    echo "% "
end

function fish_right_prompt
    set_color cyan
    date "+%H:%M "
end

function branches
    git branch --sort=-committerdate | head -20
end

function ls --description 'List contents of directory'
    set -l param --color=no
    if isatty 1
        set param $param --indicator-style=classify
    end
    command ls $param $argv
end
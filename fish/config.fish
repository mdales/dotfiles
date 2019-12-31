set -x PATH /bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin

set -x PATH $PATH /usr/local/heroku/bin
set -x PATH $PATH /opt/swift-5.1.1-RELEASE-ubuntu18.04/usr/bin

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
#
# ~/.config/fish/config.fish
#

if status --is-interactive
    if test (uname) != Darwin
        alias ls 'ls --color=auto -lahF'
    end
    alias grep 'grep --color=auto'
    alias gst 'git status'
    alias ga 'git add -p'

    function parse_git_branch
        git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    end

    function fish_prompt
        set -l cwd (basename (pwd))
        test (pwd) = $HOME; and set cwd '~'
        set_color normal
        echo -n "[$USER@$hostname $cwd]"
        set_color cyan
        echo -n (parse_git_branch)
        set_color normal
        echo -n '$ '
    end

    # extract files eg: ex tarball.tar.gz
    function ex
        if test -f "$argv[1]"
            switch $argv[1]
                case '*.tar.bz2'
                    tar xjf $argv[1]
                case '*.tar.gz'
                    tar xzf $argv[1]
                case '*.bz2'
                    bunzip2 $argv[1]
                case '*.rar'
                    rar x $argv[1]
                case '*.gz'
                    gunzip $argv[1]
                case '*.tar'
                    tar xf $argv[1]
                case '*.tbz2'
                    tar xjf $argv[1]
                case '*.tgz'
                    tar xzf $argv[1]
                case '*.zip'
                    unzip $argv[1]
                case '*.Z'
                    uncompress $argv[1]
                case '*.7z'
                    7z x $argv[1]
                case '*'
                    echo "'$argv[1]' cannot be extracted via ex()"
            end
        else
            echo "'$argv[1]' is not a valid file"
        end
    end

    # tab completion ships built into fish itself (git included), no
    # compinit/completion setup needed the way bash/zsh required

    # mise (tool version manager) -- must come before zoxide below
    if type -q mise
        mise activate fish | source
    end

    # zoxide
    if type -q zoxide
        zoxide init fish --cmd j | source
    end

    # os specific configs: no dispatch needed here -- fish autoloads
    # everything under conf.d/ on its own, and each file there guards
    # itself by uname (see conf.d/osx.fish). Add conf.d/arch.fish the
    # same way if Arch ever needs its own fish snippet.
end

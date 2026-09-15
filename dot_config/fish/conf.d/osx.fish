#
# ~/.config/fish/conf.d/osx.fish
#
# fish sources everything in conf.d/ automatically (interactive or not),
# on every platform -- so this file guards itself with a uname check
# instead of being conditionally sourced from config.fish.
#

if test (uname) = Darwin
    # Homebrew (Apple Silicon path -- adjust to /usr/local if ever on Intel)
    if test -d /opt/homebrew/bin
        eval (/opt/homebrew/bin/brew shellenv fish)
    end

    # mise.run installs mise itself here, but doesn't put it on PATH
    if test -d "$HOME/.local/bin"
        set -gx PATH "$HOME/.local/bin" $PATH
    end

    # Postgres.app doesn't put itself on PATH (so it doesn't fight other
    # Postgres installs) -- needed for pg_config, used by the pg gem's
    # native extension build.
    if test -d /Applications/Postgres.app/Contents/Versions/latest/bin
        set -gx PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH
    end

    if status --is-interactive
        alias ls 'ls -lahFG'
    end
end

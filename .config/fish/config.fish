set fish_greeting

fish_add_path -m $HOME/.local/bin
fish_add_path -m /opt/homebrew/bin

set -gx ATUIN_NOBIND "true"
atuin init fish | source
bind \cr _atuin_search
bind -M insert \cr _atuin_search

set -gx EDITOR hx

set -gx PNPM_HOME "/Users/victor/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

zoxide init fish | source

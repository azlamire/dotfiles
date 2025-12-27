{pkgs, lib, ... }:
{
  programs.zsh = {
    enable = true;
    initContent = let
    zshConfig = lib.mkOrder 1000 '' 
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_STYLES[command]='fg=#FF6E00'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#FF6E00'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#FF6E00'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#12403C'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#12403C'
ZSH_HIGHLIGHT_STYLES[path]='fg=#ff09'
ZSH_HIGHLIGHT_STYLES[argument]='fg=white'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ff073a'
enable-fzf-tab
zstyle ':fzf-tab:complete:*:*' fzf-flags '--color=gutter:0,spinner:0,bg+:0'
zstyle ':fzf-tab:complete:*' fzf-preview '
  if [[ -d $realpath ]]; then
    eza -1 --icons --color=always $realpath 2>/dev/null || echo "Preview not available"
  else
    bat --style=plain --color=always --line-range=:100 $realpath
  fi
'

bindkey "^[[A" up-line-or-search
bindkey "^[[B" down-line-or-search
    '';
    in lib.mkMerge [ zshConfig ];
    shellAliases = {
      updateFully = "
        nh os switch .;
        nh home switch .;
        git push;
      ";
      buncheck = ''
        tsc "$1" --noEmit && bun run "$1";
      '';
    };
    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "master";
          sha256 = "sha256-zc9Sc1WQIbJ132hw73oiS1ExvxCRHagi6vMkCLd4ZhI=";
        };
      }
    ];
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    historySubstringSearch.enable = true;
    enableCompletion = true;
 
  };
}
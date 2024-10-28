{ config, pkgs, ... }:

{
  home.username = "rinri";
  home.homeDirectory = "/home/rinri";

  home.stateVersion = "24.05";

  home.packages = [
    pkgs.neovim
    pkgs.lunarvim
    pkgs.killall
    pkgs.bat
    pkgs.htop
    pkgs.fd
    pkgs.fzf
    pkgs.ripgrep
    pkgs.tree
    pkgs.watch
    pkgs.unzip
    pkgs.ncdu

    pkgs.wofi
    pkgs.wl-clipboard
    pkgs.waybar
    pkgs.slurp
    pkgs.grim

    pkgs.firefox
    pkgs.telegram-desktop
    pkgs.kitty
    pkgs.dunst
    pkgs.libnotify
    pkgs.lxqt.lxqt-policykit
    pkgs.zathura
    pkgs.sxiv
    pkgs.hyprpaper
    pkgs.obs-studio
    pkgs.pavucontrol
    pkgs.easyeffects
    pkgs.vesktop
    pkgs.cmus

    pkgs.distrobox

    pkgs.noto-fonts
    pkgs.noto-fonts-cjk
    pkgs.nerdfonts
    pkgs.font-awesome_5
  ];

  fonts.fontconfig.enable = true;
  fonts.fontconfig.defaultFonts.monospace = [ "DejaVuSansM Nerd Font Propo" ];

  home.file = {
    ".config/hypr/hyprland.conf".source = dotfiles/hyprland.conf;
    ".config/hypr/hyprpaper.conf".source = dotfiles/hyprpaper.conf;
    ".config/fcitx5".source = dotfiles/fcitx5;
    ".config/lvim/config.lua".source = dotfiles/lvim-config.lua;
    ".config/p10k.zsh".source = dotfiles/p10k.zsh;
    ".config/kitty/kitty.conf".source = dotfiles/kitty.conf;
    ".config/waybar/config.jsonc".source = dotfiles/waybar.jsonc;
    ".config/waybar/style.css".source = dotfiles/waybar.css;
    ".config/easyeffects/output/900prox.json".source = dotfiles/900prox.json;
# ".config/easyeffects/input/mono-mic.json".source = dotfiles/mono-mic.json;
  };

  home.sessionVariables = {
    EDITOR = "lvim";
  };

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      source ~/.config/p10k.zsh
      bindkey -M viins '\e.' insert-last-word
      '';

    shellAliases = {
      ll = "ls -l";
      vim = "lvim";
    };

    history = {
      size = 1000000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    plugins = [
    {
      name = "zsh-vi-mode";
      file = "./share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      src = pkgs.zsh-vi-mode;
    }
    {
      name = "zsh-fzf-tab";
      file = "./share/fzf-tab/fzf-tab.plugin.zsh";
      src = pkgs.zsh-fzf-tab;
    }
    {
      name = "zsh-fzf-history-search";
      file = "./share/zsh-fzf-history-search/zsh-fzf-history-search.plugin.zsh";
      src = pkgs.zsh-fzf-history-search;
    }
    {
      name = "zsh-powerlevel10k";
      file = "./share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      src = pkgs.zsh-powerlevel10k;
    }
    ];
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--height 50%"
        "-1"
        "--reverse"
        "--multi"
        "--inline-info"
    ];
  };

  programs.git = {
    enable = true;
    userEmail = "amirlansharipov@gmail.com";
    userName = "RinRi";
  };
}

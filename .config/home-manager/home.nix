{ config, pkgs, ... }:
let
  aws-vault-custom = (pkgs.callPackage ./aws-vault-derivation.nix { });
  my-sbt = pkgs.sbt.override { jre = pkgs.jdk19_headless; };
in
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
  home.username = "tiphaniedousset";
  home.homeDirectory = "/Users/tiphaniedousset";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    bash
    fzf
    htop
    httpie
    jq
    kafkactl
    kcat
    neovim
    trivy
    watch
    yq-go
    tree
    tig
    gh
    yarn
    dotnet-sdk_8
    wget
    ammonite
    postgresql

    # Dev
    cargo
    clippy
    cmake
    coursier
    maven
    nixpkgs-fmt
    nodejs
    # rnix-lsp
    rust.packages.stable.rustPlatform.rustcSrc
    rustfmt
    # sbt
    my-sbt 
    scala
    git
    cocoapods
    # snowsql
    # supabase-cli
    # python3
    gradle

    # IaC
    aws-vault-custom
    awscli2
    openshift
    # ssm-session-manager-plugin
    terraform
    terragrunt
    tfk8s

    # Kubernetes
    k9s
    kubelogin
    kubernetes-helm
    kubetail

    colordiff
    ffmpeg

    # Listo
    # android-studio
    # flutter
    # dart

    # Desktop

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello    " ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.file = {
    ".kube/" = {
      source = conf/kube;
      recursive = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VI_MODE_SET_CURSOR = "true";

    # ssh locale errors
    LC_CTYPE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";

    # rust
    RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
  };

  home.sessionPath = [
    "$HOME/.pub-cache/bin"
  ];

  programs.home-manager.enable = true;
  programs.ripgrep.enable = true;
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      kubernetes = {
        disabled = false;
        format = "[$symbol$namespace]($style) in ";
        detect_files = ["docker-compose.yaml"];
        symbol = "k8s ";
        contexts = [
          {
            context_pattern = "*prod*";
            style = "bold red";
            # symbol = "💔 ";
          }
        ];
      };
      python.disabled = true;
      rust.disabled = true;
      scala.disabled = true;
      java.disabled = true;
      docker_context.disabled = true;
      dart.disabled = true;
      package.disabled = true; # do not show npm, cargo etc
      nix_shell.disabled = true;
      nodejs.disabled = true;
      git_status.stashed = "";
    };
  };

  programs.zsh = {
    enable = true;

    syntaxHighlighting.enable = true;

    # enableAutosuggestions = true;
    autosuggestion.enable = true;

    shellAliases = 
    let 
      HOME = "${config.home.homeDirectory}";
      PRIVATE = "${HOME}/Private";
      HIVEMIND = "${HOME}/Projects/Hivemind/";
    in
    {
      vim = "nvim";
      vi = "nvim";
      ij = "open -na \"IntelliJ IDEA CE.app\" --args \"$@\"";
      hm = "cd ~/.config/home-manager";
      docc = "docker-compose";
      doc = "docker";
      rz = "zsh"; # reload zshell
      hms = "home-manager switch";
      npu = "nix-channel --update && home-manager switch"; # update packages installed via home manager && switch to new channel
      buu = "brew update && brew upgrade";
      update-all = "buu && npu";

      # dotfile management
      gitd = "GIT_DIR=${PRIVATE}/Projects/dotfiles GIT_WORK_TREE=${HOME} git -c status.showUntrackedFiles=no";
      vv = "vi ~/.config/nvim/init.lua";
      vg = "vi ~/.config/home-manager/conf/git/.gitconfig";
      vn = "vi ~/.config/home-manager/home.nix";
      vz = "vn";

      # files search
      v = "nvim -c \"Telescope find_files\"";
      vl = "nvim -c \"Telescope live_grep\"";

      # listo
      listo = "cd ${PRIVATE}/Projects/listo";

      # divers
      dw = "cd ~/Downloads/";
      on = "ping -c 8.8.8.8 -W 5 && ping -c 1 google.com -W 5";
      ssh = "TERM=xterm-256color ssh";
      # ls = "ls --color=auto";
      ll = "ls -lh"; # human readable
      la = "ls -la";
      cfg = "cd ~/.config/";
      disk = "lsblk -f";
      diskl = "sudo fdisk -l"; # Displays all partitions
      # fr = "setxkbmap fr";
      # neo = "setxkbmap de neo";

      # projects Hivemind
      hiv = "cd ${HIVEMIND}";
      gsp = "cd ${HIVEMIND}/Siemens/gsp-kafka-data-streaming";
      hays = "cd ${HIVEMIND}/Hays";

    };

    # shellGlobalAliases = {
    #   UUID = "$(uuidgen | tr -d \\n)";
    #   G = "| grep";
    # };

    profileExtra = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';

    # initExtra = ''
    #   # eval "$(atuin init zsh)"
    #   # eval "$(direnv hook zsh)"
    # '';

    initExtraBeforeCompInit = ''
      export ZDOTDIR=${config.xdg.cacheHome}/zsh
    '';

    history.path = "${config.xdg.dataHome}/zsh/zsh_history";

    oh-my-zsh = {
      enable = true;
      plugins = [ "z" "aws" "brew" "dircycle" "vi-mode" ];
    };

    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.7.0";
          sha256 = "149zh2rm59blr2q458a5irkfh82y3dwdich60s9670kl3cl5h2m1";
        };
      }
      # {
      #   name = "zsh-autosuggestions";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "zsh-users";
      #     repo = "zsh-autosuggestions";
      #     rev = "v0.4.0";
      #     sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
      # 	};
      # }
    ];
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

#  programs.atuin = {
#    enable = true;
#    enableZshIntegration = true;
#    flags = [ "--disable-up-arrow" ];
#    settings = {
#      auto_sync = false;
#      style = "compact";
#    };
#  };

  programs.java = {
    enable = true;
    package = pkgs.jdk11;
  };

  programs.git = {
    enable = true;
    # delta.enable = true;
    userName = "Tiphanie";
    userEmail = "tiphanie.dousset@hivemindtechnologies.com";
    # signing = {
    #   key = "ssh-ed25519 xxx";
    #   signByDefault = true;
    #   gpgPath = "ssh";
    # };
    ignores = [
      # ".bloop"
      # "sbt"
      # "m2"
      # ".metals"
      # "ivy2"
      # "metals"
      # ".DS_Store"
      # ".idea"
      # ".vscode"
      # ".direnv"
      # ".envrc"
      # "shell.nix"
      # ".gradle"
      # ".project"
      # ".settings"
    ];
    extraConfig = {
      # "gpg\ \"ssh\"" = {
      #   program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      # };
      apply = {
        ignoreWhitespace = "change";
        # do not produce whitespace conflicts
      };
      branch = {
        autosetuprebase = "always";
      };
      core = {
        pager = "less --tabs=4 --RAW-CONTROL-CHARS --quit-if-one-screen --no-init";
        # autocrlf = "input";
      };
      fetch = {
        prune = true;
        # remove old branches on fetch
      };
      # gpg = {
      #   format = "ssh";
      # };
      init = {
        defaultBranch = "main";
      };
      merge = {
        ff = "only";
        ignore-space-change = "true";
        conflictStyle = "diff3";
      };
      pull = {
        ff = "only";
        rebase = "true";
      };
      rebase = {
        autoStash = "true";
        autoSquash = "true"; # useful for `git commit --fixup <hash>` (https://fle.github.io/git-tip-keep-your-branch-clean-with-fixup-and-autosquash.html)
        ignore-space-change = "true";
      };
      status = {
        showUntrackedFiles = "all";
      };
      commit = {
        verbose = "true";
      };
      diff = {
        algorithm = "histogram";
        indentHeuristic = "true";
        wordRegex = "[A-Z][a-z]*|[a-z]+|[^[:space:]]"; # see camel case as separate words
        ignore-space-change = "true";
      };
      credentials = {
        helper = "osxkeychain";
      };
      alias = {
        s = "status"; 
        a = "add";
        aa = "add --all";  
        ch = "checkout"; 
        chb = "checkout -b";
        cm = "commit -m";
        prev = "reset HEAD~1"; # undo last commit
        b = "branch";
        ba = "branch --all";
        ps = "push";
        pf = "push --force-with-lease";
        pl = "pull --rebase --autostash";
        d = "diff --color-words";
        h = "help";
        # show git log with a graph
        lg= "log --oneline --all --graph --decorate"; 
        # push current branch to origin
        po = "!git push --set-upstream origin \"$(git rev-parse --abbrev-ref HEAD)\""; 
        # delete local branches that are not anymore present on the remote
        prune-local = "!git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == \"[gone]\" {sub(\"refs/heads/\", \"\", $1); print $1}'); do (echo -n \"DELETE $branch? [y/N]: \"; read -r answer; [[ \"$answer\" =~ ^(y|Y) ]]) && git branch -D $branch; done";
      };
      # push = {
      #   default = "current";
      # };
    };
  };
}

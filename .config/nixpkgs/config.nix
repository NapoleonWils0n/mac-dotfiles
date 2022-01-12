{
  packageOverrides = pkgs: with pkgs; rec {
    myProfile = writeText "my-profile" ''
      export PATH=$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/sbin:/bin:/usr/sbin:/usr/bin
      export MANPATH=$HOME/.nix-profile/share/man:/nix/var/nix/profiles/default/share/man:/usr/share/man
      export INFOPATH=$HOME/.nix-profile/share/info:/nix/var/nix/profiles/default/share/info:/usr/share/info
    '';
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
        (runCommand "profile" {} ''
          mkdir -p $out/etc/profile.d
          cp ${myProfile} $out/etc/profile.d/my-profile.sh
        '')
        apg
        aria
        bat
        bc
        curl
        csvkit
        dos2unix
        emacs
        exiftool
        exa
        fzf
        gdal
        gimp
        git
        gnuplot
        graphviz
        html-xml-utils
        imagemagick
        jq
        lynx
        mediainfo
        nnn
        ncdu
        newsboat
        oathToolkit
        pandoc
        p7zip
        ripgrep
        sox
        shellcheck
        surfraw
        tig
        tmux
        tree
        unzip
        viddy
        urlscan
        urlview
        ytfzf
        yt-dlp
        w3m
        zathura
        zip
      ];
      pathsToLink = [ "/share/man" "/share/doc" "/share/info" "/share/applications" "/share/icons" "/bin" "/etc" ];
      extraOutputsToInstall = [ "man" "doc" "info" "applications" "icons" ];
      postBuild = ''
        if [ -x $out/bin/install-info -a -w $out/share/info ]; then
          shopt -s nullglob
          for i in $out/share/info/*.info $out/share/info/*.info.gz; do
              $out/bin/install-info $i $out/share/info/dir
          done
        fi
      '';
    };
  };
}

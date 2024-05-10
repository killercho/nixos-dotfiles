# User neovim config
{ config, pkgs, ... }:

{
  #home.packages = with pkgs; [
    #neovim
  #];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    #vimAlias = true;

    coc.enable = true;
    coc.settings = {
      # JSON values
    };
    coc.pluginConfig = ''
    '';

    plugins = [
    ];

    extraConfig = ''
    '';

    extraLuaConfig = ''
    '';
  };
}

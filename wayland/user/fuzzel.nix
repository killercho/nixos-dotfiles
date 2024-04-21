# User fuzzel config
{ config, pkgs, lib, ... }:

{
	programs.fuzzel = {
		enable = true;
		settings = {
			main = {
				font = ''DejaVu Sans'' + '':size=12'';
				dpi-aware = "no";
			};
			colors = {
				background = config.lib.stylix.colors.base00 + ''99'';
				border = config.lib.stylix.colors.base0D + ''ff'';
				match = config.lib.stylix.colors.base0A + ''ff'';
				selection = config.lib.stylix.colors.base03 + ''ff'';
				selection-match = config.lib.stylix.colors.base0A + ''ff'';
				selection-text = config.lib.stylix.colors.base05 + ''ff'';
				text = config.lib.stylix.colors.base05 + ''ff'';
			};
		};
	};
}

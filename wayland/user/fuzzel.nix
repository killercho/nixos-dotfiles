# User fuzzel config
{ config, pkgs, lib, ... }:

{
	programs.fuzzel = {
		enable = true;
		settings = {
		};
	};
}

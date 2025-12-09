{
  imports = [ 
	#./colorscheme.nix 
	./keymaps.nix 
	./options.nix 
	];

  performance = {
    byteCompileLua = {
      enable = true;
      configs = true;
      plugins = true;
      nvimRuntime = false;
      luaLib = false;
    };
  };
}

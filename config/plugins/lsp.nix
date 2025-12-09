{ pkgs, ... }:
{
  plugins = {
    goto-preview = {
      enable = true;
      settings = {
        border = "rounded";
        default_mappings = false;
      };
    };
    inc-rename = {
      enable = true;
    };

    actions-preview = {
      enable = true;
    };

    nvim-lightbulb = {
      enable = true;
      settings = {
        autocmd = {
          enabled = true;
        };
        priority = 1000;
      };
    };
  };
}

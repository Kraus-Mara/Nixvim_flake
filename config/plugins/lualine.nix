{
  plugins.lualine = {
    enable = true;

    settings = {
      options = {
        globalstatus = true;
        disabled_filetypes = {
          statusline = [ "dashboard" "alpha" "ministarter" "snacks_dashboard" ];
        };
      };

      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" ];

        lualine_c = [
          {
            __unkeyed-1.__raw = ''
              function()
                local root = vim.fs.find({".git", "flake.nix", "Cargo.toml"}, { upward = true })[1]
                if root then
                  local dir = vim.fs.dirname(root)
                  return "󱉭 " .. vim.fn.fnamemodify(dir, ':t')
                end
                return ""
              end
            '';
            color = { fg = "#83a598"; };
          }

          {
            __unkeyed-1 = "diagnostics";
            symbols = {
              error = " ";
              warn = " ";
              info = " ";
              hint = " ";
            };
          }

          {
            __unkeyed-1 = "filetype";
            icon_only = true;
            separator = "";
            padding = { left = 1; right = 0; };
          }
          {
            __unkeyed-1 = "filename";
            padding = { left = 0; right = 1; };
          }
        ];

        lualine_x = [
          {
            __unkeyed-1.__raw = ''
              function() 
                local ok, noice = pcall(require, "noice")
                if ok and noice.api and noice.api.status and noice.api.status.command and noice.api.status.command.has() then
                  local cmd = noice.api.status.command.get()
                  return type(cmd) == "string" and cmd or ""
                end
                return ""
              end
            '';
            cond.__raw = ''
              function() 
                local ok, noice = pcall(require, "noice")
                return ok and noice.api and noice.api.status and noice.api.status.command and noice.api.status.command.has()
              end
            '';
            color.__raw = ''
              function() 
                return { fg = "#fabd2f" }
              end
            '';
          }

          {
            __unkeyed-1 = "diff";
            symbols = {
              added = " ";
              modified = " ";
              removed = " ";
            };
          }
        ];

        lualine_y = [
          "progress"
          "location"
        ];

        lualine_z = [
          {
            __unkeyed-1 = "os.date('%R')";
            icon = " ";
            color = { fg = "#282828"; bg = "#83a598"; };
          }
        ];
      };

      extensions = [ "lazy" ];
    };
  };
}

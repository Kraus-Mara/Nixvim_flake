{ pkgs, ... }:
{
  plugins = {
    better-escape = {
      enable = true;
    };

    lastplace = {
      enable = true;
    };

    yanky = {
      enable = true;
      settings = {
        highlight = {
          on_put = true;
          on_yank = true;
          timer = 150;
        };
        ring = {
          history_length = 100;
          storage = "shada";
        };
      };
    };

    spider = {
      enable = true;
      settings = {
        # skipInsignificantPunctuation = true; # ignore ;, :, etc.
      };
      # Configuration minimale recommandée
      keymaps = {
        motions = {
          w = "w";
          e = "e";
          b = "b";
          ge = "ge";
        };
      };
    };

    todo-comments = {
      enable = true;
    };

    auto-save = {
      enable = true;
      settings = {
        enabled = true;
        noautocmd = true;
        trigger_events = {
          immediate_save = [
            "BufLeave"
            "FocusLost"
          ];
          defer_save = [
            "InsertLeave"
            "TextChanged"
          ];
          cancel_deferred_save = [ "InsertEnter" ];
        };

        conditions = {
          exists = true;
          filename_is_not = [ ];
          filetype_is_not = [ "oil" ];
          modifiable = true;
        };
        debounce_delay = 135;
      };
    };

    persistence = {
      enable = true;
    };

    precognition = {
      enable = false;
      settings.showBlankVirtLine = false;
    };

    flash.enable = true;

    hex.enable = true;
  };

  plugins.which-key.settings.spec = [
    { __unkeyed-1 = "<leader>r"; group = "Persistence"; icon = { icon = ""; color = "blue"; }; }
  ];

  extraPlugins = with pkgs.vimPlugins; [
    plenary-nvim # Requis pour todo-comments.nvim
  ];

  extraPackages = with pkgs; [
    xxd # Pour hex
  ];

  keymaps = [
    {
      mode = [ "n" "x" ];
      key = "p";
      action = "<Plug>(YankyPutAfter)";
      options.desc = "Put After";
    }
    {
      mode = [ "n" "x" ];
      key = "P";
      action = "<Plug>(YankyPutBefore)";
      options.desc = "Put Before";
    }

    {
      mode = "n";
      key = "<leader>p";
      action = "<cmd>YankyRingHistory<cr>";
      options.desc = "Yank History";
    }

    # Navigation TODO
    {
      mode = "n";
      key = "]t";
      action.__raw = ''function() require("todo-comments").jump_next() end'';
      options.desc = "Next Todo Comment";
    }
    {
      mode = "n";
      key = "[t";
      action.__raw = ''function() require("todo-comments").jump_prev() end'';
      options.desc = "Previous Todo Comment";
    }
  ];

  extraConfigLua = ''
    vim.api.nvim_create_autocmd("User", {
      pattern = "AutoSaveWritePre",
      callback = function()
        -- Validation silencieuse avant sauvegarde
        if vim.bo.readonly or not vim.bo.modifiable then
          require("auto-save").off()  
        end
      end,
    })
  '';
}

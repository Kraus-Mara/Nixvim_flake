{
  plugins.dropbar = {
    enable = true;

    settings = {
      bar = {
        enable = {
          __raw = ''
            function(buf, win, _)
              -- Ne pas activer si la fenêtre est trop petite
              if vim.api.nvim_win_get_height(win) < 10 then
                return false
              end
              
              -- Désactiver pour les filetypes problématiques
              local disabled_fts = { 
                'snacks_dashboard', 'snacks_terminal', 'snacks_picker',
                'lazy', 'mason', 'lspinfo', 'help', 'qf', 'quickfix'
              }
              
              if vim.tbl_contains(disabled_fts, vim.bo[buf].ft) then
                return false
              end
              
              -- Désactiver dans les fenêtres flottantes
              local config = vim.api.nvim_win_get_config(win)
              if config.relative ~= "" then
                return false
              end
              
              return true
            end
          '';
        };
      };

      icons = {
        ui = {
          bar = {
            separator = " › ";
          };
        };
      };

      menu = {
        win_configs = {
          border = "rounded";
        };
        max_height = 15;
      };
    };
  };
  plugins.telescope = {
    extensions = {
      fzf-native = {
        enable = true;
      };
    };
  };
}

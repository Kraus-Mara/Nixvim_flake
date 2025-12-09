{
  plugins.bufferline = {
    enable = true;

    settings = {
      options = {
        close_command.__raw = ''
          function(n)
            require("snacks").bufdelete(n)
          end
        '';
        right_mouse_command.__raw = ''
          function(n)
            require("snacks").bufdelete(n)
          end
        '';

        diagnostics = "nvim_lsp";
        diagnostics_indicator.__raw = ''
          function(_, _, diag)
            local icons = {
              Error = "Err ",
              Warn = "Warn ", 
              Info = "Info ",
              Hint = "Hint ",
            }
            local ret = (diag.error and icons.Error .. diag.error .. " " or "")
              .. (diag.warning and icons.Warn .. diag.warning or "")
            return vim.trim(ret)
          end
        '';
        always_show_bufferline = false;
        offsets = [
          {
            filetype = "neo-tree";
            text = "Neo-tree";
            highlight = "Directory";
            text_align = "left";
          }
          {
            filetype = "snacks_layout_box";
          }
        ];

        max_name_length = 18;
        tab_size = 18;
        hover = {
          delay = 200;
          reveal = [ "close" ];
        };
      };
    };
  };
}

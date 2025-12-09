{
  plugins = {
    blink-cmp = {
      enable = true;

      settings = {
        keymap = {
          preset = "none";

          "<Tab>" = [ "select_next" "fallback" ];
          "<S-Tab>" = [ "select_prev" "fallback" ];

          "<CR>" = [ "accept" "fallback" ];
          "<C-y>" = [ "accept" ];

          "<C-n>" = [ "select_next" ];
          "<C-p>" = [ "select_prev" ];

          "<C-e>" = [ "hide" "fallback" ];
          "<C-space>" = [ "show" ];

          "<C-d>" = [ "scroll_documentation_down" "fallback" ];
          "<C-u>" = [ "scroll_documentation_up" "fallback" ];

          "<C-l>" = [ "snippet_forward" "fallback" ];
          "<C-h>" = [ "snippet_backward" "fallback" ];
        };
        sources = {
          default = [ "lsp" "path" "snippets" "buffer" ];
        };
        appearance = {
          use_nvim_cmp_as_default = true;
          nerd_font_variant = "mono";
        };
        completion = {
          accept = {
            auto_brackets = {
              enabled = true;
            };
          };

          documentation = {
            auto_show = true;
            window = {
              border = "rounded";
            };
          };

          menu = {
            border = "rounded";
          };

          ghost_text = {
            enabled = true;
          };
        };

        signature = {
          enabled = true;
          window = {
            border = "rounded";
          };
        };
      };
    };

    friendly-snippets = {
      enable = true;
    };
  };
}

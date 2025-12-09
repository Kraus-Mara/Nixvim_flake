{
  plugins.mini = {
    enable = true;
    mockDevIcons = true;
    modules = {
      icons = { };

      ai = {
        n_lines = 500;
      };

      pairs = {
        modes = {
          insert = true;
          command = false;
          terminal = false;
        };
      };

      surround = {
        mappings = {
          add = "gsa";
          delete = "gsd";
          find = "gsf";
          find_left = "gsF";
          highlight = "gsh";
          replace = "gsr";
        };
      };

      comment = {
        mappings = {
          comment = "gc";
          comment_line = "gcc";
          comment_visual = "gc";
        };
      };

      hipatterns = {
        highlighters = {
          hex_color = {
            __raw = ''require('mini.hipatterns').gen_highlighter.hex_color()'';
          };
          # Couleurs courtes (#rgb)
          shorthand = {
            pattern = "()#%x%x%x()%f[^%x%w]";
            group.__raw = ''
              function(_, _, data)
                local match = data.full_match
                local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
                return require('mini.hipatterns').compute_hex_color_group("#" .. r .. r .. g .. g .. b .. b, "bg")
              end
            '';
          };
        };
      };
    };
  };

  plugins.which-key.settings.spec = [
    { __unkeyed-1 = "gs"; group = "Surround"; }
    { __unkeyed-1 = "gp"; group = "Peek/Preview"; }
  ];

}

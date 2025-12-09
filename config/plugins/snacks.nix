{
  plugins = {
    snacks = {
      enable = true;
      settings = {
        bigfile.enabled = true;
        quickfile.enabled = true;
        picker.enabled = true;
        dashboard.enabled = true;
        notifier.enabled = true;
        terminal.enabled = true;
        bufdelete.enabled = true;
        explorer.enabled = true;
        indent.enabled = true;
        scope.enabled = true;
        statuscolumn.enabled = true;
        input.enabled = true;
        scroll.enabled = true;
        git.enabled = true;
        gitbrowse.enabled = true;
        lazygit.enabled = true;
        rename.enabled = true;
        toggle.enabled = true;
        scratch.enabled = true;
        zen.enabled = true;
        profiler.enabled = true;
        animate.enabled = true;
        dim.enabled = true;
        words.enabled = true;

        dashboard = {
          preset = {
            header = [
              "
 ██████   █████  ███                        █████   █████  ███                 
▒▒██████ ▒▒███  ▒▒▒                        ▒▒███   ▒▒███  ▒▒▒                  
 ▒███▒███ ▒███  ████  █████ █████           ▒███    ▒███  ████  █████████████  
 ▒███▒▒███▒███ ▒▒███ ▒▒███ ▒▒███            ▒███    ▒███ ▒▒███ ▒▒███▒▒███▒▒███ 
 ▒███ ▒▒██████  ▒███  ▒▒▒█████▒             ▒▒███   ███   ▒███  ▒███ ▒███ ▒███ 
 ▒███  ▒▒█████  ▒███   ███▒▒▒███             ▒▒▒█████▒    ▒███  ▒███ ▒███ ▒███ 
 █████  ▒▒█████ █████ █████ █████ █████████    ▒▒███      █████ █████▒███ █████
▒▒▒▒▒    ▒▒▒▒▒ ▒▒▒▒▒ ▒▒▒▒▒ ▒▒▒▒▒ ▒▒▒▒▒▒▒▒▒      ▒▒▒      ▒▒▒▒▒ ▒▒▒▒▒ ▒▒▒ ▒▒▒▒▒ 
                                                                               
"
            ];
            keys = [
              {
                icon = " ";
                key = "f";
                desc = "Find";
                action = ":lua Snacks.dashboard.pick('files')";
              }
              {
                icon = " ";
                key = "n";
                desc = "New";
                action = ":ene | startinsert";
              }
              {
                icon = " ";
                key = "g";
                desc = "Text grep";
                action = ":lua Snacks.dashboard.pick('live_grep')";
              }
              {
                icon = " ";
                key = "r";
                desc = "Recents";
                action = ":lua Snacks.dashboard.pick('oldfiles')";
              }
              {
                icon = " ";
                key = "s";
                desc = "Sessions";
                action.__raw = "function() require('persistence').select() end";
              }
              {
                icon = " ";
                key = "q";
                desc = "Quit";
                action = ":qa";
              }
            ];
          };
          sections = [
            { section = "header"; }
            {
              section = "keys";
              gap = 1;
              padding = 1;
            }
          ];
        };
        styles._global.border = "rounded";

        picker.sources.explorer = {
          follow_file = false;
          watch = false;
        };

        scratch.ft = "markdown";
      };
      luaConfig.post = ''
        Snacks.toggle.option("number", { name = "Line Numbers" }):map("<leader>ul")
        Snacks.toggle.option("relativenumber", { name = "Relative Numbers" }):map("<leader>ur") 
        Snacks.toggle.option("wrap", { name = "Word Wrap" }):map("<leader>uw")
        Snacks.toggle.option("spell", { name = "Spell Check" }):map("<leader>us")
        Snacks.toggle.option("conceallevel", { off = 0, on = 2, name = "Conceal Level" }):map("<leader>uc")
        Snacks.toggle.option("signcolumn", { off = "no", on = "yes", name = "Sign Column" }):map("<leader>uG")
        Snacks.toggle.option("list", { name = "List Chars" }):map("<leader>uL")

        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.zen():map("<leader>uz")
        Snacks.toggle.dim():map("<leader>uD")
        Snacks.toggle.scroll():map("<leader>uS")
        Snacks.toggle.words():map("<leader>uW")
        Snacks.toggle.animate():map("<leader>ua")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.inlay_hints():map("<leader>uh")
      '';
    };
    telescope.enable = true;
  };

  plugins.which-key.settings.spec = [
    { __unkeyed-1 = "<leader>b"; group = "Buffers"; }
    { __unkeyed-1 = "<leader>f"; group = "Find/File"; }
    { __unkeyed-1 = "<leader>n"; group = "Notifications"; }
    { __unkeyed-1 = "<leader>s"; group = "Search"; }
    { __unkeyed-1 = "<leader>t"; group = "Terminal"; }
    { __unkeyed-1 = "<leader>u"; group = "UI"; }
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>bd";
      action.__raw = ''
        function()
          require("snacks").bufdelete()
        end
      '';
      options.desc = "Delete Buffer (smart)";
    }
    {
      mode = "n";
      key = "<leader>bs";
      action.__raw = ''
        function()
          require("snacks").scratch()
        end
      '';
      options.desc = "Scratch Buffer";
    }
    {
      mode = "n";
      key = "<leader>bS";
      action.__raw = ''
        function()
          require("snacks").scratch.select()
        end
      '';
      options.desc = "Select Scratch Buffer";
    }
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>lua Snacks.explorer()<cr>";
      options.desc = "Explorer";
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>lua Snacks.picker.files()<cr>";
      options.desc = "Find Files";
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>lua Snacks.picker.grep()<cr>";
      options.desc = "Find Text (Grep)";
    }
    {
      mode = "n";
      key = "<leader>fn";
      action = "<cmd>ene | startinsert<cr>";
      options.desc = "New File";
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = "<cmd>lua Snacks.picker.recent()<cr>";
      options.desc = "Recent Files";
    }
    {
      mode = "n";
      key = "<leader>fR";
      action.__raw = ''
        function()
          require("snacks").rename.rename_file()
        end
      '';
      options.desc = "Rename File";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>lua Snacks.picker.buffers()<cr>";
      options.desc = "Find Buffers";
    }
    {
      mode = "n";
      key = "<leader>fc";
      action = "<cmd>lua Snacks.picker.command_history()<cr>";
      options.desc = "Command History";
    }
    {
      mode = "n";
      key = "<leader>nh";
      action = "<cmd>lua Snacks.notifier.show_history()<cr>";
      options.desc = "Show History";
    }
    {
      mode = "n";
      key = "<leader>sb";
      action.__raw = ''function() require("snacks").picker.lines() end'';
      options.desc = "Buffer Lines";
    }
    {
      mode = "n";
      key = "<leader>sB";
      action.__raw = ''function() require("snacks").picker.grep_buffers() end'';
      options.desc = "Grep Open Buffers";
    }

    # Search operations
    {
      mode = "n";
      key = "<leader>s\"";
      action.__raw = ''function() require("snacks").picker.registers() end'';
      options.desc = "Registers";
    }
    {
      mode = "n";
      key = "<leader>s/";
      action.__raw = ''function() require("snacks").picker.search_history() end'';
      options.desc = "Search History";
    }
    {
      mode = "n";
      key = "<leader>sc";
      action.__raw = ''function() require("snacks").picker.command_history() end'';
      options.desc = "Command History";
    }
    {
      mode = "n";
      key = "<leader>sC";
      action.__raw = ''function() require("snacks").picker.commands() end'';
      options.desc = "Commands";
    }
    {
      mode = "n";
      key = "<leader>sd";
      action.__raw = ''function() require("snacks").picker.diagnostics() end'';
      options.desc = "Diagnostics";
    }
    {
      mode = "n";
      key = "<leader>sD";
      action.__raw = ''function() require("snacks").picker.diagnostics_buffer() end'';
      options.desc = "Buffer Diagnostics";
    }
    {
      mode = "n";
      key = "<leader>sh";
      action.__raw = ''function() require("snacks").picker.help() end'';
      options.desc = "Help Pages";
    }
    {
      mode = "n";
      key = "<leader>sH";
      action.__raw = ''function() require("snacks").picker.highlights() end'';
      options.desc = "Highlights";
    }
    {
      mode = "n";
      key = "<leader>si";
      action.__raw = ''function() require("snacks").picker.icons() end'';
      options.desc = "Icons";
    }
    {
      mode = "n";
      key = "<leader>sj";
      action.__raw = ''function() require("snacks").picker.jumps() end'';
      options.desc = "Jumps";
    }
    {
      mode = "n";
      key = "<leader>sk";
      action.__raw = ''function() require("snacks").picker.keymaps() end'';
      options.desc = "Keymaps";
    }
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>lua Snacks.terminal.toggle()<cr>";
      options.desc = "Toggle Terminal";
    }
  ];
}

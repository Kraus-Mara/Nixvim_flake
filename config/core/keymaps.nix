{
  keymaps = [
    # ===== moves cutom en sah louches =====
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "<C-Left>";
      action = "b";
      options.desc = "Début du mot";
    }
    {   
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "<C-Right>";
      action = "e";
      options.desc = "Fin du mot";
    }

    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<cr>";
      options.desc = "Enlever le highlight après recherche";
    }

    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>w<cr>";
      options.desc = "Sauvegarder";
    }
    {
      mode = "n";
      key = "<leader>q";
      action = "<cmd>q<cr>";
      options.desc = "Quitter";
    }

    {
      mode = "v";
      key = "<";
      action = "<gv";
      options.desc = "Désindente";
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options.desc = "Indente";
    }
  ];
}

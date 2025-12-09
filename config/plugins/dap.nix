{
  plugins = {
    dap = {
      enable = true;
    };
    dap-ui = {
      enable = true;
      settings.floating.border = "rounded";
    };

    dap-virtual-text = {
      enable = true;
      settings.enabled = true;
    };
  };
  plugins.which-key.settings.spec = [
    { __unkeyed-1 = "<leader>d"; group = "Debug"; }
  ];
  extraConfigLua = ''
    local dap, dapui = require("dap"), require("dapui")
    
    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close
    
    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "-i", "dap" }
    }
    
    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError" })
    vim.fn.sign_define('DapStopped', { text = "", texthl = "DiagnosticSignInfo", linehl = "Visual" })
  '';
}

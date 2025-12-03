return {
  "nosduco/remote-sshfs.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    require("remote-sshfs").setup({
      connections = {
        ssh_configs = {
          vim.fn.expand("$HOME") .. "/.ssh/config",
          -- "/etc/ssh/ssh_config",
          -- "/path/to/custom/ssh_config"
        },
        ssh_known_hosts = vim.fn.expand("$HOME") .. "/.ssh/known_hosts",
        -- NOTE: Can define ssh_configs similarly to include all configs in a folder
        -- ssh_configs = vim.split(vim.fn.globpath(vim.fn.expand "$HOME" .. "/.ssh/configs", "*"), "\n")
        sshfs_args = {
          "-o reconnect",
          "-o ConnectTimeout=5",
        },
      },
      mounts = {
        base_dir = vim.fn.expand("$HOME") .. "/.sshfs/",
        unmount_on_exit = true,
      },
      handlers = {
        on_connect = {
          change_dir = true,
        },
        on_disconnect = {
          clean_mount_folders = false,
        },
      },
      ui = {
        select_prompts = false,
        confirm = {
          connect = false, -- prompt y/n when host is selected to connect to
          change_dir = false, -- prompt y/n to change working directory on connection (only applicable if handlers.on_connect.change_dir is enabled)
        },
      },
      log = {
        enabled = false,
        truncate = false,
        types = {
          all = false,
          util = false,
          handler = false,
          sshfs = false,
        },
      },

      require("telescope").load_extension("remote-sshfs"),
    })
  end,
}

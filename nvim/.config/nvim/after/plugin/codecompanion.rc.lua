local state, codecompanion = pcall(require, "codecompanion")
if not state then
  return
end
codecompanion.setup({
  adapters = {
    gemini = function()
      return require("codecompanion.adapters").extend("gemini", {
        env = {
          api_key = "cmd:gpg --decrypt ~/gemini-api-key.gpg 2>/dev/null",
        },
      })
    end,
    deepseek = function()
      return require("codecompanion.adapters").extend("deepseek", {
        env = {
          api_key = "cmd:cat ~/.deepseek-api-key",
        },
      })
    end,
    opts = {
      allow_insecure = true,
      proxy = "socks5://127.0.0.1:1080",
    },
  },
  strategies = {
    chat = {
      adapter = "gemini",
      keymaps = {
        send = {
          modes = { i = "<C-b>" },
        },
      },
    },
    inline = {
      adapter = "gemini",
    },
  },
  prompt_library = {
    ["jsontoproto"] = {
      strategy = "inline",
      description = "convert a json object to gogoproto",
      opts = {
        mapping = "<LocalLeader>ch",
        modes = { "v" },
        index = 11,
        is_slash_cmd = false,
        auto_submit = false,
        short_name = "j2p",
        placement = "replace" -- or "replace"|"add"|"before"|"chat"
      },
      prompts = {
        {
          role = "user",
          content = [[Please convert the json to proto message block.

The format should be `int64 id = 1 [(gogoproto.jsontag) = 'id'];`.

Make sure it starts from 1.

And generate comment above every lines according to the json key.
]],
        },
      },
    },
  },
})

vim.keymap.set({ "n", "v" }, ";a", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, ";ct", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.cmd([[cab cc CodeCompanion]])


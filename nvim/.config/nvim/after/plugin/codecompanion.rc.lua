local state, codecompanion = pcall(require, "codecompanion")
if not state then
  return
end
local fmt = string.format

codecompanion.setup({
  adapters = {
    gemini = function()
      return require("codecompanion.adapters").extend("gemini", {
        env = {
          api_key = "cmd:gpg --decrypt ~/gemini-api-key.gpg 2>/dev/null",
        },
        schema = {
          model = {
            -- default = "gemini-2.5-pro-exp-03-25",
          },
        }
      })
    end,
    deepseek = function()
      return require("codecompanion.adapters").extend("deepseek", {
        env = {
          api_key = "cmd:cat ~/.deepseek-api-key",
        },
      })
    end,
    ollama = function()
      return require("codecompanion.adapters").extend("ollama", {
        env = {
          url = "https://test.com",
        },
        headers = {
          ["Content-Type"] = "application/json",
        },
        schema = {
          model = {
            default = "qwen2.5-coder:3b",
          },
        },
        parameters = {
          sync = true,
        },
      })
    end,
    opts = {
      allow_insecure = true,
      proxy = "socks5://192.168.1.51:1080",
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
        is_slash_cmd = true,
        auto_submit = false,
        short_name = "j2p",
        placement = "replace" -- or "replace"|"add"|"before"|"chat"
      },
      prompts = {
        {
          role = "user",
          content = [[Please convert the json to proto message block.

The format should be `int64 id = 1 [(gogoproto.jsontag) = 'id'];`.

And generate comment above every lines according to the json key.
]],
        },
      },
    },
    ["Generate Chinese git commit"] = {
      strategy = "chat",
      description = "生成中文git提交文案",
      opts = {
        index = 12,
        is_default = true,
        is_slash_cmd = true,
        auto_submit = true,
        short_name = "cn_commit",
      },
      prompts = {
        {
          role = "user",
          content = function()
            return fmt([[
请帮我生成中文git提交文案,内容是:
```diff
%s

```
前面不要添加`feat`或者`fix`等关键字.]],
              vim.fn.system("git diff --no-ext-diff --staged"))
          end
        } }
    },
    ["fix controller tests"] = {
      strategy = "inline",
      description = "修复测试参数问题",
      opts = {
        mapping = "<Leader>fc",
        index = 0,
        is_default = true,
        is_slash_cmd = true,
        auto_submit = true,
        short_name = "fix-controller-tests",
        placement = "chat" -- or "replace"|"add"|"before"|"chat"
      },
      prompts = {
        {
          role = "user",
          content = function()
            return fmt([[
请帮我修改post, get, put, delete等controller的测试用例.请求参数格式应该是 `params: { ... }`。但是要format参数不需要加到`params`里，保持原有的格式。只用替换get,post,put,delete等这一行代码，其它不修改。
比如 `get :show, id: 1, format: :json`，要修改成 `get :show, params: { id: 1 }, format: :json`。
比如 `get :show, id: 1`，要修改成 `get :show, params: { id: 1 }`。
]],
              vim.fn.system("git diff --no-ext-diff --staged"))
          end
        } }
    },
  },
})

vim.keymap.set({ "n", "v" }, ";cc", "<cmd>CodeCompanion<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, ";cca", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, ";cct", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.cmd([[cab cc CodeCompanion]])

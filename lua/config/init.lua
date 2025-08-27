--[[ Config loader. ]]--

local config = ... .. "."

-- Load 42 settings.
require(config .. "42")

-- Load builtin configs
require(config .. "builtin")

-- Load extra configs
require(config .. "extras")

-- Load custom configs
require(config .. "custom")

-- hook into diagnostic handler
local orig_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]

vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
  if result and result.diagnostics then
    -- filter out "OK!" messages
    local new_diags = {}
    for _, d in ipairs(result.diagnostics) do
      if not d.message:match("OK!") then
        table.insert(new_diags, d)
      end
    end
    result.diagnostics = new_diags
  end
  orig_handler(err, result, ctx, config)
end


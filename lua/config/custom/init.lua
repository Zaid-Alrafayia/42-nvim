
-- NOTE: Those 'custom' configurations will *never* be changed upstream. you are safe to change them at will!

local custom = ... .. "."

-- NOTE: in order to load the config for your plugins, you must put
-- 'require(custom .. "myplugin")' for every lua file that you have.
-- I personally recommend prepending "_" to your config files to differentiate from the init.lua.

-- As an example, we will set your default theme here:
require(custom .. "_themeselect")

-- Define custom highlight groups for norminette OK messages
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = '#61AFEF', italic = true })  -- Blue color
vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', { fg = '#61AFEF' })



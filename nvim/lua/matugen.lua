 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#0f150d',
    base01 = '#1b2119',
    base02 = '#252c23',
    base03 = '#899482',
    base04 = '#becab6',
    base05 = '#dee5d7',
    base06 = '#dee5d7',
    base07 = '#dee5d7',
    base08 = '#ffb4ab',
    base09 = '#9acbff',
    base0A = '#a4d395',
    base0B = '#75de63',
    base0C = '#9acbff',
    base0D = '#75de63',
    base0E = '#a4d395',
    base0F = '#bff0af',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#dee5d7',          bg = '#0f150d' })
  hi('TelescopeBorder',         { fg = '#899482',             bg = '#0f150d' })
  hi('TelescopePromptNormal',   { fg = '#dee5d7',          bg = '#0f150d' })
  hi('TelescopePromptBorder',   { fg = '#899482',             bg = '#0f150d' })
  hi('TelescopePromptPrefix',   { fg = '#75de63',             bg = '#0f150d' })
  hi('TelescopePromptCounter',  { fg = '#becab6',  bg = '#0f150d' })
  hi('TelescopePromptTitle',    { fg = '#0f150d',             bg = '#75de63' })
  hi('TelescopePreviewTitle',   { fg = '#0f150d',             bg = '#a4d395' })
  hi('TelescopeResultsTitle',   { fg = '#0f150d',             bg = '#9acbff' })
  hi('TelescopeSelection',      { fg = '#dee5d7',          bg = '#252c23' })
  hi('TelescopeSelectionCaret', { fg = '#75de63',             bg = '#252c23' })
  hi('TelescopeMatching',       { fg = '#75de63',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#dee5d7',          bg = '#0f150d' })
  hi('MiniPickBorder',         { fg = '#899482',             bg = '#0f150d' })
  hi('MiniPickPrompt',   { fg = '#dee5d7',          bg = '#0f150d' })
  hi('MiniPickPromptPrefix',   { fg = '#75de63',             bg = '#0f150d' })
  hi('MiniPickBorderText',    { fg = '#0f150d',             bg = '#75de63' })
  hi('MiniPickMatchCurrent',      { fg = '#dee5d7',          bg = '#252c23' })
  hi('MiniPickPromptCaret', { fg = '#75de63',             bg = '#252c23' })
  hi('MiniPickMatchRanges',       { fg = '#75de63',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M

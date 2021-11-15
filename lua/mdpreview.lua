local api = vim.api
local fun = vim.fn
local function expand(path)
  if path then
    path:gsub("%s+", "")
    path:gsub("\"", "")
    local path0 = fun.fnamemodify(fun.expand(path), ":p")
    return path0
  else
    return expand("%")
  end
end
local function preview(file)
  local file0 = expand(file)
  local ceil = math.ceil
  local vim_width = api.nvim_get_option("columns")
  local vim_height = api.nvim_get_option("lines")
  local height = ceil(((0.8 * vim_height) - 4))
  local width = ceil((0.8 * vim_width))
  local row = ceil((((vim_height - height) / 2) - 1))
  local col = ceil(((vim_width - width) / 2))
  local buf = api.nvim_create_buf(false, true)
  local win = api.nvim_open_win(buf, true, {style = "minimal", relative = "editor", width = width, height = height, row = row, col = col, border = (vim.g.mdcat_border or "rounded")})
  api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  api.nvim_win_set_option(win, "winblend", 0)
  api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>bd<CR>", {noremap = true, silent = true})
  api.nvim_buf_set_keymap(buf, "n", "<ESC>", "<cmd>bd<CR>", {noremap = true, silent = true})
  return fun.termopen(string.format("env TERM=%s %s %s", (vim.g.md_term or vim.env.TERM), (vim.g.md_previewer or "mdcat"), fun.shellescape(file0)))
end
return {preview = preview}

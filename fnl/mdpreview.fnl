(local api vim.api)
(local fun vim.fn)

(fn expand [path]
 (if path
  (do
   (path:gsub "%s+" "")
   (path:gsub "\"" "")
   (let [path (fun.fnamemodify (fun.expand path) ":p")]
    path))
  (expand "%")))

(fn preview [file]
 (let [file (expand file)
       ceil math.ceil
       vim_width (api.nvim_get_option :columns)
       vim_height (api.nvim_get_option :lines)
       height (ceil (- (* 0.8 vim_height) 4))
       width (ceil (* 0.8 vim_width))
       row (ceil (- (/ (- vim_height height) 2) 1))
       col (ceil (/ (- vim_width width) 2))
       buf (api.nvim_create_buf false true)
       win (api.nvim_open_win buf true {:style :minimal
                                        :relative :editor
                                        :width width
                                        :height height
                                        :row row
                                        :col col
                                        :border (or vim.g.mdcat_border :rounded)})]
  (api.nvim_buf_set_option buf :bufhidden :wipe)
  (api.nvim_win_set_option win :winblend 0)
  (api.nvim_buf_set_keymap buf :n :q "<cmd>bd<CR>" {:noremap true
                                                    :silent true})
  (api.nvim_buf_set_keymap buf :n :<ESC> "<cmd>bd<CR>" {:noremap true
                                                        :silent true})
  (fun.termopen (string.format "env TERM=%s %s %s"
                               (or vim.g.md_term vim.env.TERM)
                               (or vim.g.md_previewer :mdcat)
                               (fun.shellescape file)))))

{:preview preview}

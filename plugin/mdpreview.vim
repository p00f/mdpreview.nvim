command -nargs=? -complete=file Mdpreview :lua require("mdpreview").preview(<f-args>)

# mdpreview.nvim

Show markdown previews in a floating window.

## Requirements

A markdown previewer like [mdcat](https://github.com/lunaryorn/mdcat), [mdr](https://github.com/MichaelMure/mdr), [glow](https://github.com/charmbracelet/glow) or [bat](https://github/sharkdp/bat).

## Globals

 - `g:md_previewer`: Previewer to use, must be executable. Default: `mdcat`
 - `g:md_term`: `$TERM` passed to the previewer. Default: `vim.env.TERM`

## Usage
Preview current file:
```vim
:Mdpreview
```

Preview any file:
```vim
:Mdpreview foo/bar.md
```

## Credits
https://github.com/ellisonleao/glow.nvim
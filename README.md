# mdpreview.nvim

Show markdown previews in a floating window using _any terminal previewer of your choice_.

## Requirements

A terminal markdown previewer like [mdcat](https://github.com/lunaryorn/mdcat), [mdr](https://github.com/MichaelMure/mdr), [glow](https://github.com/charmbracelet/glow) or [bat](https://github/sharkdp/bat).

## Globals

 - `g:md_previewer`: Previewer to use, must be executable. Default: `mdcat`
 - `g:md_term`: `$TERM` passed to the previewer. Default: `:echo $TERM`.
 - `g:md_border`: Border to be used for the floating window. Default: `rounded`, possible values: `:h nvim_open_win()`

## Usage
Preview current file:
```vim
:Mdpreview
```

Preview any file:
```vim
:Mdpreview foo/bar.md
```
If the previewer pages output you can go to insert mode inside the floating window to scroll.

## Credits
https://github.com/ellisonleao/glow.nvim

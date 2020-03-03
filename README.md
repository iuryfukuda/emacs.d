# Emacs.d

Emacs.d saves the customization of emacs

## Theme

- [Dracula](https://draculatheme.com/emacs/)

## Changed Keys

help
```
<f1> -> help
```

help and text manipulation:
```
C-h  -> delete backward char
M-p  -> mark paragraph
C-h  -> delete backward char
M-h  -> delete backward word
```

movement in panels:
```
C-c b -> windows left
C-c f -> windows right
C-c p -> windows up
C-c n -> windows down
```

copy to X clipboard when `--no-window-system|-nw` is activated
```
C-c w   -> copy to clipboard
C-c y   -> paste from clipboard
C-c C-w -> kill to clipboard
```

buffer change
```
C-x j -> next-buffer
C-x p -> previous-buffer
```

## Modes

list of modes supported

### Go

Used:
- [go-mode](https://github.com/vibhavp/go-complete)
- [go-complete](https://github.com/vibhavp/go-complete)

#### Requirements

- [godef](github.com/rogpeppe/godef)
- [goimports](golang.org/x/tools/cmd/goimports)
- [gocode](github.com/mdempsky/gocode)

#### Changed Keys
```
M-.   -> godef-jump
C-c d -> godoc-at-point
C-M-i -> go-complete-at-point
```

### Elixir

Used:
- [elixir-mode](https://github.com/elixir-editors/emacs-elixir)

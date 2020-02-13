# Emacs.d

Reposity for save the customization made for personal usage of emacs

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

## Modes

list of modes supported

### Go

Used go-mode in .go files

#### Requirements

- [godef](github.com/rogpeppe/godef)
- [godef](golang.org/x/tools/cmd/goimports)

### Changed Keys
```
M-.   -> godef-jump
C-c d -> godoc-at-point
```
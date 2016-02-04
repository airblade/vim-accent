# vim-accent

A Vim plugin for typing accented characters without having to remember the handful of pseudo versions.  It's an alternative to digraphs and the accents keymap.

How would you type `ä` in insert mode?  How would you replace `a` with `ä` in normal mode?


## With this plugin

In insert mode: type `a` and hit `<CTRL-X><CTRL-U>` to bring up a list of accented `a`s to choose from.

In normal mode with the cursor on `a`: use `gx` to cycle through the alternatives.


## Digraphs

In insert mode: type `<CTRL-K>a:`.

In normal mode with the cursor on `a`: type `r<CTRL-K>a:`.

See `:help digraphs`.


## Accents keymap

Type `:set keymap=accents`.  This could be in your vimrc.

In insert mode: type `:a`.

In normal mode with the cursor on `a`: type `r:a`.

See `:help mbyte-keymap` and `$VIMRUNTIME/keymap/accents.vim`.  You can toggle the keymap on and off with `<CTRL-^>` in insert mode or command mode.


## Limitations

The plugin uses a custom completion function for its list of accents, but Vim only allows one type of custom completion at a time.  A workaround is to use a wrapper function, as described [at the end of this article](http://junegunn.kr/2014/06/emoji-completion-in-vim/).

The plugin could allow you to opt in or out of accents by language...but it doesn't yet.


## Licence

Copyright Andrew Stewart.  Distributed under the MIT licence.


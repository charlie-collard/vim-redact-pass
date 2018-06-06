redact\_pass.vim
================

This plugin switches off the` 'viminfo'`, `'backup'`, `'swapfile'`, and
`'undofile'` options locally for the buffer when editing passwords in the
`pass(1)` password manager, or a comparable tool if `g:redact_pass_pattern` is
set beforehand.

This is to prevent anyone being able to extract passwords from your Vim cache
files in the event of a compromise.

Test this carefully to make sure it works! If it doesn't, it is probably
because you need to set `g:redact_pass_pattern` to fit your system's behaviour,
or the plugin hasn't loaded at all.

License
-------

Copyright (c) [Tom Ryder][1]. Distributed under the same terms as Vim itself.
See `:help license`.

[1]: https://sanctum.geek.nz/

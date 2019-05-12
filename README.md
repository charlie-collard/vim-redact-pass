redact\_pass.vim
================

This plugin switches off the 'viminfo', 'backup', 'writebackup', 'swapfile',
and 'undofile' options globally when editing a password in `pass(1)`.

This is to prevent anyone being able to extract passwords from your Vim cache
files in the event of a compromise.

You should test this after installed to ensure you see this message is printed
whenever you `pass edit`:

> Editing password file--disabled leaky options!

License
-------

Copyright (c) [Tom Ryder][1].  Distributed under the same terms as Vim itself.
See `:help license`.

[1]: https://sanctum.geek.nz/

# dotvim

dotvim contains my personal Vim setup. It's managed using Pathogen and Redo
for building the plugin setup.

This is brand new so currently I only have a few plugins setup, as they were
all located at github and it was easy to get it working.

I have Pathogen seperated out from the rest of the plugins. Working on a
better solution for this.

# Usage

Get the repository:

    git clone https://github.com/asenchi/dotvim ~/.vim
    cd ~/.vim
    redo pathogen  # If you haven't installed pathogen.
    redo all clean # Substitute './bin/do' if you do not have 'redo'.

# Adding plugins

Currently only git is supported, but that shouldn't be too big of an issue
considering this [repo](https://github.com/vim-scripts).

To add a plugin, paste the git link into plugins.list and then run:

    redo # Or ./bin/do if you do not have 'redo'
    

# LICENSE

Copyright 2011, Curt Micol


    Copyright (c) 2011, Curt Micol <asenchi@asenchi.com>
    
    Permission to use, copy, modify, and/or distribute this software for any
    purpose with or without fee is hereby granted, provided that the above
    copyright notice and this permission notice appear in all copies.
    
    THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
    WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
    MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
    ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
    WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
    ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
    OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

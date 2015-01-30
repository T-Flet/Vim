Vim Configuration
===

My personal Vim configuration file(s) with related programs and data.

Started from general tips and tricks gathered from use, research and
study of the best vimrcs found through it, and (hopefully) ending in a
complete configuration with asimptotically slowing evolution over time.

The main goal of this configuration is to add features and polish the GUI
without taking anything away from the standard ones, while sometimes "fixing"
some percieved inconsistencies within them.
In short, this aims to be a Vi IMproved IMproved configuration, XD.


Some Nice Features
===

A very small selection of the many implemented settings is:

    Session tabs restoration at startup.
    Alt-[hjkl] to move lines vertically and horizontally (indent/unindent)
    Double click on a word to show matches.
    GUI features: useful statusbar contents, next match flash highlighting...
    Many extra <leader> mappings (keyboard shortcuts).
    An optional "familiar" mode wich enables commonly known non-Vim shortcuts.


How to use/Install
===

1 - Open the _vimrc file from this repository.

2 - Set the $REPO_PATH variable to the path to this repository.
        Note: Make sure the path ends with the path separator ( / ).

3 - Decide which configurations to implement in your Vim by commenting or
    uncommenting the following "source" lines in the _vimrc file:

        Basic:      The only essential source; it contains all the simple
                    non extensions-related settings.

        Advanced:   Contains all the non-essential and non extensions-related
                    settings, like long and useful functions.

        Extensions: Contains all the extensions-related settings;
                    some of them will override others set in the previous files.

        Filetypes:  Contains all the filetype and language related settings.

        Familiar:   Contains all the necessary settings to make Vim behave more
                    or less like a "normal" text editor, such as the
                    Ctrl+[xcvzya] key mappings and making the arrows move the
                    cursor instead of text lines (as set in the Basic file).
                    Useful mode while learning to properly use Vim or in order
                    not to give up known and common keyboard shortcuts.

4 - Copy the edited _vimrc file to your Vim installation folder.

5 - INCOMPLETE: Run the provided updater program; it will:
        - Read the _vimrc file to gather information (repository path and
          enabled sources).
        - Update the repository.
        - Update all the enabled extensions
        - Check whether a newer version of Vim is available for download.


INCOMPLETE STUFF
===

advanced_vimrc.vim
filetypes_vimrc.vim
extensions_vimrc.vim
updater.hs

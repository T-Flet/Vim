Vim Configuration
===

My personal Vim configuration file(s) with related programs and data.

Started from general tips and tricks gathered from use, research and
study of the best vimrcs found through it, and (hopefully) ending in a
complete configuration with asimptotically slowing evolution over time.

The main goal of this configuration is to add features and polish the GUI
without taking anything away from the standard ones, while sometimes "fixing"
some percieved inconsistencies within them.

This means that I have tried not to change any default Vim command behaviour
except by adding extra functionalities; one exeption to this is changing the
Y map to act like D and C, i.e. to yank until EOL rather than act as yy,
which is the default.

In short, this aims to be a Vi IMproved IMproved configuration, XD.

All files in this repository are extremely organised and well commented,
hence the absence of a detailed features list here.


Some Nice Features
===

A very small selection of the many implemented settings is:

    - Session tabs restoration at startup.
    - Alt-[hjkl] to move lines vertically and horizontally (indent/unindent)
    - "Smart" quotes and brackets: autocompleting and "skipping" if present
    - * and # also work as proper word search queries (highlighting and all)
    - Double click on a word to show matches.
    - GUI features: useful statusbar contents, next match flash highlighting...
    - Useful <leader>r shortcut to reload the _vimrc or .vimrc (fixes almost anything).
    - Many extra <leader> mappings (keyboard shortcuts).
    - An optional "familiar" mode wich enables commonly known non-Vim shortcuts.


How to use/Install
===


2 - Set the $REPO_PATH variable to this repository's path.
        Note: Make sure the path ends with the path separator ( / ).

3 - Decide which configurations to implement in your Vim by commenting or
    uncommenting the following "source" lines in the _vimrc or .vimrc file:

        Main:      The only essential source; it contains all the simple
                    non extensions-related settings.

        Advanced:   Contains all the non-essential and non extensions-related
                    settings, like long and useful functions.

        Extensions: Contains all the extensions-related settings;
                    some of them will override others set in the previous files.

        Filetypes:  Contains all the filetype and language related settings.

        Familiar:   Contains all the necessary settings to make Vim behave more
                    or less like a "normal" text editor, such as the
                    Ctrl+[xcvzyaf] key mappings and making the arrows move the
                    cursor instead of text lines (as set in the Main file).
                    Useful mode while learning to properly use Vim or in order
                    not to give up known and common keyboard shortcuts.
                    This mode DOES NOT take away any functionality from the
                    other configuration files; it simply adds the "familiar"
                    options, which you can choose not to use, but some of
                    which are quite useful.

        Theme:      Contains all the text and colours related settings.

4 - Copy the edited _vimrc or .vimrc file to your Vim installation folder or
    wherever your Vim would look for it.

5 - INCOMPLETE: Run the provided updater program; it will:
        - Read the _vimrc or .vimrc file to gather information (repository path and
          enabled sources).
        - Update the repository.
        - Update all the enabled extensions
        - Check whether a newer version of Vim is available for download.


Tips and Tricks
===

If anything (a key combination or any behaviour) does not work as you expect,
try and understand what it is actually doing by searching the various
configuration files with a few relevant keywords key combinations.
This will bring you to the lines which deal with the issue; I have strived to
make the comments as explainatory as possible, and I am confident that reading
them will clear things up. If not, try going through the help pages (the
command is :h KEYWORD). If not even that helps, feel free to raise an issue on
GitHub, and I will try and solve the problem.


INCOMPLETE STUFF
===

filetypes_vimrc.vim
extensions_vimrc.vim
updater.hs

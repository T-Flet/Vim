Vim Configuration
===

My personal Vim configuration file(s) with related programs and data.

Started from general tips and tricks gathered from use, research and
study of the best vimrcs found through it, and (hopefully) ending in a
complete configuration with asimptotically slowing evolution over time.

How to use/Install
===

The real _vimrc should be edited with your paths and copied into the real Vim
folder, while the rest of the files should stay in the repository's folder.
Note: Make sure the paths end with the path separator ( / ).

The different configuration files can be used in different ways, chiefly by
commenting/uncommenting "source" lines in the real _vimrc:

    Basic configuration:    keep only the basic source uncommented
    Advanced configuration: keep the basic and the advanced sources uncommented
    Full configuration:     keep everything uncommented
    "Familiar" mode:        keep the "familiar" source uncommented
    Configure extensions:   keep the extensions source uncommented
    Configure filetypes:    keep the filetypes source uncommented
    Any other way:          comment/uncomment any source you like

An updater program is provided; it updates this repository's files,
all extensions and checks Vim's own version.


INCOMPLETE STUFF
===

advanced_vimrc.vim
extensions_vimrc.vim
filetypes_vimrc.vim
updater.hs

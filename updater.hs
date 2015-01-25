-- INTRODUCTION ---------------------------------------------------------------
--
--   Author:
--       Dr-Lord
--   Version:
--       0.1 - 23-24/01/2014
--
--   Repository:
--       https://github.com/Dr-Lord/Vim
--
--   Description:
--       This program updates this repository (including the real _vimrc in the
--       real Vim folder, if modified), all the extensions, and checks Vim's
--       version as well.
--
--   Sections:
--       1 - Instructions
--       2 - Imports
--       3 - Update Repository
--       4 - Update Extensions
--       5 - Check Vim Version
--       6 - Helper Functions



---- 1 - INSTALLATION ----------------------------------------------------------
--
--  Install the Haskell Platform: https://www.haskell.org/platform/
--  Run these commands to get the necessary module(s):
--      cabal update
--      (probably) cabal install cabal-install
--      cabal get zip-archive
--

---- 2 - IMPORTS ---------------------------------------------------------------

import Codec.Archive.Zip


---- 3 - UPDATE REPOSITORY -----------------------------------------------------

main = do
    extensions <- readFile "extensions_list.txt"
    return ()

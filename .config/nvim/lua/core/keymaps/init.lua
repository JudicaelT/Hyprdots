---------------------------------------------------------------------
--  ___                     _            _   _
-- |_ _|_ __  _ __  ___ _ _| |_ __ _ _ _| |_| |
--  | || '  \| '_ \/ _ \ '_|  _/ _` | ' \  _|_|
-- |___|_|_|_| .__/\___/_|  \__\__,_|_||_\__(_)
--           |_|
--
-- These keymaps have been made with an Azerty (french)
-- keyboard layout in mind. Therefore, some remaps may not be
-- appropriate for other layouts
---------------------------------------------------------------------

vim.g.mapleader = " " -- Set spacebar as leader key

require("core.keymaps.navigation")
require("core.keymaps.lsp")
require("core.keymaps.git")
require("core.keymaps.extra")

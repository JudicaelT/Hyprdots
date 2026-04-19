return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local isEnabled, git = pcall(require, "gitsigns")
            if isEnabled then
                git.setup()
            end
        end
    },
}

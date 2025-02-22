return {
    {
        'f-person/git-blame.nvim',
        config = function()
            vim.g.gitblame_enabled = 1 -- Disable by default, toggle manually
            vim.g.gitblame_date_format = '%Y-%m-%d' -- Date format for blame message
            vim.g.gitblame_message_template = '<summary> • <date> • <author>' -- Custom blame message template
        end
    }
}

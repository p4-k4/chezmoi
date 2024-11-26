return {
    "pasky/claude.vim",
    lazy = false,
    config = function()
        -- Set up keybindings with default values
        vim.g.claude_map_implement = "<Leader>ci"
        vim.g.claude_map_open_chat = "<Leader>cc" 
        vim.g.claude_map_send_chat_message = "<C-]>"
        vim.g.claude_map_cancel_response = "<Leader>cx"

        -- Claude API key needs to be set by user in their own config
        -- vim.g.claude_api_key = 'your_api_key_here'
        
        -- Optional: Enable AWS Bedrock as Claude provider
        -- vim.g.claude_use_bedrock = 1
    end,
}

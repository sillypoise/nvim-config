local status_1, comment = pcall(require, "Comment")
if (not status_1) then return end

return {
    -- commenting functionality
    'numToStr/Comment.nvim',
    config = function()
        comment.setup {
            pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        }
    end
}

-- Copilot Chat – interactive AI chat panel
-- https://github.com/CopilotC-Nvim/CopilotChat.nvim
local ok, chat = pcall(require, "CopilotChat")
if not ok then
  return
end

chat.setup({
  debug = false,
  -- Where the chat window opens
  window = {
    layout = "vertical",
    width = 0.4,
    height = 0.5,
    border = "rounded",
    title = " Copilot Chat ",
    zindex = 1,
  },
  -- System prompt context
  system_prompt = "You are an expert software engineer. Be concise, precise, and prefer code over explanation when possible.",
  -- Show diff in chat window
  show_help = true,
  -- Auto-insert mode when chat opens
  auto_insert_mode = true,
  -- Model to use (gpt-4o is default; free tier uses gpt-4o-mini)
  model = "gpt-4o",
  -- Quick prompts accessible from the chat window with /prompt
  prompts = {
    Explain = {
      prompt = "/COPILOT_EXPLAIN Explain how the selected code works.",
      mapping = "<leader>ce",
    },
    Review = {
      prompt = "/COPILOT_REVIEW Review the selected code for bugs and improvements.",
      mapping = "<leader>cr",
    },
    Fix = {
      prompt = "/COPILOT_GENERATE Fix the bugs in the selected code.",
      mapping = "<leader>cf",
    },
    Optimize = {
      prompt = "/COPILOT_GENERATE Optimize the selected code for performance and readability.",
      mapping = "<leader>co",
    },
    Tests = {
      prompt = "/COPILOT_GENERATE Write unit tests for the selected code.",
      mapping = "<leader>ct",
    },
    Docs = {
      prompt = "/COPILOT_GENERATE Write documentation comments for the selected code.",
      mapping = "<leader>cd",
    },
  },
})

local status, project = pcall(require, "project_nvim")
if not status then
    vim.notify("没有找到 project_nvim")
  return
end

project.setup({
  detection_methods = { "pattern" },
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile",
    "settings.gradle", "package.json", ".sln", ".yaml" },
})

local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
  vim.notify("没有找到 telescope")
  return
end
pcall(telescope.load_extension, "projects")

local present, prettier = pcall(require, "prettier")
if not present then
  return
end

prettier.setup {
  bin = "prettierd",
  filetypes = {
    "css",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
    "json",
    "scss",
    "less",
    "postcss",
  },
}

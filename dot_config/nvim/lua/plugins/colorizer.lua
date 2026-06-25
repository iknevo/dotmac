return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    filetypes = { "*" },
    user_default_options = {
      tailwind = true,
      css = true,
      css_fn = true,
      mode = "background",
    },
  },
}

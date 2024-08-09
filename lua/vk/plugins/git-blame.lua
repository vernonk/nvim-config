return {
  "f-person/git-blame.nvim",
  -- load at startup
  event = "VeryLazy",
  opts = {
    date_format = "%a %m/%d/%Y",
    message_template = " <author> • <date> • <summary>",
  }
}

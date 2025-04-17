lua << EOF
local palette = require("dovecote.palette")
local airline = require("dovecote.airline")
if vim.o.background == "dark" then
  vim.g["airline#themes#dovecote#palette"] = airline.airline(palette.dovecote_dark)
else
  vim.g["airline#themes#dovecote#palette"] = airline.airline(palette.dovecote_light)
end
EOF

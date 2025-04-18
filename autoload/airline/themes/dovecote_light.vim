lua << EOF
local palette = require("dovecote.palette")
local airline = require("dovecote.airline")
vim.g["airline#themes#dovecote_light#palette"] = airline.airline(palette.dovecote_light)
EOF

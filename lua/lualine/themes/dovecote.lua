local colors = {}
if vim.o.background == "dark" then
  colors = require("dovecote.palette").dovecote_dark
else
  colors = require("dovecote.palette").dovecote_light
end
return require("dovecote.airline").palette(colors)

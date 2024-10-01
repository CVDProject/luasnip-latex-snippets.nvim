local M = {}

local ls = require("luasnip")
local utils = require("luasnip-latex-snippets.util.utils")
local pipe = utils.pipe

function M.retrieve(is_math)
  local parse_snippet = ls.extend_decorator.apply(ls.parser.parse_snippet, {
    wordTrig = false,
    condition = pipe({ is_math }),
    show_condition = is_math,
  }) --[[@as function]]

  return {
    parse_snippet({ trig = "lim", name = "limit" }, "\\lim\\limits_{$1} $0 "),
    parse_snippet({ trig = "limsup", name = "limsup" }, "\\limsup\\limits_{$1} $0"),
    parse_snippet({ trig = "liminf", name = "liminf" }, "\\liminf\\limits_{$1} $0"),

    parse_snippet({ trig = "overset", name = "overset" }, "\\overset{$2}{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "underset", name = "underset" }, "\\underset{$2}{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "overbrace", name = "overbrace" }, "\\overbrace{${1:${TM_SELECTED_TEXT}}}^{$2} $0"),
    parse_snippet({ trig = "underbrace", name = "underbrace" }, "\\underbrace{${1:${TM_SELECTED_TEXT}}}_{$2} $0"),
    
    parse_snippet({ trig = "sum", name = "sum" }, "\\sum\\limits$1 ${2:${TM_SELECTED_TEXT}} $0"),
    
    parse_snippet(
      { trig = "prod", name = "product" },
      "\\prod\\limits$1 ${2:${TM_SELECTED_TEXT}} $0"
    ),

    parse_snippet(
      { trig = "par", name = "partial derivative" },
      "\\frac{\\partial ${1:V}}{\\partial ${2:x}} $0"
    ),
    parse_snippet(
      { trig = "ddx", name = "derivative" },
      "\\frac{\\mathrm{d/${1:V}}}{\\mathrm{d${2:x}}} $0"
    ),
    
    parse_snippet(
      { trig = "lr", name = "left( right)" },
      "\\left( ${1:${TM_SELECTED_TEXT}} \\right) $0"
    ),
    parse_snippet(
      { trig = "lr(", name = "left( right)" },
      "\\left( ${1:${TM_SELECTED_TEXT}} \\right) $0"
    ),
    parse_snippet(
      { trig = "lr|", name = "left| right|" },
      "\\left| ${1:${TM_SELECTED_TEXT}} \\right| $0"
    ),
    parse_snippet(
      { trig = "lr||", name = "left|| right||" },
      "\\left\\| ${1:${TM_SELECTED_TEXT}} \\right\\| $0"
    ),
    parse_snippet(
      { trig = "lr{", name = "left{ right}" },
      "\\left\\{ ${1:${TM_SELECTED_TEXT}} \\right\\\\} $0"
    ),
    parse_snippet(
      { trig = "lr[", name = "left[ right]" },
      "\\left[ ${1:${TM_SELECTED_TEXT}} \\right] $0"
    ),
    parse_snippet(
      { trig = "lr[[", name = "left[ right[" },
      "\\left[ ${1:${TM_SELECTED_TEXT}} \\right[ $0"
    ),
    parse_snippet(
      { trig = "lr]]", name = "left] right]" },
      "\\left] ${1:${TM_SELECTED_TEXT}} \\right] $0"
    ),
    parse_snippet(
      { trig = "lr][", name = "left] right[" },
      "\\left] ${1:${TM_SELECTED_TEXT}} \\right[ $0"
    ),
    parse_snippet(
      { trig = "lra", name = "leftangle rightangle" },
      "\\left< ${1:${TM_SELECTED_TEXT}} \\right>$0"
    ),

    parse_snippet(
      { trig = "lrb", name = "left\\{ right\\}" },
      "\\left\\{ ${1:${TM_SELECTED_TEXT}} \\right\\\\} $0"
    ),
  }
end

return M

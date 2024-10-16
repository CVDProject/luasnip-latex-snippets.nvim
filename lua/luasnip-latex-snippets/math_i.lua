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
    parse_snippet({ trig = "lim", name = "limit" }, "\\lim_{$1} $0 "),
    parse_snippet({ trig = "limsup", name = "limsup" }, "\\limsup_{$1} $0"),
    parse_snippet({ trig = "liminf", name = "liminf" }, "\\liminf_{$1} $0"),

    parse_snippet({ trig = "overset", name = "overset" }, "\\overset{$2}{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "underset", name = "underset" }, "\\underset{$2}{${1:${TM_SELECTED_TEXT}}} $0"),
    parse_snippet({ trig = "overbrace", name = "overbrace" }, "\\overbrace{${1:${TM_SELECTED_TEXT}}}^{$2} $0"),
    parse_snippet({ trig = "underbrace", name = "underbrace" }, "\\underbrace{${1:${TM_SELECTED_TEXT}}}_{$2} $0"),
    
    parse_snippet({ trig = "sum", name = "sum" }, "\\sum$1 ${2:${TM_SELECTED_TEXT}} $0"),
    parse_snippet({ trig = "int", name = "integral" }, "\\int ${1:${TM_SELECTED_TEXT}} \\, \\symrm{d}$0"
    ),
    
    parse_snippet(
      { trig = "prod", name = "product" },
      "\\prod$1 ${2:${TM_SELECTED_TEXT}} $0"
    ),

    parse_snippet(
      { trig = "par", name = "partial derivative" },
      "\\frac{\\partial ${1:V}}{\\partial ${2:x}} $0"
    ),
    parse_snippet(
      { trig = "ddx", name = "derivative" },
      "\\frac{\\symrm{d/${1:V}}}{\\symrm{d${2:x}}} $0"
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
      { trig = "lra", name = "left< right>" },
      "\\left< ${1:${TM_SELECTED_TEXT}} \\right>$0"
    ),
    parse_snippet(
      { trig = "lrb", name = "left\\{ right\\}" },
      "\\left\\{ ${1:${TM_SELECTED_TEXT}} \\right\\\\} $0"
    ),
    parse_snippet(
      { trig = "lrg", name = "left\\lgroup right\\rgroup" },
      "\\left\\lgroup ${1:${TM_SELECTED_TEXT}} \\right\\rgroup $0"
    ),

    
  parse_snippet(
      { trig = "big", name = "big( big)" },
      "\\big( ${1:${TM_SELECTED_TEXT}} \\big) $0"
    ),
    parse_snippet(
      { trig = "big(", name = "big( big)" },
      "\\big( ${1:${TM_SELECTED_TEXT}} \\big) $0"
    ),
    parse_snippet(
      { trig = "big|", name = "big| big|" },
      "\\big| ${1:${TM_SELECTED_TEXT}} \\big| $0"
    ),
    parse_snippet(
      { trig = "big||", name = "big|| big||" },
      "\\big\\| ${1:${TM_SELECTED_TEXT}} \\big\\| $0"
    ),
    parse_snippet(
      { trig = "big{", name = "big{ big}" },
      "\\big\\{ ${1:${TM_SELECTED_TEXT}} \\big\\\\} $0"
    ),
    parse_snippet(
      { trig = "big[", name = "big[ big]" },
      "\\big[ ${1:${TM_SELECTED_TEXT}} \\big] $0"
    ),
    parse_snippet(
      { trig = "big[[", name = "big[ big[" },
      "\\big[ ${1:${TM_SELECTED_TEXT}} \\big[ $0"
    ),
    parse_snippet(
      { trig = "big]]", name = "big] big]" },
      "\\big] ${1:${TM_SELECTED_TEXT}} \\big] $0"
    ),
    parse_snippet(
      { trig = "big][", name = "big] big[" },
      "\\big] ${1:${TM_SELECTED_TEXT}} \\big[ $0"
    ),
    parse_snippet(
      { trig = "biga", name = "big< big>" },
      "\\left< ${1:${TM_SELECTED_TEXT}} \\right>$0"
    ),
    parse_snippet(
      { trig = "bigb", name = "big\\{ big\\}" },
      "\\big\\{ ${1:${TM_SELECTED_TEXT}} \\big\\\\} $0"
    ),
  }
end

return M

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
    parse_snippet({ trig = "sum", name = "sum" }, "\\sum\\limits_{${1:n}=${2:1}}^{${3:\\infty}} ${4:${TM_SELECTED_TEXT}} $0"),

    parse_snippet({ trig = "lim", name = "limit" }, "\\lim\\limits_{${1:n} \\to ${2:\\infty}} "),
    parse_snippet({ trig = "limsup", name = "limsup" }, "\\limsup\\limits_{${1:n} \\to ${2:\\infty}} "),
    parse_snippet({ trig = "liminf", name = "liminf" }, "\\liminf\\limits_{${1:n} \\to ${2:\\infty}} "),

    parse_snippet(
      { trig = "prod", name = "product" },
      "\\prod\\limits_{${1:n}=${2:1}}}^{${3:\\infty}} ${4:${TM_SELECTED_TEXT}} $0"
    ),

    parse_snippet(
      { trig = "part", name = "partial derivative" },
      "\\frac{\\partial ${1:V}}{\\partial ${2:x}} $0"
    ),
    parse_snippet(
      { trig = "ddx", name = "derivative" },
      "\\frac{\\mathrm{d/${1:V}}}{\\mathrm{d${2:x}}} $0"
    ),

    parse_snippet({ trig = "pmat", name = "pmat" }, "\\begin{pmatrix} $1 \\end{pmatrix} $0"),

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

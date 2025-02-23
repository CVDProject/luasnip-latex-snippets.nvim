local ls = require("luasnip")
local utils = require("luasnip-latex-snippets.util.utils")
local pipe = utils.pipe

local M = {}

function M.retrieve(not_math)
  local parse_snippet = ls.extend_decorator.apply(ls.parser.parse_snippet, {
    condition = pipe({ not_math }),
  }) --[[@as function]]

  return {
    parse_snippet({ trig = "(", name = "()" }, "($1$0"),
    parse_snippet({ trig = "[", name = "[]" }, "[$1$0"),
    parse_snippet({ trig = "{", name = "{}" }, "{$1$0"),
    parse_snippet({ trig = "qt", name = "Quote" }, "``${1:${TM_SELECTED_TEXT}}''$0"),
    parse_snippet({ trig = "bf", name = "Bold Text" }, "\\textbf{${1:${TM_SELECTED_TEXT}}}$0"),
    parse_snippet({ trig = "emph", name = "Emphasize" }, "\\emph{${1:${TM_SELECTED_TEXT}}\\}$0"),
    parse_snippet({ trig = "wemph", name = "Weak Emphasize" }, "\\weakemph{${1:${TM_SELECTED_TEXT}}\\}$0"),
    parse_snippet({ trig = "bemph", name = "Bold Emphasize" }, "\\textbf{weakemph{${1:${TM_SELECTED_TEXT}}\\}}$0"),
    parse_snippet({ trig = "href", name = "Hypertext Reference" }, "\\hyperref[$2]{$1}$0"),
    parse_snippet({ trig = "dhref", name = "Definition Reference" }, "\\hyperref[d$1]{Definizione \\ref*{d$1}}$0"),
    parse_snippet({ trig = "rhref", name = "Remark Reference" }, "\\hyperref[r$1]{Osservazione \\ref*{r$1}}$0"),
    parse_snippet({ trig = "phref", name = "Proposition Reference" }, "\\hyperref[p$1]{Proposizione \\ref*{p$1}}$0"),
    parse_snippet({ trig = "thref", name = "Theorem Reference" }, "\\hyperref[t$1]{Teorema \\ref*{t$1}}$0"),
    parse_snippet({ trig = "chref", name = "Corollary Reference" }, "\\hyperref[c$1]{Corollario \\ref*{c$1}}$0"),
    parse_snippet({ trig = "mk", name = "Math" }, "\\( ${1:${TM_SELECTED_TEXT}} \\)$0"),
    parse_snippet({ trig = "dm", name = "Block Math" }, "\\[\n\t${1:${TM_SELECTED_TEXT}}\n.\\] $0"),
  }
end

return M

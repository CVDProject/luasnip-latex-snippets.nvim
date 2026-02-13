local M = {}

local ls = require("luasnip")
local f = ls.function_node

function M.retrieve(is_math)
  local utils = require("luasnip-latex-snippets.util.utils")
  local pipe, no_backslash = utils.pipe, utils.no_backslash

  local decorator = {
    wordTrig = false,
    condition = pipe({ is_math, no_backslash }),
  }

  local parse_snippet = ls.extend_decorator.apply(ls.parser.parse_snippet, decorator) --[[@as function]]
  local s = ls.extend_decorator.apply(ls.snippet, decorator) --[[@as function]]

  return {
    s(
      {
        trig = "(%a+)bar",
        wordTrig = false,
        regTrig = true,
        name = "bar",
        priority = 100,
      },
      f(function(_, snip)
        return string.format("\\overline{%s}", snip.captures[1])
      end, {})
    ),
    s(
      {
        trig = "(%a+)und",
        wordTrig = false,
        regTrig = true,
        name = "underline",
        priority = 100,
      },
      f(function(_, snip)
        return string.format("\\underline{%s}", snip.captures[1])
      end, {})
    ),
    s(
      {
        trig = "(%a)dot",
        wordTrig = false,
        regTrig = true,
        name = "dot",
        priority = 100,
      },
      f(function(_, snip)
        return string.format("\\dot{%s}", snip.captures[1])
      end, {})
    ),

    s(
      {
        trig = "(%a+)hat",
        wordTrig = false,
        regTrig = true,
        name = "hat",
        priority = 100,
      },
      f(function(_, snip)
        return string.format("\\hat{%s}", snip.captures[1])
      end, {})
    ),
    s(
      {
        trig = "(%a+)tld",
        wordTrig = false,
        regTrig = true,
        name = "tilde",
        priority = 100,
      },
      f(function(_, snip)
        return string.format("\\tilde{%s}", snip.captures[1])
      end, {})
    ),
    s(
      {
        trig = "(%a+)ora",
        wordTrig = false,
        regTrig = true,
        name = "ora",
        priority = 100,
      },
      f(function(_, snip)
        return string.format("\\overrightarrow{%s}", snip.captures[1])
      end, {})
    ),
    s(
      {
        trig = "(%a+)ola",
        wordTrig = false,
        regTrig = true,
        name = "ola",
        priority = 100,
      },
      f(function(_, snip)
        return string.format("\\overleftarrow{%s}", snip.captures[1])
      end, {})
    ),

    parse_snippet({ trig = "(", name = "()" }, "($1$0"),
    parse_snippet({ trig = "[", name = "[]" }, "[$1$0"),
    parse_snippet({ trig = "{", name = "{}" }, "{$1$0"),
    parse_snippet({ trig = "td", name = "to the ... power ^{}" }, "^{$1}$0 "),
    parse_snippet({ trig = "rd", name = "to the ... power ^{()}" }, "^{($1)}$0 "),
    parse_snippet({ trig = "cb", name = "Cube ^3" }, "^3 "),
    parse_snippet({ trig = "sr", name = "Square ^2" }, "^2"),

    parse_snippet({ trig = "EE", name = "exists" }, "\\exists "),
    parse_snippet({ trig = "AA", name = "forall" }, "\\forall "),
    parse_snippet({ trig = "xnn", name = "xn" }, "x_{n}"),
    parse_snippet({ trig = "ynn", name = "yn" }, "y_{n}"),
    parse_snippet({ trig = "xii", name = "xi" }, "x_{i}"),
    parse_snippet({ trig = "yii", name = "yi" }, "y_{i}"),
    parse_snippet({ trig = "xjj", name = "xj" }, "x_{j}"),
    parse_snippet({ trig = "yjj", name = "yj" }, "y_{j}"),
    parse_snippet({ trig = "xp1", name = "x" }, "x_{n+1}"),
    parse_snippet({ trig = "xmm", name = "x" }, "x_{m}"),

    parse_snippet({ trig = "notin", name = "not in" }, "\\notin "),
    parse_snippet({ trig = ":_", name = "limits" }, "\\limits_{$1}$0"),    
    
    parse_snippet({ trig = ".<", name = "subseteq" }, "\\subseteq "),
    parse_snippet({ trig = ".!<", name = "subsetneq" }, "\\subsetneq "),
    parse_snippet({ trig = "!.<", name = "nsubseteq", priority = 100 }, "\\nsubseteq "),
    parse_snippet({ trig = ".>", name = "supseteq" }, "\\supseteq "),
    parse_snippet({ trig = ".!>", name = "supsetneq", priority = 100 }, "\\supsetneq "),
    parse_snippet({ trig = "!.>", name = "nsupseteq", priority = 100 }, "\\nsupseteq "),

    parse_snippet({ trig = "<->", name = "leftrightarrow", priority = 200 }, "\\leftrightarrow "),
    parse_snippet({ trig = "...", name = "dots", priority = 100 }, "\\dots "),
    parse_snippet({ trig = "c..", name = "cdots" }, "\\cdots "),
    parse_snippet({ trig = "d..", name = "ddots" }, "\\ddots "),
    parse_snippet({ trig = "l..", name = "ldots" }, "\\ldots "),
    parse_snippet({ trig = "v..", name = "vdots" }, "\\vdots "),
    parse_snippet({ trig = "!>", name = "mapsto" }, "\\mapsto "),
    parse_snippet({ trig = "iff", name = "iff" }, "\\iff"),
    parse_snippet({ trig = "<:>", name = "short iff"}, "\\Leftrightarrow"),
    parse_snippet({ trig = "ooo", name = "\\infty" }, "\\infty"),
    parse_snippet({ trig = "rij", name = "mrij" }, "(${1:x}_${2:n})_{${3:$2}\\in${4:\\N}}$0"),
    parse_snippet({ trig = "nab", name = "nabla" }, "\\nabla "),
    parse_snippet({ trig = "del", name = "partial" }, "\\partial "),
    parse_snippet({ trig = "<|", name = "normal" }, "\\trianglelefteq "),
    parse_snippet({ trig = "<s|", name = "normal" }, "\\trianglelefteqslant "),
    parse_snippet({ trig = "flr", name = "floor" }, "\\left\\lfloor $1 \\right\\rfloor$0"),

    parse_snippet({ trig = "char", name = "characteristic" }, "\\operatorname{char}$1 $0"),    
    
    parse_snippet({ trig = "mcal", name = "mathcal" }, "\\symcal{$1}$0"),
    parse_snippet({ trig = "mscr", name = "mathscr" }, "\\symscr{$1}$0"),
    parse_snippet({ trig = "mfrk", name = "mathfrak" }, "\\mathfrak{$1}$0"),
    parse_snippet({ trig = "mbf", name = "mathbf" }, "\\symbf{$1}$0"),
    parse_snippet({ trig = "mbb", name = "mathbb" }, "\\mathbb{$1}$0"),
    parse_snippet({ trig = "mrm", name = "mathrm" }, "\\symrm{$1}$0"),
    parse_snippet({ trig = "msf", name = "mathsf" }, "\\symsf{$1}$0"),
    parse_snippet({ trig = "mtt", name = "mathtt", priority = 100 }, "\\mathtt{$1}$0"),
    parse_snippet({ trig = "mnc", name = "mathunc" }, "\\mathunc{$1}$0"),    
    parse_snippet({ trig = "//", name = "Fraction" }, "\\frac{$1}{$2}$0"),
    parse_snippet({ trig = "wo", name = "setminus" }, "\\setminus "),
    parse_snippet({ trig = "->", name = "to", priority = 100 }, "\\to "),
    parse_snippet({ trig = "x->", name = "xrightarrow", priority = 200 }, "\\xrightarrow$2{$1}$0"),
    parse_snippet({ trig = "-->", name = "long to", priority = 200 }, "\\longrightarrow "),
    parse_snippet({ trig = "..>", name = "dashed to", priority = 100 }, "\\rightdasharrow "),
    parse_snippet({ trig = "c->", name = "hooked to", priority = 200 }, "\\hookrightarrow "),
    parse_snippet({ trig = "..>", name = "dashed to", priority = 100 }, "\\rightdasharrow "),
    parse_snippet({ trig = "-<", name = "from", priority = 100 }, "\\gets "),
    parse_snippet({ trig = "--<", name = "long from", priority = 200 }, "\\longleftarrow "),
    parse_snippet({ trig = "<-->", name = "long leftrightarrow", priority = 300 }, "\\longleftrightarrow "),
    
    parse_snippet({ trig = "cap", name = "cap" }, "\\cap "),
    parse_snippet({ trig = "Cap", name = "big cap" }, "\\bigcap"),
    parse_snippet({ trig = "@@", name = "composition" }, "\\circ "),
    parse_snippet({ trig = "norm", name = "norm" }, "\\|$1\\| $0"),
    parse_snippet({ trig = "<>", name = "hokje" }, "\\diamond "),
    parse_snippet({ trig = ">>", name = ">>" }, "\\gg"),
    parse_snippet({ trig = "<<", name = "<<" }, "\\ll"),

    parse_snippet({ trig = "stt", name = "strong text" }, "\\strongtext{$1}$0"),
    parse_snippet({ trig = "_tt", name = "text subscript" }, "_{\\text{$1}} $0"),
    parse_snippet({ trig = "^tt", name = "text superscript" }, "^{\\text{$1}} $0"),
    parse_snippet({ trig = "tt", name = "text" }, "\\text{$1}$0"),

    parse_snippet({ trig = "xx", name = "cross" }, "\\times "),
    parse_snippet({ trig = "**", name = "cdot", priority = 100 }, "\\cdot "),
    parse_snippet({ trig = "o+", name = "oplus", }, "\\oplus "),
    parse_snippet({ trig = "O+", name = "bigoplus", }, "\\bigoplus "),
    parse_snippet({ trig = "ox", name = "otimes", }, "\\otimes "),
    parse_snippet({ trig = "Ox", name = "bigotimes", }, "\\bigotimes "),
    parse_snippet({ trig = "cup+", name = "uplus", }, "\\uplus "),
    parse_snippet({ trig = "Cup+", name = "big uplus", }, "\\biguplus "),
    parse_snippet({ trig = "+-", name = "plus minus", }, "\\pm "),
    parse_snippet({ trig = "-+", name = "minus plus", }, "\\mp "),
    parse_snippet({ trig = "and", name = "and", }, "\\land "),
    parse_snippet({ trig = "orr", name = "or", }, "\\lor "),

    parse_snippet(
      { trig = "cvec", name = "column vector" },
      "\\begin{pmatrix} ${1:x}_${2:1}\\\\ \\vdots\\\\ $1_${2:n} \\end{pmatrix}"
    ),
    parse_snippet({ trig = "ceil", name = "ceil" }, "\\left\\lceil $1 \\right\\rceil $0"),
    parse_snippet({ trig = "em", name = "empty set" }, "\\varnothing"),
    parse_snippet({ trig = "NN", name = "N" }, "\\mathbb{N}"),
    parse_snippet({ trig = "ZZ", name = "Z" }, "\\mathbb{Z}"),
    parse_snippet({ trig = "QQ", name = "Q" }, "\\mathbb{Q}"),
    parse_snippet({ trig = "RR", name = "R" }, "\\mathbb{R}"),
    parse_snippet({ trig = "CC", name = "C" }, "\\mathbb{C}"),
    parse_snippet({ trig = "FF", name = "FF" }, "\\mathbb{F}"),
    parse_snippet({ trig = "KK", name = "KK" }, "\\mathbb{K}"),
    parse_snippet({ trig = "||", name = "mid" }, " \\mid "),
    parse_snippet({ trig = "bmat", name = "bmat" }, "\\begin{bmatrix} $1 \\end{bmatrix} $0"),
    parse_snippet({ trig = "pmat", name = "pmat" }, "\\begin{pmatrix} $1 \\end{pmatrix} $0"),
    parse_snippet({ trig = "cup", name = "cup" }, "\\cup "),
    parse_snippet({ trig = "Cup", name = "big cup" }, "\\bigcup"),
    parse_snippet({ trig = "scup", name = "square cup", priority = 100 }, "\\sqcup "),
    parse_snippet({ trig = "Scup", name = "big square bigcup", priority = 100 }, "\\bigsqcup"),
    parse_snippet({ trig = "lll", name = "l" }, "\\ell"),

    parse_snippet({ trig = ":=", name = "colon equals (lhs defined as rhs)" }, "\\coloneq "),
    parse_snippet({ trig = "=:", name = "equals colon (rhs defined as lhs)" }, "\\eqcolon "),
    parse_snippet({ trig = "===", name = "equivalent" }, "\\equiv "),
    parse_snippet({ trig = "!=", name = "not equals" }, "\\neq "),
    parse_snippet({ trig = "__", name = "subscript" }, "_{$1}$0"),
    parse_snippet({ trig = "^^", name = "superscript" }, "^{$1}$0"),
    parse_snippet({ trig = "=>", name = "short implies" }, "\\Rightarrow"),
    parse_snippet({ trig = "==>", name = "implies", priority = 100 }, "\\implies"),
    parse_snippet({ trig = "=<", name = "short implied by" }, "\\Leftarrow"),
    parse_snippet({ trig = "=>", name = "implied by" }, "\\impliedby"),
    parse_snippet({ trig = "<<", name = "<<" }, "\\ll"),

    parse_snippet({ trig = "<=", name = "leq" }, "\\le "),
    parse_snippet({ trig = ">=", name = "geq" }, "\\ge "),
    parse_snippet({ trig = "<s=", name = "leqslant" }, "\\leqslant "),
    parse_snippet({ trig = "<!=", name = "lneq", priority = 100 }, "\\lneq "),
    parse_snippet({ trig = ">!=", name = "gneq", priority = 100 }, "\\gneq "),
    parse_snippet({ trig = "prec", name = "preceq", priority = 100 }, "\\preccurlyeq "),
    parse_snippet({ trig = "suc", name = "succeq", priority = 100 }, "\\succcurlyeq "),
    parse_snippet({ trig = "invs", name = "inverse" }, "^{-1} "),
    parse_snippet({ trig = "ast", name = "dual" }, "^{*} "),
    parse_snippet({ trig = "sss", name = "~" }, "\\sim "),
    parse_snippet({ trig = "ss=", name = "≃" }, "\\simeq "),
    parse_snippet({ trig = "s==", name = "≅" }, "\\cong "),
    parse_snippet({ trig = "restr", name = "restriction" }, "{\\upharpoonright}_{$1}$0"),

    parse_snippet({ trig = "@a", name = "alpha" }, "\\alpha "),
    parse_snippet({ trig = "@b", name = "beta" }, "\\beta "),
    parse_snippet({ trig = "@g", name = "gamma" }, "\\gamma "),
    parse_snippet({ trig = "@G", name = "Gamma" }, "\\Gamma "),
    parse_snippet({ trig = "@d", name = "delta" }, "\\delta "),
    parse_snippet({ trig = "@D", name = "Delta" }, "\\Delta "),
    parse_snippet({ trig = "@e", name = "(var)epsilon" }, "\\varepsilon "),
    parse_snippet({ trig = "@ve", name = "epsilon" }, "\\epsilon "),
    parse_snippet({ trig = "@z", name = "zeta" }, "\\zeta "),
    parse_snippet({ trig = "@h", name = "eta" }, "\\eta "),
    parse_snippet({ trig = "@t", name = "theta" }, "\\theta "),
    parse_snippet({ trig = "@vt", name = "vartheta" }, "\\vartheta "),
    parse_snippet({ trig = "@T", name = "Theta" }, "\\Theta "),
    parse_snippet({ trig = "@i", name = "iota" }, "\\iota "),
    parse_snippet({ trig = "@k", name = "kappa" }, "\\kappa "),
    parse_snippet({ trig = "@l", name = "lambda" }, "\\lambda "),
    parse_snippet({ trig = "@L", name = "Lambda" }, "\\Lambda "),
    parse_snippet({ trig = "@m", name = "mu" }, "\\mu "),
    parse_snippet({ trig = "@n", name = "nu" }, "\\nu "),
    parse_snippet({ trig = "@x", name = "xi" }, "\\xi "),
    parse_snippet({ trig = "@X", name = "Xi" }, "\\Xi "),
    parse_snippet({ trig = "@p", name = "pi" }, "\\pi "),
    parse_snippet({ trig = "@vp", name = "varpi" }, "\\varpi "),
    parse_snippet({ trig = "@P", name = "Pi" }, "\\Pi "),
    parse_snippet({ trig = "@r", name = "rho" }, "\\rho "),
    parse_snippet({ trig = "@vr", name = "varrho" }, "\\varrho "),
    parse_snippet({ trig = "@s", name = "sigma" }, "\\sigma "),
    parse_snippet({ trig = "@vs", name = "varsigma" }, "\\varsigma "),
    parse_snippet({ trig = "@S", name = "Sigma" }, "\\Sigma "),
    parse_snippet({ trig = "@u", name = "upsilon" }, "\\upsilon "),
    parse_snippet({ trig = "@c", name = "chi" }, "\\chi "),
    parse_snippet({ trig = "@f", name = "(var)phi" }, "\\varphi "),
    parse_snippet({ trig = "@F", name = "Phi" }, "\\Phi "),
    parse_snippet({ trig = "@o", name = "omega" }, "\\omega "),
    parse_snippet({ trig = "@O", name = "Omega" }, "\\Omega "),
  }
end

return M

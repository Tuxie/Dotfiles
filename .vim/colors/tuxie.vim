let s:conversion_table = { "NONE":"NONE", 16: "#000000", 17: "#00005f", 18: "#000087", 19: "#0000af", 20: "#0000d7", 21: "#0000ff", 22: "#005f00", 23: "#005f5f", 24: "#005f87", 25: "#005faf", 26: "#005fd7", 27: "#005fff", 28: "#008700", 29: "#00875f", 30: "#008787", 31: "#0087af", 32: "#0087d7", 33: "#0087ff", 34: "#00af00", 35: "#00af5f", 36: "#00af87", 37: "#00afaf", 38: "#00afd7", 39: "#00afff", 40: "#00d700", 41: "#00d75f", 42: "#00d787", 43: "#00d7af", 44: "#00d7d7", 45: "#00d7ff", 46: "#00ff00", 47: "#00ff5f", 48: "#00ff87", 49: "#00ffaf", 50: "#00ffd7", 51: "#00ffff", 52: "#5f0000", 53: "#5f005f", 54: "#5f0087", 55: "#5f00af", 56: "#5f00d7", 57: "#5f00ff", 58: "#5f5f00", 59: "#5f5f5f", 60: "#5f5f87", 61: "#5f5faf", 62: "#5f5fd7", 63: "#5f5fff", 64: "#5f8700", 65: "#5f875f", 66: "#5f8787", 67: "#5f87af", 68: "#5f87d7", 69: "#5f87ff", 70: "#5faf00", 71: "#5faf5f", 72: "#5faf87", 73: "#5fafaf", 74: "#5fafd7", 75: "#5fafff", 76: "#5fd700", 77: "#5fd75f", 78: "#5fd787", 79: "#5fd7af", 80: "#5fd7d7", 81: "#5fd7ff", 82: "#5fff00", 83: "#5fff5f", 84: "#5fff87", 85: "#5fffaf", 86: "#5fffd7", 87: "#5fffff", 88: "#870000", 89: "#87005f", 90: "#870087", 91: "#8700af", 92: "#8700d7", 93: "#8700ff", 94: "#875f00", 95: "#875f5f", 96: "#875f87", 97: "#875faf", 98: "#875fd7", 99: "#875fff", 100: "#878700", 101: "#87875f", 102: "#878787", 103: "#8787af", 104: "#8787d7", 105: "#8787ff", 106: "#87af00", 107: "#87af5f", 108: "#87af87", 109: "#87afaf", 110: "#87afd7", 111: "#87afff", 112: "#87d700", 113: "#87d75f", 114: "#87d787", 115: "#87d7af", 116: "#87d7d7", 117: "#87d7ff", 118: "#87ff00", 119: "#87ff5f", 120: "#87ff87", 121: "#87ffaf", 122: "#87ffd7", 123: "#87ffff", 124: "#af0000", 125: "#af005f", 126: "#af0087", 127: "#af00af", 128: "#af00d7", 129: "#af00ff", 130: "#af5f00", 131: "#af5f5f", 132: "#af5f87", 133: "#af5faf", 134: "#af5fd7", 135: "#af5fff", 136: "#af8700", 137: "#af875f", 138: "#af8787", 139: "#af87af", 140: "#af87d7", 141: "#af87ff", 142: "#afaf00", 143: "#afaf5f", 144: "#afaf87", 145: "#afafaf", 146: "#afafd7", 147: "#afafff", 148: "#afd700", 149: "#afd75f", 150: "#afd787", 151: "#afd7af", 152: "#afd7d7", 153: "#afd7ff", 154: "#afff00", 155: "#afff5f", 156: "#afff87", 157: "#afffaf", 158: "#afffd7", 159: "#afffff", 160: "#d70000", 161: "#d7005f", 162: "#d70087", 163: "#d700af", 164: "#d700d7", 165: "#d700ff", 166: "#d75f00", 167: "#d75f5f", 168: "#d75f87", 169: "#d75faf", 170: "#d75fd7", 171: "#d75fff", 172: "#d78700", 173: "#d7875f", 174: "#d78787", 175: "#d787af", 176: "#d787d7", 177: "#d787ff", 178: "#d7af00", 179: "#d7af5f", 180: "#d7af87", 181: "#d7afaf", 182: "#d7afd7", 183: "#d7afff", 184: "#d7d700", 185: "#d7d75f", 186: "#d7d787", 187: "#d7d7af", 188: "#d7d7d7", 189: "#d7d7ff", 190: "#d7ff00", 191: "#d7ff5f", 192: "#d7ff87", 193: "#d7ffaf", 194: "#d7ffd7", 195: "#d7ffff", 196: "#ff0000", 197: "#ff005f", 198: "#ff0087", 199: "#ff00af", 200: "#ff00d7", 201: "#ff00ff", 202: "#ff5f00", 203: "#ff5f5f", 204: "#ff5f87", 205: "#ff5faf", 206: "#ff5fd7", 207: "#ff5fff", 208: "#ff8700", 209: "#ff875f", 210: "#ff8787", 211: "#ff87af", 212: "#ff87d7", 213: "#ff87ff", 214: "#ffaf00", 215: "#ffaf5f", 216: "#ffaf87", 217: "#ffafaf", 218: "#ffafd7", 219: "#ffafff", 220: "#ffd700", 221: "#ffd75f", 222: "#ffd787", 223: "#ffd7af", 224: "#ffd7d7", 225: "#ffd7ff", 226: "#ffff00", 227: "#ffff5f", 228: "#ffff87", 229: "#ffffaf", 230: "#ffffd7", 231: "#ffffff", 232: "#080808", 233: "#121212", 234: "#1c1c1c", 235: "#262626", 236: "#303030", 237: "#3a3a3a", 238: "#444444", 239: "#4e4e4e", 240: "#585858", 241: "#626262", 242: "#6c6c6c", 243: "#767676", 244: "#808080", 245: "#8a8a8a", 246: "#949494", 247: "#9e9e9e", 248: "#a8a8a8", 249: "#b2b2b2", 250: "#bcbcbc", 251: "#c6c6c6", 252: "#d0d0d0", 253: "#dadada", 254: "#e4e4e4", 255: "#eeeeee" }

function! X2RGB(num)
  return s:conversion_table[a:num]
endfunction

function! Hilight(what, cfg, cbg, term)
  execute "hi " a:what " ctermfg=" a:cfg " ctermbg=" a:cbg " guifg=" X2RGB(a:cfg) " guibg=" X2RGB(a:cbg) " cterm=" a:term " gui=" a:term " term=" a:term
endfunction

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let NONE="NONE"
let g:colors_name="tuxie"

call Hilight("Normal",        253,  234,  NONE)
call Hilight("Cursor",        232,  231,  NONE)
call Hilight("CursorIM",      232,  229,  NONE)
call Hilight("CursorColumn", NONE,  233,  NONE)
call Hilight("CursorLine",   NONE,  233,  NONE)
call Hilight("Directory",      62, NONE,  NONE)
call Hilight("DiffAdd",       231,   22,  NONE)
call Hilight("DiffChange",    231,   94,  NONE)
call Hilight("DiffDelete",    231,   52,  NONE)
call Hilight("DiffText",      231,   94,  NONE)
call Hilight("ErrorMsg",      217,   52,  NONE)
call Hilight("VertSplit",     244,  237,  NONE)
call Hilight("Folded",        230,  238,  NONE)
call Hilight("FoldColumn",    250,  238,  NONE)
call Hilight("SignColumn",    245,  235,  NONE)
call Hilight("IncSearch",      16,  226,  NONE)
call Hilight("LineNr",        240,  235,  NONE)
call Hilight("MatchParen",     90,   16,  NONE)
call Hilight("ModeMsg",       218, NONE,  NONE)
call Hilight("MoreMsg",       218, NONE,  "bold")
call Hilight("NonText",       235, NONE,  NONE)
call Hilight("Pmenu",         250,  237,  NONE)
call Hilight("PmenuSel",      231,  244,  NONE)
call Hilight("PmenuSbar",     231,  241,  NONE)
call Hilight("PmenuThumb",    231,  250,  NONE)
call Hilight("Question",      218, NONE,  NONE)
call Hilight("Search",         16,  226,  NONE)
call Hilight("SpecialKey",    228, NONE,  NONE)
call Hilight("SpellBad",      212, NONE,  NONE)
call Hilight("SpellCap",      159, NONE,  NONE)
call Hilight("SpellLocal",    229, NONE,  NONE)
call Hilight("SpellRare",     217, NONE,  NONE)
call Hilight("StatusLine",    231,  243,  NONE)
call Hilight("StatusLineNC",  244,  237,  NONE)
call Hilight("TabLine",       244,  237,  NONE)
call Hilight("TabLineFill",   237,  232,  NONE)
call Hilight("TabLineSel",    231,  240,  NONE)
call Hilight("Title",         231, NONE,  NONE)
call Hilight("Visual",       NONE,  237,  NONE)
call Hilight("VisualNOS",    NONE,  236,  NONE)
call Hilight("WarningMsg",    217,   52,  NONE)
call Hilight("Error",         217,   52,  NONE)
call Hilight("WildMenu",       46,   20,  NONE)

call Hilight("BufferSelected", 231, 238,  NONE)
call Hilight("BufferNormal",   244, NONE, NONE)

hi link rubyMethod              Function
hi link rubyDefine              Keyword
hi link rubySymbol              Constant
hi link rubyAccess              rubyMethod
hi link rubyAttribute           rubyMethod
hi link rubyEval                rubyMethod
hi link rubyException           rubyMethod
hi link rubyInclude             rubyMethod
hi link rubyStringDelimiter     rubyString
hi link rubyRegexp              Regexp
hi link rubyRegexpDelimiter     rubyRegexp
hi link rubyConstant            Variable
hi link rubyGlobalVariable      Variable
hi link rubyClassVariable       Variable
hi link rubyInstanceVariable    Variable
hi link rubyInterpolation       Delimiter
hi link railsMethod             rubyMethod
hi link javascriptRegexpString  Regexp
hi link javascriptNumber        Number
hi link javascriptNull          Constant

call Hilight("Comment",        241, NONE, NONE) " # comments...
call Hilight("Constant",       131, NONE, NONE)
call Hilight("Variable",        67, NONE, NONE) " @foo @@bar $baz
call Hilight("String",          65, NONE, NONE) " 'foo'
call Hilight("Character",      215, NONE, NONE)
call Hilight("Number",         167, NONE, NONE) " 123
call Hilight("Boolean",        167, NONE, NONE) " true/false
call Hilight("Float",          167, NONE, NONE) " 1.23
call Hilight("Identifier",     225, NONE, NONE) " block parameters
call Hilight("Function",       130, NONE, NONE) " foo in def foo
call Hilight("Statement",      215, NONE, NONE) " not or and do end
call Hilight("Conditional",    215, NONE, NONE) " if case when else
call Hilight("Repeat",         215, NONE, NONE)
call Hilight("Label",          215, NONE, NONE)
call Hilight("Operator",       225, NONE, NONE)
call Hilight("Keyword",        215, NONE, NONE) " 215 def class module require
call Hilight("Exception",      215, NONE, NONE)
call Hilight("PreProc",        130, NONE, NONE)
call Hilight("PreCondit",      130, NONE, NONE)
call Hilight("Include",        136, NONE, NONE)
call Hilight("Define",         136, NONE, NONE)
call Hilight("Macro",          136, NONE, NONE)
call Hilight("Type",           139, NONE, NONE) " FooBar
call Hilight("StorageClass",   137, NONE, NONE)
call Hilight("Structure",      139, NONE, NONE)
call Hilight("Typedef",        139, NONE, NONE)
call Hilight("Regexp",         135, NONE, NONE)
call Hilight("Special",         67, NONE, NONE)
call Hilight("SpecialChar",     67, NONE, NONE)
call Hilight("Tag",            139, NONE, NONE)
call Hilight("Delimiter",      142, NONE, NONE)
call Hilight("SpecialComment", 242, NONE, NONE)
call Hilight("Debug",           46,   20, NONE)
call Hilight("Underlined",     224, NONE, "underline")
call Hilight("Ignore",         234, NONE, NONE)
call Hilight("Todo",           220,   16, NONE)


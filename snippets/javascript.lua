local status, ls = pcall(require, 'luasnip')

if (not status) then
  print('luasnip not found')
  return
end

-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#snipmate

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet

local object_assign = function(t1, t2)
  local newObject = {};

  for _, value in ipairs(t1) do
    table.insert(newObject, value)
  end

  for _, value in ipairs(t2) do
    table.insert(newObject, value)
  end

  return newObject
end

local COMMON = {
  parse('func', 'function ${1}({${2}}){\n${3}\n}'),
  parse('cfunc', 'const ${1} = ({${2}}) =>{\n${3}\n}'),
  parse('log', 'console.log(\n${1}\n)')
}

local REACT = {
  s('rfc', {
    t { "import React from 'react';", "" },
    t 'function ',
    i(1),
    t '({', i(2),
    t { "}){", "", "\treturn (", "\t\t" },
    i(3),
    t { "", "\t)", "" },
    t { "}", "", "", },
    f(function(args)
      return 'export default ' .. args[1][1] .. ''
    end,
      { 1 }
    ),
    t { ";" }
  }),
  s('ue', {
    t {"React.useEffect(()=>{","\t\t"},
    i(1),
    t {"","},","["},  i(2),
    t  "])",
  }),
  parse('cl', "className={${1}}"),
  parse('clcn', "className={cn(${1})}"),
}

ls.add_snippets("javascript", COMMON)
ls.add_snippets("javascriptreact", object_assign(COMMON, REACT))

ls.add_snippets("typescript", COMMON)
ls.add_snippets("typescriptreact", object_assign(COMMON, REACT))

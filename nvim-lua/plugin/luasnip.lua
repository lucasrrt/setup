local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
}

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set({ "i" }, "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

require("luasnip.loaders.from_vscode").lazy_load()
-- require("luasnip").add_snippets("tsx", {})

ls.snippets = {
  all = {
    ls.parser.parse_snippet("expand", "-- this is what was expanded!"),
  }
}

local ls = require("luasnip")
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

ls.add_snippets("all", {
	s("ff", {
    i(1, "function"), t("() { "), i(2, "body"), t(" }")
	}),
	s("pf", {
		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
		i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
	}),
})

ls.add_snippets("lua", {
  s("km", {
    t("vim.keymap.set("), i(1, "'n'"), t(", '"), i(2, ""), t("', '"), i(3, ""), t("')")
  })
})

ls.add_snippets("typescript", {
  s('todo', {
    t('// TODO(lucasrrt): ')
  }),
  s('imp', {
    t('import { '),
    i(2),
    t(" } from '"),
    i(1),
    t("';")
  }),
  s('desc', {
    t('describe("'),
    i(1, 'TestName'),
    t('", () => {'),
    i(2),
    t('});')
  }),
  s('it', {
    t('it("'),
    i(1, 'TestName'),
    t({ '", () => {', '  ' }),
    i(2, 'expect(true).toBe(true);'),
    t({ '', '});' })
  }),
  s('test', {
    t('test("'),
    i(1, 'TestName'),
    t({ '", () => {', '  ' }),
    i(2, 'expect(true).toBe(true);'),
    t({ '', '});' })
  }),
})

ls.filetype_extend("typescriptreact", { "typescript" })

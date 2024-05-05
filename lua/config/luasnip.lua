local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
-- local extras = require("luasnip.extras")
-- local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
-- local fmt = require("luasnip.extras.fmt").fmt
vim.keymap.set({ "i", "s" }, "<A-n>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)
-- stylua: ignore start
--thymeleaf html
ls.add_snippets("html", {
    s("th:xm", {
        t('xmlns:th="http://www.thymeleaf.org"'),
    }),
    s("th:fr", {
        t('th:fragment="'),
        i(1),
        t('"'),
    }),
    s("th:tx", {
        t('th:text="${'),
        i(1),
        t('}"'),
    }),
    s("th:e", {
        t('th:each="'),
        i(1),
        t(":${"),
        i(2),
        t('}"'),
    }),
    s("th:if", {
        t('th:if="${'),
        i(1),
        t('}"'),
    }),
    s("th:un", {
        t('th:unless="${'),
        i(1),
        t('}"'),
    }),
    s("th:rii", fmt(
        [[th:{}="~{{{}::{}}}"]], {
            c(1, {
                t("include"),
                t("replace"),
                t("insert"),
            }),
            i(2),
            i(3)
        })),
    s("thin:rii", fmt(
        [[th:{}="${{{}}}"]], {
            c(1, {
                t("include"),
                t("replace"),
                t("insert"),
            }),
            i(2),
        })),
    s("th:li", fmt(
        [[th:{}="@{{{}}}"]], {
            c(1, {
                t("href"),
                t("src")
            }),
            i(2)
        })),
    s("th:ter", fmt(
        [[th:{}="${{{}}}?'{}':'{}'"]], {
            c(1, {
                t("text"),
                t("style")
            }),
            i(2),
            i(3),
            i(4),
        })),
})

-- stylua: ignore end

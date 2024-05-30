local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
-- local fmt = require("luasnip.extras.fmt").fmt
-- vim.keymap.set({ "i", "s" }, "<A-n>", function()
--     if ls.choice_active() then
--         ls.change_choice(1)
--     end
-- end)
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
ls.add_snippets("javascript", {
    s("taction", fmt([[toggleActions:"{} {} {} {}"]], {
        i(1, "onEnter"),
        i(2, "onLeave"),
        i(3, "onEnterBack"),
        i(4, "onLeaveBack")
    })),
    s("scrollTrigger", fmt([[
          scrollTrigger: {{
              trigger: "{}",
              start: "{}",
              end: "{}",
              scrub: {},
              pin: {},
              markers: {{
                  fontSize: "{}",
              }},
          }},
    ]], {
        i(1, "element"),     -- Placeholder for the element selector
        i(2, "top top"),     -- Placeholder for start value
        i(3, "center center"), -- Placeholder for end value
        i(4, "true"),        -- Placeholder for scrub value
        i(5, "true"),        -- Placeholder for pin value
        i(6, "3rem"),        -- Placeholder for font size
    })),
    s("tl.to", fmt([[
      tl.to("{}", {{
          duration: {},
          x: {},
          y: {},
          opacity: {},
          scale: {},
          rotation: {},
          backgroundColor: "{}",
          borderRadius: "{}",
          delay: {},
          ease: "{}"
      }});
    ]], {
        i(1, ".element"), -- Placeholder for the element selector
        i(2, "1"),      -- Placeholder for duration
        i(3, "0"),      -- Placeholder for x value
        i(4, "0"),      -- Placeholder for y value
        i(5, "1"),      -- Placeholder for opacity
        i(6, "1"),      -- Placeholder for scale
        i(7, "0"),      -- Placeholder for rotation
        i(8, "#ffffff"), -- Placeholder for backgroundColor
        i(9, "0%"),     -- Placeholder for borderRadius
        i(10, "0"),     -- Placeholder for delay
        i(11, "none"),  -- Placeholder for ease
    })),

    s("tl.from", fmt([[
    tl.from("{}", {{
          duration: {},
          x: {},
          y: {},
          opacity: {},
          scale: {},
          rotation: {},
          backgroundColor: "{}",
          borderRadius: "{}",
          delay: {},
          ease: "{}"
      }});
    ]], {
        i(1, ".element"), -- Placeholder for the element selector
        i(2, "1"),      -- Placeholder for duration
        i(3, "0"),      -- Placeholder for x value
        i(4, "0"),      -- Placeholder for y value
        i(5, "0"),      -- Placeholder for opacity
        i(6, "1"),      -- Placeholder for scale
        i(7, "0"),      -- Placeholder for rotation
        i(8, "#000000"), -- Placeholder for backgroundColor
        i(9, "0%"),     -- Placeholder for borderRadius
        i(10, "0"),     -- Placeholder for delay
        i(11, "none"),  -- Placeholder for ease
    })),

    s("tl.fromTo", fmt([[
      tl.fromTo("{}", {{
          x: {},
          y: {},
          opacity: {},
          scale: {},
          rotation: {},
          backgroundColor: "{}",
          borderRadius: "{}",
      }}, {{
          duration: {},
          x: {},
          y: {},
          opacity: {},
          scale: {},
          rotation: {},
          backgroundColor: "{}",
          borderRadius: "{}",
          delay: {},
          ease: "{}"
      }});
    ]], {
        i(1, ".element"), -- Placeholder for the element selector
        i(2, "0"),      -- Placeholder for starting x value
        i(3, "0"),      -- Placeholder for starting y value
        i(4, "0"),      -- Placeholder for starting opacity
        i(5, "1"),      -- Placeholder for starting scale
        i(6, "0"),      -- Placeholder for starting rotation
        i(7, "#000000"), -- Placeholder for starting backgroundColor
        i(8, "0%"),     -- Placeholder for starting borderRadius
        i(9, "1"),      -- Placeholder for duration
        i(10, "100"),   -- Placeholder for ending x value
        i(11, "100"),   -- Placeholder for ending y value
        i(12, "1"),     -- Placeholder for ending opacity
        i(13, "1"),     -- Placeholder for ending scale
        i(14, "360"),   -- Placeholder for ending rotation
        i(15, "#ffffff"), -- Placeholder for ending backgroundColor
        i(16, "50%"),   -- Placeholder for ending borderRadius
        i(17, "0"),     -- Placeholder for delay
        i(18, "none"),  -- Placeholder for ease
    })),
})
-- stylua: ignore end

local ls = require("luasnip")
local t = ls.text_node
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

-- ls.add_snippets("all", {
--   s("tib", {
--     t("//Hello tib")
--   }),
-- })

ls.add_snippets("html", {
  s(
    "tib-metasketchbook",
    fmt([[
    <title>{title}</title>
    <meta name="description" content="{description}">
    <meta name="author" content="Tibor Udvari">
    <meta name="keywords" content="{tags}">
    <meta name="date" content="{date}" scheme="YYYY-MM-DD">
    <meta name="p5-editor-id" content="{editorId}">
    <meta name="media-id" content="{media}">

    <meta property="og:title" content="{title}" />
    <meta property="og:description" content="{description}" />
    <meta property="og:image" content="https://www.tiborudvari.com/sketchbook/media/web/{media}.webp" />
    <meta property="og:url" content="https://www.tiborudvari.com/sketchbook/{path}/" />
    <meta property="og:type" content="website" />

    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="{title}">
    <meta name="twitter:description" content="{description}">
    <meta name="twitter:image" content="https://www.tiborudvari.com/sketchbook/media/web/{media}.webp">

    <script type="application/ld+json">
    {{
      "@context": "http://schema.org",
      "@type": "CreativeWork",
      "name": "Hello AR Box",
      "author": {{
        "@type": "Person",
        "name": "Tibor Udvari"
      }},
      "datePublished": "{date}",
      "keywords": "{tags}",
      "description": "{description}",
      "image": "https://www.tiborudvari.com/sketchbook/media/web/{media}.webp",
      "url": "https://www.tiborudvari.com/sketchbook/{path}/",
      "sameAs": "https://editor.p5js.org/TiborUdvari/sketches/{editorId}" 
    }}
    </script>
        ]], {
        title = i(1, "TITLE"),
        description = i(2, "DESCRIPTION"),
        tags = i(3, "TAGS"),
        date = i(4, "DATE"),
        editorId = i(5, "EDITORID"),
        media = i(6, "MEDIA"),
        path = i(7, "PATH"),
      },
      {
        repeat_duplicates = true
      }
    )
  ),
})

local ls = require("luasnip")
local t = ls.text_node
local s = ls.snippet
local f = ls.function_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

-- utils
function get_git_relative_path()
  local handle = io.popen("git rev-parse --show-toplevel")
  local git_root = handle:read("a")
  handle:close()
  git_root = string.gsub(git_root, "\n", "") -- remove trailing newline
  local file_path = vim.api.nvim_buf_get_name(0)

  if vim.startswith(file_path, git_root) then
    local res = string.gsub(file_path, git_root, "")
    return res
  end

  return file_path
end

-- keep history
ls.setup({
  keep_roots = true,
  link_roots = true,
  link_children = true,

  update_events = "TextChanged,TextChangedI",
  delete_check_events = "TextChanged",
  enable_autosnippets = true,
})

ls.add_snippets("all", {
  s("gitpath", {
    i(1, ""),
    f(get_git_relative_path, {}),
  }),
})

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
    <meta property="og:url" content="https://www.tiborudvari.com/sketchbook{path}" />
    <meta property="og:type" content="website" />

    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="{title}">
    <meta name="twitter:description" content="{description}">
    <meta name="twitter:image" content="https://www.tiborudvari.com/sketchbook/media/web/{media}.webp">

    <script type="application/ld+json">
    {{
      "@context": "http://schema.org",
      "@type": "CreativeWork",
      "name": "{title}",
      "author": {{
        "@type": "Person",
        "name": "Tibor Udvari"
      }},
      "datePublished": "{date}",
      "keywords": "{tags}",
      "description": "{description}",
      "image": "https://www.tiborudvari.com/sketchbook/media/web/{media}.webp",
      "url": "https://www.tiborudvari.com/sketchbook{path}",
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
        path = f(get_git_relative_path, {}),
      },
      {
        repeat_duplicates = true
      }
    )
  ),
})

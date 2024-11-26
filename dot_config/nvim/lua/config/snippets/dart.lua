-- ~/.config/nvim/lua/snippets/dart.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("dart", {
  s(
    "view",
    fmt(
      [[
import 'package:flutter/material.dart';
import 'package:subpub/subpub.dart';

class {}View extends StatelessWidget {{
  const {}View({{super.key}});
  @override
  Widget build(BuildContext context) {{
    return Subscriber((_) => Scaffold(appBar: AppBar(title: const Text('{}'))));
  }}
}}]],
      {
        i(1, "My"),
        rep(1),
        rep(1),
      }
    )
  ),
})

ls.add_snippets("dart", {
  s(
    "pub",
    fmt(
      [[
@Publish()
class {}Publisher extends Publisher {{}}]],
      {
        i(1, "My"),
      }
    )
  ),
})

return {}

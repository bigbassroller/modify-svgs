# ModifySvgs

## Signature

```elixir
  @moduledoc """
  Documentation for `ModifySvgs`.
  """

  @doc """
  convert_svg_to_eex/3

  ## Examples

      iex> ModifySvgs.convert_svg_to_eex("bootstrap-icons", "../my_app/lib/my_app_web/templates/icons", "<%= assigns[:svg_class] %>")
      "<svg class="<%= assigns[:svg_class] %>..." ...some long svg stuff</svg>", "<svg class="<%= assigns[:svg_class] %>..." ...some long svg stuff</svg>"

  """
```

## How to use

To use go into `iex -S mix`

Then run:
```elixir
ModifySvgs.convert_svg_to_eex("bootstrap-icons", "../my_app/lib/my_app_web/templates/icons", "<%= assigns[:svg_class] %>")
```

The above command simple moves all the bootstrap-icons to the templates directory with `html.eex` extension and injects `<%= assigns[:svg_class] %>` into the svg's css class. 

Next step is to create a view for your svgs.

(Inside your app)

**lib/my_app_web/views/svg_view.ex**
```elixir
defmodule MyAppWeb.SvgView do
  use MyAppWeb, :view

end
```


That is it!

You can now use svgs icons inside your eex templates like this:

```elixir
<%= render MyAppWeb.SvgView, "_emoji-sunglasses.html", svg_class: "text-teal-500" %>
```




## Installation

~~If [available in Hex](https://hex.pm/docs/publish)(spoiler, its not), the package can be installed
by adding `modify_svgs` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:modify_svgs, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/modify_svgs](https://hexdocs.pm/modify_svgs).
~~

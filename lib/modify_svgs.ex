defmodule ModifySvgs do
  @moduledoc """
  Documentation for `ModifySvgs`.
  """

  @doc """
  list_files/1

  ## Examples

      iex> ModifySvgs.list_files("svg")
      ["inbox.html.eex", ...]

  """
  def list_files(path) do
    File.ls!("#{path}")
  end

  @doc """
  get_svg/1

  ## Examples

      iex> ModifySvgs.get_svg("svg")
      "<svg ...some long svg stuff</svg>", "<svg ...some long svg stuff</svg>"

  """
  def get_svg(path) do
    list_files(path)
    |> Enum.each(fn(svg) ->
      {:ok, contents} = File.read!("#{path}/#{svg}")
      |> Floki.parse_document
      
      IO.inspect("🍒 contents")
      IO.inspect(contents)


      # This works
      # updates = Floki.attr(contents, "div", "class", fn _ -> "🍬" end)

      # 
      updates = Floki.attr(contents, "svg", "class", fn _ -> "🍬" end)
     
      IO.inspect("🍒 updates")
      IO.inspect(updates)
      # {:ok, update_contents} = Floki.attr(contents, "id", "a", fn(id) -> String.replace(id, "a", "b") end)
      # |> IO.inspect
      # IO.inspect("🍒 contents")
      # IO.inspect(contents)
    end)
  end

  def insert_attrs(path) do
    IO.inspect("data 🍒")
    # {:ok, svg} = get_svg(path)
    data = get_svg(path)
    |> IO.inspect()
    # Floki.attr([{"div", [{"id", "a"}], []}], "#a", "id", fn(id) -> String.replace(id, "a", "b") end)
    # |> IO.inspect
  end

# attr(html_elem_tuple, selector, attribute_name, mutation)
# Specs

# attr(binary() | html_tree(), binary(), binary(), (binary() -> binary())) ::
#   html_tree()

# Changes the attribute values of the elements matched by selector with the function mutation and returns the whole element tree
# Examples

# Floki.attr([{"div", [{"id", "a"}], []}], "#a", "id", fn(id) -> String.replace(id, "a", "b") end)
# [{"div", [{"id", "b"}], []}]

# Floki.attr([{"div", [{"class", "name"}], []}], "div", "id", fn _ -> "b" end)
# [{"div", [{"id", "b"}, {"class", "name"}], []}]


  # def add_assigns_to_svg(path) do

  #   list_files(path)
  #   |> Enum.each(fn(svg) ->
  #     IO.inspect("🍒 svg")
  #     IO.inspect(svg)
  #     {:ok, document} = Floki.parse_document(File.read!("#{path}/#{svg}"))
      
  #     html = Floki.find(document, "svg")
  #     |> Enum.each(fn(html) ->
  #       IO.inspect("🍒 html")
  #       IO.inspect(html)
  #       Floki.traverse_and_update(html, fn {"svg", attrs, children} ->

  #         {"width", attrs, children}

  #       end)
  #     end)
  #     |> IO.inspect()

  #     # new_name = String.replace(svg, "svg", "html.eex")
  #     # File.rename!("#{path}/#{svg}", "#{path}/#{new_name}")
  #   end)
  # end

end










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
  def add_assigns_to_svgs(path) do
    list_files(path)
    |> Enum.each(fn(svg) ->
      {:ok, contents} = File.read!("#{path}/#{svg}")
      |> Floki.parse_document
      
      attributes = Floki.attribute(contents, "class")
      added_attribute = ~S("<%= assigns[:svg_class] %>")

      IO.inspect("🍒 added_attribute")
      IO.inspect(added_attribute)

      # IO.inspect("🍒 updates")
      # updates = Floki.attr(contents, "svg", "class", fn _ -> "#{added_attribute} #{attributes}" end)
      updates = Floki.attr(contents, "svg", "class", fn _ -> "assigns #{attributes}" end)
      |> IO.inspect
      |> Floki.raw_html(encode: false)
      |> String.replace("assigns", ~S(<%= assigns[:svg_class] %>))
     
      IO.inspect("🍒 updates")
      IO.inspect(updates)

      new_name = String.replace(svg, "svg", "html.eex")
   
      IO.inspect("🍒 new_name")
      IO.inspect(new_name)


      new_file = File.write("icon-templates/#{new_name}", updates)
      
      # File.rename!("#{path}/#{svg}", "#{path}/#{new_name}")
    end)
  end

  def insert_attrs(path) do
    IO.inspect("data 🍒")
    # {:ok, svg} = get_svg(path)
    data = get_svg(path)
    |> IO.inspect()

  end


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










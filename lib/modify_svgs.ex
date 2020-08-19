defmodule ModifySvgs do
  @moduledoc """
  Documentation for `ModifySvgs`.
  """

  @doc """
  convert_svg_to_eex/3

  ## Examples

      iex> ModifySvgs.convert_svg_to_eex("bootstrap-icons", "../my_app/lib/my_app_web/templates/icons", "<%= assigns[:svg_class] %>")
      "<svg class="<%= assigns[:svg_class] %>..." ...some long svg stuff</svg>", "<svg class="<%= assigns[:svg_class] %>..." ...some long svg stuff</svg>"

  """
  def convert_svg_to_eex(source, dest, attrs) do
    File.ls!("#{source}")
    |> Enum.each(fn(svg) ->
      {:ok, contents} = File.read!("#{source}/#{svg}")
      |> Floki.parse_document
      
      attributes = Floki.attribute(contents, "class")

      updates = Floki.attr(contents, "svg", "class", fn _ -> "assigns #{attributes}" end)
      |> Floki.raw_html
      |> String.replace("assigns", attrs)

      new_name = String.replace(svg, "svg", "html.eex")
      mkdir = File.mkdir_p("#{dest}")

      new_file = File.write("#{dest}/_#{new_name}", updates) 
    end)
  end


end










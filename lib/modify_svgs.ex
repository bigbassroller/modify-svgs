defmodule ModifySvgs do
  @moduledoc """
  Documentation for `ModifySvgs`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ModifySvgs.list_files("svg")
      ["inbox.html.eex", ...]

  """
  def list_files(path) do
    File.ls!("#{path}")
  end

  def get_svg(path) do
    list_files(path)
    |> Enum.each(fn(svg) ->
      IO.inspect("🍒 svg")

      File.read!("#{path}/#{svg}")
      |> IO.inspect
    end)
  end

  def add_assigns_to_svg(path) do

    list_files(path)
    |> Enum.each(fn(svg) ->
      IO.inspect("🍒 svg")
      IO.inspect(svg)
      {:ok, document} = Floki.parse_document(File.read!("#{path}/#{svg}"))
      
      html = Floki.find(document, "svg")
      |> Enum.each(fn(html) ->
        IO.inspect("🍒 html")
        IO.inspect(html)
        Floki.traverse_and_update(html, fn {"svg", attrs, children} ->

          {"width", attrs, children}

        end)
      end)
      |> IO.inspect()

      # new_name = String.replace(svg, "svg", "html.eex")
      # File.rename!("#{path}/#{svg}", "#{path}/#{new_name}")
    end)
  end
end










defmodule DesafioCli do
  @moduledoc """
  Ponto de entrada para a CLI.
  """

  @doc """
  A função main recebe os argumentos passados na linha de
  comando como lista de strings e executa a CLI.
  """
  def main(_args) do
    # IO.puts(phrase())
    IO.puts("--- A ferramenta irá receber um nome por linha até receber uma linha em branco   ---")
    IO.puts("--- Então irá retornar a lista de nomes com o respectivo número romano a direita ---")
    IO.puts("")
    input = String.trim(IO.gets("Insira um nome por linha\n"))
    map_names = %{}
    _result = loop_reader(input, map_names)
    IO.puts("---- FIM -----")
  end

  def loop_reader(input, map_names) do
    case input do
      "" ->
        iterate_over_map_names(map_names)
        map_names
      x ->
        if Map.has_key?(map_names, x) do
          map_names = %{map_names | x => map_names[x] + 1}
          input_name = String.trim(IO.gets("Insira mais um:\n"))
          loop_reader(input_name, map_names)
        else
          map_names = Map.merge(map_names, %{x => 1})
          input_name = String.trim(IO.gets("Insira mais um:\n"))
          loop_reader(input_name, map_names)
        end
    end
  end

  def iterate_over_map_names(names) do
    for {name, counted} <- names do
      if counted == 1 do
        IO.puts("#{name} I")
      else
        repeat_names_and_convert(name, counted, 1)
      end
    end
  end

  def repeat_names_and_convert(name, max, counter) do
    if max < counter do
      name
    else
      roman_number = number_to_roman(counter)
      IO.puts("#{name} - #{roman_number}")
      counter = counter + 1
      repeat_names_and_convert(name, max, counter)
    end
  end

  def number_to_roman(number) do
    roman_table = [
      {1000, "M"},
      {900, "CM"},
      {500, "D"},
      {400, "CD"},
      {100, "C"},
      {90, "XC"},
      {50, "L"},
      {40, "XL"},
      {10, "X"},
      {9, "IX"},
      {5, "V"},
      {4, "IV"},
      {1, "I"}
    ]
    result = Enum.reduce(roman_table, {number, ""}, fn {indo_number, roman_number}, accumulator ->
    p_number_to_roman({indo_number, roman_number}, accumulator)
  end)

  elem(result, 1)
  end

  def p_number_to_roman({indo_number, roman_number}, {num, result_roman_number}) do
    if num >= indo_number,
      do: p_number_to_roman({indo_number, roman_number}, {num - indo_number, result_roman_number <> roman_number}),
      else: {num, result_roman_number}
  end

  def phrase() do
    # args = System.argv()
    # if length(args) > 1 do
    #   "Uso do script: desafio.cli <nomedoarquivo.txt>"
    # else
    #   path = hd(args)
    #   IO.puts(path)

    #   case File.read(path) do
    #     {:ok, result} -> IO.puts("Successo: \n#{result}")
    #     {:error, reason} -> IO.puts("Erro ao ler o arquivo: #{reason}")
    #   end

    #   # IO.puts(result)
    #   args
    # end
    "Hello, world!"
  end
end

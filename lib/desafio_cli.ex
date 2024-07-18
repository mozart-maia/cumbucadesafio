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

    input = String.trim(IO.gets("Insira um nome por linha\n"))
    names = %{}
    result = while(input, names)
    IO.inspect(result)
    # {value, _} = Integer.parse(result)
    # IO.puts("final #{toRoman(value)}")
  end



  def while(condicional, names) do
    case condicional do
      "" ->
        names
      x ->
        IO.inspect(names)
        if Map.has_key?(names, x) do
          IO.puts("primeiro")
          names = %{names | x => names[x] + 1}
          IO.inspect(names)
          nome = String.trim(IO.gets("Outro nome:\n"))
          while(nome, names)
        else
          IO.puts("segundo")
          names = Map.merge(names, %{x => 1})
          IO.inspect(names)
          nome = String.trim(IO.gets("Outro nome:\n"))
          while(nome, names)
        end
    end
  end




  # def phrase() do
  #   args = System.argv()
  #   if length(args) > 1 do
  #     "Uso do script: desafio.cli <nomedoarquivo.txt>"
  #   else
  #     path = hd(args)
  #     IO.puts(path)

  #     case File.read(path) do
  #       {:ok, result} -> IO.puts("Successo: \n#{result}")
  #       {:error, reason} -> IO.puts("Erro ao ler o arquivo: #{reason}")
  #     end

  #     # IO.puts(result)
  #     args
  #   end
  # end
end

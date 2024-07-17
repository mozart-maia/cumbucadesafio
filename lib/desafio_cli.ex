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
    result = IO.gets("Insira um nome por linha\n")
    while(result)
    # IO.puts(result)
  end

  def while(condicional) do
    case condicional do
      "\n" ->
        :ok
      x ->
        IO.puts(x)
        nextInput = IO.gets("")
        while(nextInput)
    end

  end

  def phrase() do
    args = System.argv()
    if length(args) > 1 do
      "Uso do script: desafio.cli <nomedoarquivo.txt>"
    else
      path = hd(args)
      IO.puts(path)

      case File.read(path) do
        {:ok, result} -> IO.puts("Successo: \n#{result}")
        {:error, reason} -> IO.puts("Erro ao ler o arquivo: #{reason}")
      end

      # IO.puts(result)
      args
    end
  end
end

defmodule ProteinTranslation do
  @codon %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """

  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    proteins = rna
    |>to_charlist
    |>Enum.chunk_every(3)
    |>get_protein([], &([&1 | &2]))
    |>Enum.reverse
    |>check
  end
  def get_protein([], acc, _fun), do: acc
  def get_protein([head | tail], acc, fun) do
    case protein = @codon[to_string(head)] do
      "STOP" -> get_protein([], acc, fun)
      _      -> get_protein(tail, fun.(protein, acc), fun)
    end
  end
  def check(proteins) do
    unless Enum.member?(proteins, nil) do
      {:ok, proteins}
    else
      {:error, "invalid RNA"}
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    protein = @codon[to_string(codon)]
    unless protein == nil do
      {:ok, protein}
    else
      {:error, "invalid codon"}
    end
  end
end

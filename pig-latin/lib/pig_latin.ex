defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |>to_charlist
    |>Enum.chunk_by(&(&1 == 32))
    |>Enum.map(&do_translate(&1,[]))
    |>to_string
  end

  defp do_translate([first_letter, second_letter | tail] = word, acc) when first_letter in 'xyXY' and second_letter not in 'aeiouAEIOU' do
    to_string(word ++ 'ay')
  end
  defp do_translate([first_letter | tail] = word, acc) when first_letter in 'aeiouAEIOU' do
    to_string(word ++ acc ++ 'ay')
  end
  defp do_translate([first_letter, second_letter | tail], acc) when first_letter in 'quQU' and second_letter in 'quQU' do
    do_translate(tail, acc ++ [first_letter, second_letter])
  end
  defp do_translate([head|tail], acc) do
    do_translate(tail, acc ++ [head])
  end
  defp do_translate([], _acc) do
    _acc
  end
end

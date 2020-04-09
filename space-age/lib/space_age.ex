defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / year_in_seconds_for(planet)
  end

  def year_in_seconds_for(:earth),   do: 31557600
  def year_in_seconds_for(:mercury), do: year_in_seconds_for(:earth) * 0.2408467
  def year_in_seconds_for(:venus),   do: year_in_seconds_for(:earth) * 0.61519726
  def year_in_seconds_for(:mars),    do: year_in_seconds_for(:earth) * 1.8808158
  def year_in_seconds_for(:jupiter), do: year_in_seconds_for(:earth) * 11.862615
  def year_in_seconds_for(:saturn),  do: year_in_seconds_for(:earth) * 29.447498
  def year_in_seconds_for(:uranus),  do: year_in_seconds_for(:earth) * 84.016846
  def year_in_seconds_for(:neptune), do: year_in_seconds_for(:earth) * 164.79132

end

defmodule PaperTrail.RepoClient do
  @doc """
  Gets the configured repo module or defaults to Repo if none configured
  """

  @item_type Application.compile_env(:paper_trail, :item_type) 
  @originator_type Application.compile_env(:paper_trail, :originator_type) 

  def repo, do: env(:repo, Repo)
  def originator, do: env(:originator, nil)
  def strict_mode, do: env(:strict_mode, false)
  def originator_relationship_opts, do: env(:originator_relationship_options, [])
  def timestamps_type, do: env(:timestamps_type, :utc_datetime)
  def origin_read_after_writes(), do: env(:origin_read_after_writes, true)
  def item_type do 
    if @item_type && Code.ensure_compiled!(@item_type), do: @item_type, else: :integer
  end
  def originator_type do 
    if @originator_type && Code.ensure_compiled!(@originator_type), do: @originator_type, else: :integer
  end

  defp env(k, default), do: Application.get_env(:paper_trail, k, default)
end

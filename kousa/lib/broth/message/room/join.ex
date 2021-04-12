defmodule Broth.Message.Room.Join do
  use Broth.Message.Call

  @primary_key false
  embedded_schema do
    field(:roomId, :binary_id)
  end

  import Ecto.Changeset

  alias Kousa.Utils.UUID

  def changeset(changeset, data) do
    changeset
    |> cast(data, [:roomId])
    |> validate_required([:roomId])
    |> UUID.normalize(:roomId)
  end

  defmodule Reply do
    use Broth.Message.Push, operation: "room:join:reply"

    @primary_key false
    schema "rooms" do
    end
  end
end

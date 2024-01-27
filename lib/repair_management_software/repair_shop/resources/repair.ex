defmodule RepairManagementSoftware.RepairShop.Repair do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "repairs"
    repo RepairManagementSoftware.Repo
  end

  actions do
    defaults [:create, :read, :update, :destroy]
  end

  attributes do
    uuid_primary_key :id
    attribute :device, :string do
      allow_nil? false
    end

    attribute :description, :string
  end
end

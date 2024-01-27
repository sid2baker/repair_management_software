defmodule RepairManagementSoftware.RepairShop.Customer do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "customers"
    repo RepairManagementSoftware.Repo
  end

  actions do
    defaults [:create, :read, :update, :destroy]
  end

  attributes do
    uuid_primary_key :id
    attribute :name, :string do
      allow_nil? false
    end
  end
end

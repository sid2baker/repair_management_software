defmodule RepairManagementSoftware.RepairShop do
  use Ash.Api

  resources do
    resource RepairManagementSoftware.RepairShop.Repair
  end
end

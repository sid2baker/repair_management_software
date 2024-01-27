defmodule RepairManagementSoftware.Repo do
  use AshPostgres.Repo,
    otp_app: :repair_management_software

  def installed_extensions do
    ["uuid-ossp", "citext"]
  end
end

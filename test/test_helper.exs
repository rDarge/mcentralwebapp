ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Mcentral.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Mcentral.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Mcentral.Repo)


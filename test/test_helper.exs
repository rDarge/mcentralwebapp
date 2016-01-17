ExUnit.start

Mix.Task.run "ecto.create", ~w(-r MCentral.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r MCentral.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(MCentral.Repo)


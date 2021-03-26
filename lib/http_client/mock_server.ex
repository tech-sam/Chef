defmodule Chef.MockServer do
  use Plug.Router

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["text/*"],
    json_decoder: Poison
  )

  plug(:match)
  plug(:dispatch)

  get "/feed/fastball" do
    fastball_response = %{
      matches: [
        %{
          away_team: "Cagliari Calcio",
          home_team: "Huddersfield Town",
          created_at: 1_616_723_821,
          kickoff_at: "2021-04-13T01:00:00Z"
        }
      ]
    }

    success(conn, fastball_response)
  end

  get "/feed/matchbeam" do
    matchbeam_response = %{
      matches: [
        %{
          teams: "Arsenal - Chelsea FC",
          created_at: 1_616_723_821,
          kickoff_at: "2021-04-13T01:00:00Z"
        }
      ]
    }

    success(conn, matchbeam_response)
  end

  defp success(conn, body) do
    conn
    |> Plug.Conn.send_resp(200, Poison.encode!(body))
  end

  defp failure(conn) do
    conn
    |> Plug.Conn.send_resp(422, Poison.encode!(%{message: "error message"}))
  end
end

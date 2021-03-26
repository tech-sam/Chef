defmodule Chef.HttpClient do
  require Logger

  def get(url) do
    HTTPoison.get(url)
    |> handle_response(url)
  end

  defp handle_response(response, request) do
    case response do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Poison.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        error_msg = "HTTP error - code: 400 for the request #{request}"
        Logger.error(error_msg)
        {:error, error_msg}

      {:ok, %HTTPoison.Response{status_code: 503}} ->
        error_msg = "HTTP error - code: 503 for the request #{request}"
        Logger.error(error_msg)
        {:error, error_msg}

      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.error("error occurred for the request #{request} due to #{reason}")
        {:error, reason}
    end
  end
end

defmodule Chef.HttpClient do
  require Logger

  def get(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Poison.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        error_msg = "HTTP error - code: 400 for the request #{url}"
        Logger.error(error_msg)
        {:error, error_msg}

      {:ok, %HTTPoison.Response{status_code: 503}} ->
        error_msg = "HTTP error - code: 503 for the request #{url}"
        Logger.error(error_msg)
        {:error, error_msg}

      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.error("error occurred for the request #{url} due to #{reason}")
        {:error, reason}
    end
  end
end

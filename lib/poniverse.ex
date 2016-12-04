defmodule Poniverse do
  @moduledoc """
  An OAuth2 strategy for Poniverse.
  """
  use OAuth2.Strategy

  alias OAuth2.Strategy.AuthCode

  defp config do
    [
      strategy: __MODULE__,
      site: "https://api.poniverse.net/v1",
      authorize_url: "https://poniverse.net/oauth/authorize",
      token_url: "https://poniverse.net/oauth/access_token"
    ]
    |> Keyword.merge(Application.get_all_env(:poniverse))
  end

  def client do
    config()
    |> OAuth2.Client.new()
  end

  def authorize_url! do
    OAuth2.Client.authorize_url!(client())
  end

  def get_token!(params \\ [], headers \\ []) do
    OAuth2.Client.get_token!(client(), Keyword.merge(params, client_secret: client().client_secret))
  end

  @doc ~S"""
  Get the Poniverse authorisation url.

  ## Examples

      iex> Poniverse.authorize_url!
      "https://poniverse.net/oauth/authorize?client_id=changeme&redirect_uri=http%3A%2F%2Flocalhost%2Fauth%2Fponiverse&response_type=code"
  """
  def authorize_url(client, params) do
    OAuth2.Strategy.AuthCode.authorize_url(client, params)
  end

  def get_token(client, params, headers) do
    client
    |> put_header("accept", "application/json")
    |> AuthCode.get_token(params, headers)
  end
end

class Stock < ApplicationRecord

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:public_key],
      secret_token: Rails.application.credentials.iex_client[:secret_key],
      endpoint: 'https://cloud.iexapis.com/v1'
    )
    client.quote(ticker_symbol).latest_price
  end
end

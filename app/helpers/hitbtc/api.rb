module Hitbtc
  module API
    extend self

    def ticker(symbol)
      response = make_request(:get, url: "#{ENV['HITBTC_HOST_URL']}/api/2/public/ticker/#{symbol}")
      JSON.parse(response.body)
    end

    def orderbook(symbol)
      response = make_request(:get, url: "#{ENV['HITBTC_HOST_URL']}/api/2/public/orderbook/#{symbol}")
      JSON.parse(response.body)
    end

    def balance
      response = make_request(:get, url: "#{ENV['HITBTC_HOST_URL']}/api/2/trading/balance")
      JSON.parse(response.body)
    end

    # Get Active orders
    def orders
      response = make_request(:get, url: "#{ENV['HITBTC_HOST_URL']}/api/2/order")
      JSON.parse(response.body)
    end

    def order_by(id)
      response = make_request(:get, url: "#{ENV['HITBTC_HOST_URL']}/api/2/order/#{id}")
      JSON.parse(response.body)
    end

    # https://github.com/hitbtc-com/hitbtc-api#create-new-order
    # orderData = {'symbol':'ethbtc', 'side': 'sell', 'quantity': '0.063', 'price': '0.046016' }
    def new_order(params = {})
      id = "TO#{Time.now.to_i}:#{rand(1..9999)}"
      response = make_request(:put,
                              url: "#{ENV['HITBTC_HOST_URL']}/api/2/order/#{id}",
                              params: params)
      JSON.parse(response.body)
    end

    private

    def make_request(type, params = {})
      RestClient::Request.execute(method: type,
                                  url: params[:url],
                                  user: ENV['PUBLIC_API_KEY'],
                                  password: ENV['SECRET_API_KEY'],
                                  params: params)
    end
  end
end

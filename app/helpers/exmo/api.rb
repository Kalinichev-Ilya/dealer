module Exmo
  module API
    extend self
    # pairs: 'BTC_USD', etc
    # limit: 200
    def last_bills(pair, limit)
      response = RestClient.get('https://api.exmo.com/v1/trades',
                                params: { pair: pair, limit: limit })
      JSON.parse(response.body)[pair]
    end
  end
end

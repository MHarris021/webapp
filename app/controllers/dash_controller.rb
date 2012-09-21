class DashController < ApplicationController
  def chart
    @data = Market.all.map do |market|
      [ market.name,
        market.tickers.map{|t| [t.created_at.to_i*1000, t.highest_bid_usd.to_f]},
        market.tickers.map{|t| [t.created_at.to_i*1000, t.lowest_ask_usd.to_f]}]
    end

    @last_mtgox = Market.first.last_ticker
    @last_bitstamp = Market.last.last_ticker
  end
end
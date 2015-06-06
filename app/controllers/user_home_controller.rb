require 'open-uri'
require 'json'

class UserHomeController < ApplicationController

  def index
    @user_reward= Reward.all
  end


  def calculator
  # Using Google Map API

    @street_address = params[:location_address]
    url_safe_street_address = URI.encode(@street_address)
    @x=@street_address.blank?

if @x == false
  # Obtaining Latitude and Longitude from the street address

    url= "http://maps.googleapis.com/maps/api/geocode/json?address=" + url_safe_street_address
    parsed_data= JSON.parse(open(url).read)

    @latitude = (parsed_data["results"][0]["geometry"]["location"]["lat"]).round(2)

    @longitude = (parsed_data["results"][0]["geometry"]["location"]["lng"]).round(2)
end

  # Collecting Data from the User
  @a = params[:user_reward_id]
  @dollarvalue= (params[:dollar_value]).to_f.round(1)

  # Retrieving the user address's
  x= current_user.credit_card_no1
  y= current_user.credit_card_no2
  z= current_user.credit_card_no3

  # Saving Credit Card Information given the user's category request
  b=RewardCalculator.where({:reward_id => @a, :credit_card_id => x})
  c=RewardCalculator.where({:reward_id => @a, :credit_card_id => y})
  d=RewardCalculator.where({:reward_id => @a, :credit_card_id => z})

b.each do |b|
  @j=b.cash_back_pct
  @l=b.credit_card_id
end

c.each do |c|
  @i=c.cash_back_pct
  @m=c.credit_card_id
end

d.each do |d|
  @k=d.cash_back_pct
  @n=d.credit_card_id
end

@max= [@i,@j,@k].max
@est_rewards = (@dollarvalue.to_f * @max.to_f).round(2)

@bestcreditcard=RewardCalculator.where({:cash_back_pct => @max, :reward_id => @a, :credit_card_id => [current_user.credit_card_no1, current_user.credit_card_no2,current_user.credit_card_no3]})

  end

end


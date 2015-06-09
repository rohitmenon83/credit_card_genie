require 'open-uri'
require 'json'

class UserCreditCardsController < ApplicationController
  before_action :authenticate_user!

# Only gives access to current user
  def index
    @user_credit_cards = UserCreditCard.where({ :user_id => current_user.id})
  end

# Only Gives access to current user in the View Action

  def show
    @user_credit_card = UserCreditCard.find(params[:id])
 end

# Creates new row in the database
  def new
    @user_credit_card = UserCreditCard.new
  end

# Logic for Selecting right credit card
  def calculator
     # Using Google Map API

    @location = params[:location]
    @street_address = params[:address]
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
  @dollarvalue= (params[:purchase_amt]).to_f.round(1)

  # Retrieving the user address's
  x= current_user.credit_card_no1
  y= current_user.credit_card_no2
  z= current_user.credit_card_no3

  # Saving Credit Card Information given the user's category request
  b=RewardCalculator.where({:reward_id => @a, :credit_card_id => x})
  c=RewardCalculator.where({:reward_id => @a, :credit_card_id => y})
  d=RewardCalculator.where({:reward_id => @a, :credit_card_id => z})

  #Obtaining the users cash back pct and credit card if for each of his/her credit card
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

#Determining the Max reward %
@max= [@i,@j,@k].max

#Determining the estimated rewards
@est_rewards = (@dollarvalue.to_f * @max.to_f).round(2)

#Returning the best credit card based on the rewards criterion given a category
@bestcreditcard=RewardCalculator.where({:cash_back_pct => @max, :reward_id => @a, :credit_card_id => [current_user.credit_card_no1, current_user.credit_card_no2,current_user.credit_card_no3]})

#Calculating Select Card List
array=[]
n=0
@bestcreditcard.each do |zebra|
  array[n]=zebra.credit_card_id
  n=n+1
  end

@selected_cards=CreditCard.where ({ :id => array})

  end

# Creates Transaction for current user if he/she hits save

  def create
    @user_credit_card = UserCreditCard.new
    @user_credit_card.user_id = current_user.id
    @user_credit_card.credit_card_id = params[:credit_card_id]
    @user_credit_card.reward_id = params[:reward_id]
    @user_credit_card.dollar_rewards = params[:dollar_rewards]
    @user_credit_card.location = params[:location]
    @user_credit_card.address = params[:address]
    @user_credit_card.purchase_amt = params[:purchase_amt]
    @user_credit_card.save

      redirect_to "/user_credit_cards", :notice => "Transaction created successfully."

  end

  def edit
    @user_credit_card = UserCreditCard.find(params[:id])
  end

  def update
    @user_credit_card = UserCreditCard.find(params[:id])

    @user_credit_card.user_id = params[:user_id]
    @user_credit_card.credit_card_id = params[:credit_card_id]
    @user_credit_card.reward_id = params[:reward_id]
    @user_credit_card.dollar_rewards = params[:dollar_rewards]
    @user_credit_card.location = params[:location]
    @user_credit_card.purchase_amt = params[:purchase_amt]

    if @user_credit_card.save
      redirect_to "/user_credit_cards", :notice => "User credit card updated successfully."
    else
      render 'edit'
    end
  end

# Delete selected transaction

  def destroy
    @user_credit_card = UserCreditCard.find(params[:id])

    @user_credit_card.destroy

    redirect_to "/user_credit_cards", :notice => "User credit card deleted."
  end
end

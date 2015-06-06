class CreditCardsController < ApplicationController
  def index
    @credit_cards = CreditCard.all
  end

  def show
    @credit_card = CreditCard.find(params[:id])
  end

  def new
    @credit_card = CreditCard.new
  end

  def create
    @credit_card = CreditCard.new
    @credit_card.name = params[:name]

    if @credit_card.save
      redirect_to "/credit_cards", :notice => "Credit card created successfully."
    else
      render 'new'
    end
  end

  def edit
    @credit_card = CreditCard.find(params[:id])
  end

  def update
    @credit_card = CreditCard.find(params[:id])

    @credit_card.name = params[:name]

    if @credit_card.save
      redirect_to "/credit_cards", :notice => "Credit card updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @credit_card = CreditCard.find(params[:id])

    @credit_card.destroy

    redirect_to "/credit_cards", :notice => "Credit card deleted."
  end
end

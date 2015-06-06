class RewardCalculatorsController < ApplicationController
  def index
    @reward_calculators = RewardCalculator.all
  end

  def show
    @reward_calculator = RewardCalculator.find(params[:id])
  end

  def new
    @reward_calculator = RewardCalculator.new
  end

  def create
    @reward_calculator = RewardCalculator.new
    @reward_calculator.cash_back_pct = params[:cash_back_pct]
    @reward_calculator.credit_card_id = params[:credit_card_id]
    @reward_calculator.reward_id = params[:reward_id]

    if @reward_calculator.save
      redirect_to "/reward_calculators", :notice => "Reward calculator created successfully."
    else
      render 'new'
    end
  end

  def edit
    @reward_calculator = RewardCalculator.find(params[:id])
  end

  def update
    @reward_calculator = RewardCalculator.find(params[:id])

    @reward_calculator.cash_back_pct = params[:cash_back_pct]
    @reward_calculator.credit_card_id = params[:credit_card_id]
    @reward_calculator.reward_id = params[:reward_id]

    if @reward_calculator.save
      redirect_to "/reward_calculators", :notice => "Reward calculator updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @reward_calculator = RewardCalculator.find(params[:id])

    @reward_calculator.destroy

    redirect_to "/reward_calculators", :notice => "Reward calculator deleted."
  end
end

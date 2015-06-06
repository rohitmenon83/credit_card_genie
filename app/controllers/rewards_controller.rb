class RewardsController < ApplicationController
  def index
    @rewards = Reward.all
  end

  def show
    @reward = Reward.find(params[:id])
  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new
    @reward.category_name = params[:category_name]

    if @reward.save
      redirect_to "/rewards", :notice => "Reward created successfully."
    else
      render 'new'
    end
  end

  def edit
    @reward = Reward.find(params[:id])
  end

  def update
    @reward = Reward.find(params[:id])

    @reward.category_name = params[:category_name]

    if @reward.save
      redirect_to "/rewards", :notice => "Reward updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @reward = Reward.find(params[:id])

    @reward.destroy

    redirect_to "/rewards", :notice => "Reward deleted."
  end
end

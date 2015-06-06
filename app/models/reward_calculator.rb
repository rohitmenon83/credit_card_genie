class RewardCalculator < ActiveRecord::Base


validates :cash_back_pct, :presence => true
validates :credit_card_id, :uniqueness => { :scope => :reward_id }

belongs_to :reward , :class_name => "Reward", :foreign_key => "reward_id"
belongs_to :credit_card , :class_name => "CreditCard", :foreign_key => "credit_card_id"
end

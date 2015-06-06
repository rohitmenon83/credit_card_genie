class CreditCard < ActiveRecord::Base

has_many :users_credit_cards , :class_name => "UsersCreditCard", :foreign_key => "credit_card_id"
has_many :reward_calculators , :class_name => "RewardCalculator", :foreign_key => "credit_card_id"
has_many :rewards, :through => :reward_calculators
has_many :users, :through => :users_credit_cards
end

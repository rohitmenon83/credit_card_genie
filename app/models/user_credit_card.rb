class UserCreditCard < ActiveRecord::Base

validates :location, :presence => true
validates :purchase_amt, presence: true
validates :reward, presence: true
validates :reward_id, presence: true

belongs_to :reward , :class_name => "Reward", :foreign_key => "reward_id"
belongs_to :credit_card , :class_name => "CreditCard", :foreign_key => "credit_card_id"
belongs_to :user
end

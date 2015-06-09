class AddAddressToUserCreditCards < ActiveRecord::Migration
  def change

      add_column :user_credit_cards, :address, :string
  end
end

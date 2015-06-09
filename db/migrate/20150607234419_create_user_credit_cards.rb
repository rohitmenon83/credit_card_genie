class CreateUserCreditCards < ActiveRecord::Migration
  def change
    create_table :user_credit_cards do |t|
      t.integer :user_id
      t.integer :credit_card_id
      t.integer :reward_id
      t.float :dollar_rewards
      t.text :location
      t.float :purchase_amt

      t.timestamps

    end
  end
end

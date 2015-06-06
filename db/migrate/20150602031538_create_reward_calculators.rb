class CreateRewardCalculators < ActiveRecord::Migration
  def change
    create_table :reward_calculators do |t|
      t.float :cash_back_pct
      t.integer :credit_card_id
      t.integer :reward_id

      t.timestamps

    end
  end
end

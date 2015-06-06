class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :category_name

      t.timestamps

    end
  end
end

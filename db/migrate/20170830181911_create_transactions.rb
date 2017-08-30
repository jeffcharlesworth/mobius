class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.integer :num_credits

      t.timestamps null: false
    end
  end
end

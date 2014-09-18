class CreatePokes < ActiveRecord::Migration
  def change
    create_table :pokes do |t|
      t.references :user, index: true
      t.integer :poker_id
      t.integer :poked_id
      t.integer :poke_count

      t.timestamps
    end
  end
end

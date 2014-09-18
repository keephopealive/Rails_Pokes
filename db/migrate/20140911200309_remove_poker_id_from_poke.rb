class RemovePokerIdFromPoke < ActiveRecord::Migration
  def change
    remove_column :pokes, :poker_id, :integer
  end
end

class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :pokes, :poked_id, :poke_id
  end
end

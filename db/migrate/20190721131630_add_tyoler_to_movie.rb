class AddTyolerToMovie < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :tyoler, :string
  end
end

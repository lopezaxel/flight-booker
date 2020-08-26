class ChangeDateToDateTime < ActiveRecord::Migration[6.0]
  def change
    change_column :flights, :date, :date
  end
end

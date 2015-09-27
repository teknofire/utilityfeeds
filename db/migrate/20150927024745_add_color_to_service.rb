class AddColorToService < ActiveRecord::Migration
  def change
    add_column :services, :color, :string
  end
end

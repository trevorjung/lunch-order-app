class AddImageToLunches < ActiveRecord::Migration
  def change
    add_column :lunches, :image, :string
  end
end

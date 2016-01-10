class AddSchoolIdToLunches < ActiveRecord::Migration
  def change
    add_column :lunches, :school_id, :integer
  end
end

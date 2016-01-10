class AddSchoolNameToSchoolLunches < ActiveRecord::Migration
  def change
    add_column :school_lunches, :school_name, :string
    add_column :school_lunches, :entree, :string
  end
end

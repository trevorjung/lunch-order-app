class AddDateAndMonthToSchoolLunches < ActiveRecord::Migration
  def change
    add_column :school_lunches, :date, :date
    add_column :school_lunches, :month, :string

  end
end

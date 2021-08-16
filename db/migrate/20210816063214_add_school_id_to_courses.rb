class AddSchoolIdToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :school_id, :integer
  end
end

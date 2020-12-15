class AddSemesterAndMajorToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :major, :string
    add_column :users, :year, :integer
    add_column :users, :semester, :integer
  end
end

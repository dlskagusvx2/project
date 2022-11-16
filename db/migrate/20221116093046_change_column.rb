class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
	  add_column(:attendees, :a_name, :string)
	  add_column(:attendees, :a_num, :integer)
	  add_column(:attendees, :grade, :integer)
	  add_column(:attendees, :admin, :boolean)
  end
end

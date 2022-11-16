class ChangeColumn2 < ActiveRecord::Migration[5.2]
  def change
	  add_reference :attendees, :departments, index: true
	  add_foreign_key :attendees, :departments, on_delete: :cascade
  end
end

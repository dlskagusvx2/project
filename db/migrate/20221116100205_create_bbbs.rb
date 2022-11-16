class CreateBbbs < ActiveRecord::Migration[5.2]
  def change
    create_table :bbbs do |t|
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end

class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :title
      t.date :data
      t.float :amount

      t.timestamps
    end
  end
end
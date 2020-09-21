class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.string :title
      t.string :sub_title

      t.timestamps
    end
  end
end

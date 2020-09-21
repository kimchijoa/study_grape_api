class CreateGrapeSurvey01s < ActiveRecord::Migration[5.2]
  def change
    create_table :grape_survey01s do |t|
      t.string :title
      t.string :sub_title

      t.timestamps
    end
  end
end

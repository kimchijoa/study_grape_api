class CreateSurveyQItems < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_q_items do |t|
      t.string :question_type
      t.string :title
      t.string :desc
      t.references :survey, foreign_key: true

      t.timestamps
    end
  end
end

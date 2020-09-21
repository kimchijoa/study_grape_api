class CreateSurveyQItemLists < ActiveRecord::Migration[5.2]
  def change
    create_table :survey_q_item_lists do |t|
      t.references :survey_q_item, foreign_key: true
	  t.references :survey, foreign_key: true
      t.string :item

      t.timestamps
    end
  end
end

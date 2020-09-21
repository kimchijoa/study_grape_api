class CreateGrapeSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :grape_surveys do |t|

      t.timestamps
    end
  end
end

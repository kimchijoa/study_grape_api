class CreateSTests < ActiveRecord::Migration[5.2]
  def change
    create_table :s_tests do |t|
      t.string :q_title
      t.string :q_sub_title

      t.timestamps
    end
  end
end

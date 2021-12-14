class CreateSurveyDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :survey_details do |t|
      t.string :title

      t.timestamps
    end
  end
end

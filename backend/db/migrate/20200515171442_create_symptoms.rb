class CreateSymptoms < ActiveRecord::Migration[6.0]
  def change
    create_table :symptoms do |t|
      t.string :description null: false

      t.timestamps
    end
  end
end

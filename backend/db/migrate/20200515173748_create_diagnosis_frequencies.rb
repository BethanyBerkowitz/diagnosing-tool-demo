class CreateDiagnosisFrequencies < ActiveRecord::Migration[6.0]
  def change
    create_table :diagnosis_frequencies do |t|
      t.integer :frequency null: false, default: 0
      t.integer :diagnosis_id, null: false
      t.integer :symptom_id, null: false

      t.timestamps
    end
  end
end

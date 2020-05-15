class DiagnosisFrequency < ApplicationRecord
    belongs_to :diagnosis 
    belongs_to :symptom

    def self.add(diagnosis_id:, symptom_id:)
        match = self.find_by(diagnosis_id: diagnosis_id, symptom_id: symptom_id)
        if match
            match.increment!(:frequency)
        else
            self.create!(diagnosis_id: diagnosis_id, symptom_id: symptom_id, frequency: 1)
        end
    end
end

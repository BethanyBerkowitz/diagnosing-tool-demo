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

    def self.most_frequent_diagnosis(symptom_id:)
        # If two diagnoses have the same frequency, this will just choose one
        frequency = self.where(symptom_id: symptom_id).max_by(&:frequency)
        # If we don't have any diagnoses for this symptom yet, just return a random one
        # Note that Diagnosis.all.sample would not be a good idea if we had a lot of records
        return frequency ? frequency.diagnosis : Diagnosis.all.sample
    end
end

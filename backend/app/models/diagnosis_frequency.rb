class DiagnosisFrequency < ApplicationRecord
    belongs_to :diagnosis 
    belongs_to :symptom
end

require 'test_helper'

class DiagnosisFrequenciesControllerTest < ActionDispatch::IntegrationTest

  test "#create should increment the diagnosis frequency" do
    diagnosis = Diagnosis.first
    symptom = Symptom.first
    # The first time, it will create a database entry with a frequency of 1
    post '/diagnosis_frequencies', params: { diagnosis_id: diagnosis.id, symptom_id: symptom.id }
    diagnosis_freq = DiagnosisFrequency.find_by(diagnosis_id: diagnosis.id, symptom_id: symptom.id)
    assert_equal 1, diagnosis_freq.frequency
    # Afterward, it will increment the frequency
    post '/diagnosis_frequencies', params: { diagnosis_id: diagnosis.id, symptom_id: symptom.id }
    diagnosis_freq.reload
    assert_equal 2, diagnosis_freq.frequency
    
    assert_equal "201", response.code
  end

  # TODO: Add testing for when multiple diagnoses are tied in frequency, or when there are no
  # frequencies recorded
  test "#most_frequent_diagnosis should return the most frequent diagnosis" do
    common_diagnosis = Diagnosis.first
    rare_diagnosis = Diagnosis.last
    symptom = Symptom.first

    DiagnosisFrequency.create!(diagnosis_id: common_diagnosis.id, symptom_id: symptom.id, frequency: 100)
    DiagnosisFrequency.create!(diagnosis_id: rare_diagnosis.id, symptom_id: symptom.id, frequency: 2)
    
    get "/most_frequent_diagnosis/#{symptom.id}"
    assert_equal common_diagnosis.to_json, response.body
    assert_equal "200", response.code
  end

  test "#index should get full set of database entries as json" do
    get '/diagnosis_frequencies'
    assert_equal DiagnosisFrequency.all.to_json, response.body
    assert_equal "200", response.code
  end
end

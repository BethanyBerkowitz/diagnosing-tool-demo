class DiagnosisFrequenciesController < ApplicationController
    def index
        @frequencies = DiagnosisFrequency.all
        render :json => @frequencies
    end 

    def show
        @frequency = DiagnosisFrequency.find(params[:id])
        render :json => @frequency
    end

    def create
        DiagnosisFrequency.add(diagnosis_id: params[:diagnosis_id], symptom_id: params[:symptom_id])
        render :created
    end

    def most_frequent_diagnosis
        @diagnosis = DiagnosisFrequency.most_frequent_diagnosis(symptom_id: params[:symptom_id])
        render :json => @diagnosis
    end
end

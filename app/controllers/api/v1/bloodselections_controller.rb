require 'patient_builder'

class Api::V1::BloodselectionsController < Api::V1::BaseController
  def patients
    respond_to do |format|
      patient_data_set = PatientDataSet.new
      PatientBuilder.build_patients.each do |patient|
        patient_data_set.tt_Person << patient.to_hash
      end
      format.json { render json: patient_data_set.to_json }
    end
  end

end
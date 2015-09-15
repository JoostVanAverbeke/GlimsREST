require 'patient_builder'

class Api::V1::PatientsController < Api::V1::BaseController
  before_action :find_patient, only: [:show]

  def index
  end

  def show
    respond_to do |format|
      patient_data_set = PatientDataSet.new
      patient_data_set.tt_Person << @patient.to_hash
      format.json { render json: patient_data_set.to_json }
    end
  end

  private

  def find_patient
    @patient = PatientBuilder.find(params[:id].to_i)
  end
end
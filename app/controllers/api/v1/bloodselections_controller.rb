require 'patient_builder'
require 'blood_selection_builder'

class Api::V1::BloodselectionsController < Api::V1::BaseController

  before_action :find_patient, only: [:index, :show]

  def patients
    respond_to do |format|
      patient_data_set = PatientDataSet.new
      PatientBuilder.build_patients.each do |patient|
        patient_data_set.tt_Person << patient.to_hash
      end
      format.json { render json: patient_data_set.to_json }
    end
  end

  def index
    respond_to do |format|
      if @patient
        blood_selection_data_set = BloodSelectionDataSet.new
        BloodSelectionBuilder.build_blood_selections(@patient).each do |blood_selection|
          blood_selection_data_set.tt_BloodSelection << blood_selection.to_hash
        end
        format.json { render json: blood_selection_data_set.to_json }
      else
        format.json { render json: 'Patient does not exist', status: :not_found }
      end
    end
  end

  def show
    respond_to do |format|
      if @patient
        blood_selection = BloodSelectionBuilder.find(@patient.prsn_Object, params[:id].to_i)
        if blood_selection
          blood_selection_data_set = BloodSelectionDataSet.new
          blood_selection_data_set.tt_BloodSelection << blood_selection.to_hash
          format.json { render json: blood_selection_data_set.to_json }
        else
          format.json { render json: 'Blood selection does not exist', status: :not_found }
        end
      else
        format.json { render json: 'Patient does not exist', status: :not_found }
      end
    end
  end

  private

  def find_patient
    @patient = PatientBuilder.find(params[:patient_id].to_i)
  end
end
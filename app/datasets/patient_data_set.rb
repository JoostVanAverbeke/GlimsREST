class PatientDataSet
  attr_accessor :tt_Person

  def initialize
    @tt_Person = []
  end

  def ds_patient
    { dsPatients: {tt_Person: tt_Person } }
  end

  def to_json
    ds_patient.to_json
  end
end
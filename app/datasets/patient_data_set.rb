class PatientDataSet
  attr_accessor :tt_Person

  def initialize
    @tt_Person = []
  end

  def ds_user
    { dsPatients: {tt_Person: tt_Person } }
  end

  def to_json
    ds_user.to_json
  end
end
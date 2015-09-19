class BloodSelectionDataSet
  attr_accessor :tt_BloodSelection

  def initialize
    @tt_BloodSelection = []
  end

  def ds_blood_selections
    { dsBloodselections: { tt_BloodSelection: tt_BloodSelection } }
  end

  def to_json
    ds_blood_selections.to_json
  end

end
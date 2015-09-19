class BloodSelectionBuilder
  @@blood_selections = []

  def self.build_blood_selections(patient_id)
    @@blood_selections = []
    blood_selection1 = BloodSelection.new({"bsel_Id" => 1, "bsel_Object" => patient_id, "bsel_Person" => 66422, "bsel_Status" => 4, "bsel_StatusString" => "Ready", "bsel_Ward" => "118", "bsel_WardName" => "oncologisch dagcentrum", "bsel_Room" => nil, "bsel_OrderInternalId" => "20140708-00160", "bsel_OrderLowestObjectTime" => 2456848.621527, "bsel_ObjectExternalization" => "Ziemann, Monica (F), 11\/11\/1999", "bsel_ProductMnemonic" => "ECL", "bsel_SeqNo" => 1, "bsel_BloodBagStatus" => 6, "bsel_BloodBagStatusString" => "Administered", "bsel_BloodGroup" => 4, "bsel_BloodGroupString" => "O", "bsel_Rhesus" => 1, "bsel_RhesusString" => "pos", "bsel_PositiveScreening" => nil})
    blood_selection2 = BloodSelection.new({"bsel_Id" => 2, "bsel_Object" => patient_id, "bsel_Person" => 66422, "bsel_Status" => 4, "bsel_StatusString" => "Ready", "bsel_Ward" => "118", "bsel_WardName" => "oncologisch dagcentrum", "bsel_Room" => nil, "bsel_OrderInternalId" => "20140708-00160", "bsel_OrderLowestObjectTime" => 2456848.621527, "bsel_ObjectExternalization" => "Ziemann, Monica (F), 11\/11\/1999", "bsel_ProductMnemonic" => "ECL", "bsel_SeqNo" => 2, "bsel_BloodBagStatus" => 6, "bsel_BloodBagStatusString" => "Administered", "bsel_BloodGroup" => 4, "bsel_BloodGroupString" => "O", "bsel_Rhesus" => 1, "bsel_RhesusString" => "pos", "bsel_PositiveScreening" => nil})
    blood_selection3 = BloodSelection.new({"bsel_Id" => 3, "bsel_Object" => patient_id, "bsel_Person" => 66422, "bsel_Status" => 4, "bsel_StatusString" => "Ready", "bsel_Ward" => "118", "bsel_WardName" => "oncologisch dagcentrum", "bsel_Room" => nil, "bsel_OrderInternalId" => "20140708-00160", "bsel_OrderLowestObjectTime" => 2456848.621527, "bsel_ObjectExternalization" => "Ziemann, Monica (F), 11\/11\/1999", "bsel_ProductMnemonic" => "ECL", "bsel_SeqNo" => 3, "bsel_BloodBagStatus" => 6, "bsel_BloodBagStatusString" => "Administered", "bsel_BloodGroup" => 4, "bsel_BloodGroupString" => "O", "bsel_Rhesus" => 1, "bsel_RhesusString" => "pos", "bsel_PositiveScreening" => nil})
    blood_selection4 = BloodSelection.new({"bsel_Id" => 4, "bsel_Object" => patient_id, "bsel_Person" => 66422, "bsel_Status" => 4, "bsel_StatusString" => "Ready", "bsel_Ward" => "118", "bsel_WardName" => "oncologisch dagcentrum", "bsel_Room" => nil, "bsel_OrderInternalId" => "20140708-00160", "bsel_OrderLowestObjectTime" => 2456848.621527, "bsel_ObjectExternalization" => "Ziemann, Monica (F), 11\/11\/1999", "bsel_ProductMnemonic" => "ECL", "bsel_SeqNo" => 4, "bsel_BloodBagStatus" => 6, "bsel_BloodBagStatusString" => "Administered", "bsel_BloodGroup" => 4, "bsel_BloodGroupString" => "O", "bsel_Rhesus" => 1, "bsel_RhesusString" => "pos", "bsel_PositiveScreening" => nil})
    blood_selection5 = BloodSelection.new({"bsel_Id" => 5, "bsel_Object" => patient_id, "bsel_Person" => 66422, "bsel_Status" => 4, "bsel_StatusString" => "Ready", "bsel_Ward" => "118", "bsel_WardName" => "oncologisch dagcentrum", "bsel_Room" => nil, "bsel_OrderInternalId" => "20140708-00160", "bsel_OrderLowestObjectTime" => 2456848.621527, "bsel_ObjectExternalization" => "Ziemann, Monica (F), 11\/11\/1999", "bsel_ProductMnemonic" => "ECL", "bsel_SeqNo" => 5, "bsel_BloodBagStatus" => 6, "bsel_BloodBagStatusString" => "Administered", "bsel_BloodGroup" => 4, "bsel_BloodGroupString" => "O", "bsel_Rhesus" => 1, "bsel_RhesusString" => "pos", "bsel_PositiveScreening" => nil})
    @@blood_selections << blood_selection1
    @@blood_selections << blood_selection2
    @@blood_selections << blood_selection3
    @@blood_selections << blood_selection4
    @@blood_selections << blood_selection5
  end

  def self.find(patient_id, blood_selection_id)
    self.build_blood_selections(patient_id).each do |blood_selection|
      if blood_selection.bsel_Id == blood_selection_id
        return blood_selection
      end
    end
    return nil
  end
end
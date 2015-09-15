class PatientBuilder
  @@Patients = []
  def self.build_patients
    @@patients = []
    kassulke = Patient.new({"prsn_Id" => 66368,"prsn_FirstName" => "Lexus","prsn_LastName" => "Kassulke","prsn_BirthDate" => "1997-08-14","prsn_Object" => 12,"prsn_Externalization" => "Kassulke, Lexus (M), 14\/08\/1997","prsn_Gender" => 1,"prsn_BagsAtLabOrWard" => 1})
    yost = Patient.new({"prsn_Id" => 66517,"prsn_FirstName" => "Kari","prsn_LastName" => "Yost","prsn_BirthDate" => "1933-07-31","prsn_Object" => 50,"prsn_Externalization" => "Yost, Kari (F), 31\/07\/1933","prsn_Gender" => 2,"prsn_BagsAtLabOrWard" => 0})
    cleveland = Patient.new({"prsn_Id" => 66573,"prsn_FirstName" => "Douglas","prsn_LastName" => "Cleveland","prsn_BirthDate" => "1917-07-10","prsn_Object" => 106,"prsn_Externalization" => "Douglas, Cleveland (M), 10\/07\/1917","prsn_Gender" => 1,"prsn_BagsAtLabOrWard" => 0})
    bins = Patient.new({"prsn_Id" => 66615,"prsn_FirstName" => "Hayden","prsn_LastName" => "Bins","prsn_BirthDate" => "2005-03-31","prsn_Object" => 148,"prsn_Externalization" => "Bins, Hayden (M), 31\/03\/2005","prsn_Gender" => 1,"prsn_BagsAtLabOrWard" => 1})
    ziemann = Patient.new({"prsn_Id" => 66422,"prsn_FirstName" => "Monica","prsn_LastName" => "Ziemann","prsn_BirthDate" => "1999-11-11","prsn_Object" => 150,"prsn_Externalization" => "Ziemann, Monica (F), 11\/11\/1999","prsn_Gender" => 2,"prsn_BagsAtLabOrWard" => 0})
    @@patients << kassulke
    @@patients << yost
    @@patients << cleveland
    @@patients << bins
    @@patients << ziemann
  end

  def self.find(prsn_Id)
    self.build_patients.each do |patient|
      if patient.prsn_Id == prsn_Id
        return patient
      end
    end
  end
end
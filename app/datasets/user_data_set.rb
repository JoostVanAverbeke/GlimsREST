class UserDataSet
  attr_accessor :tt_User

  def initialize
    @tt_User = []
  end

  def ds_user
    { dsUsers: {tt_User: tt_User } }
  end

  def to_json
    ds_user.to_json
  end
end
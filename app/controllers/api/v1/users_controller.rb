class Api::V1::UsersController < Api::V1::BaseController
  def show
  end

  def index
    respond_to do |format|
      if params[:LoginName] && params[:LoginName] == 'bar'
        user_data_set = UserDataSet.new
        bar = User.new({
                               'usr_Id'=>65,
                               'usr_LoginName'=>'bar',
                               'usr_FirstName'=>'Bar',
                               'usr_LastName'=>'Doe',
                               'usr_Initials'=>'BD'
                           })
        user_data_set.tt_User << bar.to_hash
        format.json { render json: user_data_set.to_json }
      else
        format.json { render json: 'Error', status: :unauthorized }
      end
    end
  end
end
class Api::V1::BaseController  < ActionController::Base
  http_basic_authenticate_with name: 'bar', password: 'foo'
  respond_to :json
end
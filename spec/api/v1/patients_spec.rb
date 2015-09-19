require "rails_helper"

describe 'api/v1/patients', :type => :api do
  context 'requests /patients' do

    let(:url) { '/api/v1/patients' }
    let(:login) { basic_authorize 'bar', 'foo' }

    context 'authenticated' do
      it 'gets a patient with a specified id' do
        login
        get "#{url}/148.json"
        expect(last_response.status).to eq(200)
        response = JSON.parse(last_response.body)
        expect(response).not_to be_nil
        expect(response['dsPatients']).not_to be_nil
        expect(response['dsPatients']['tt_Person']).not_to be_nil
        expect(response['dsPatients']['tt_Person'].length).to eq(1)
      end

      it 'returns http status not found if the patient with specified id does not exist' do
        login
        get "#{url}/999.json"
        expect(last_response.status).to eq(404)
      end
    end

    context 'not authenticated' do
      it 'returns not authorized when you try to get a patient with a specified id' do
        get "#{url}/148.json"
        expect(last_response.status).to eq(401)
      end
    end
  end
end
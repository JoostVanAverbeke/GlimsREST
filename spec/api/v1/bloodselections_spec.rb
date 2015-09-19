require "rails_helper"

describe 'api/v1/bloodselections', :type => :api do

  let(:login) { basic_authorize 'bar', 'foo' }

  context 'requests bloodselections/patients' do

    let(:url) { '/api/v1/bloodselections/patients' }

    context 'authenticated' do
      it 'returns the list of patients having blood selections' do
        login
        get "#{url}.json"
        expect(last_response.status).to eq(200)
        response = JSON.parse(last_response.body)
        expect(response).not_to be_nil
        expect(response['dsPatients']).not_to be_nil
        expect(response['dsPatients']['tt_Person']).not_to be_nil
        expect(response['dsPatients']['tt_Person'].length).to eq(5)
      end
    end

    context 'not authenticated' do
      it 'returns status not authorized' do
        get "#{url}.json"
        expect(last_response.status).to eq(401)
      end
    end
  end

  context 'requests patients/:patient_id/bloodselections' do

    let(:url) {'/api/v1/patients/12/bloodselections'}

    context 'authenticated' do
     it 'returns the blood selections of patient with object id 12' do
        login
        get "#{url}.json"
        expect(last_response.status).to eq(200)
        response = JSON.parse(last_response.body)
        expect(response).not_to be_nil
        expect(response['dsBloodselections']).not_to be_nil
        expect(response['dsBloodselections']['tt_BloodSelection']).not_to be_nil
        expect(response['dsBloodselections']['tt_BloodSelection'].length).to eq(5)
      end

      it 'returns http status not found if the patient with specified id does not exist' do
        login
        url = '/api/v1/patients/202/bloodselections'
        get "#{url}.json"
        expect(last_response.status).to eq(404)
      end
    end

    context 'not authenticated' do
      it 'returns status not authorized' do
        get "#{url}.json"
        expect(last_response.status).to eq(401)
      end
    end

  end

  context 'requests patients/:patient_id/bloodselections/:id' do

    let(:url)  {'/api/v1/patients/12/bloodselections/2' }

    context 'authenticated' do
      it 'returns the blood selection with id 2 of patient with object id 12' do
        login
        get "#{url}.json"
        expect(last_response.status).to eq(200)
        response = JSON.parse(last_response.body)
        expect(response).not_to be_nil
        expect(response['dsBloodselections']).not_to be_nil
        expect(response['dsBloodselections']['tt_BloodSelection']).not_to be_nil
        expect(response['dsBloodselections']['tt_BloodSelection'].length).to eq(1)
      end
      it 'returns http status not found if the patient with specified id does not exist' do
        login
        url = '/api/v1/patients/202/bloodselections/1'
        get "#{url}.json"
        expect(last_response.status).to eq(404)
      end
    end

    context 'not authenticated' do
      it 'returns status not authorized' do
        get "#{url}.json"
        expect(last_response.status).to eq(401)
      end
    end
  end
end
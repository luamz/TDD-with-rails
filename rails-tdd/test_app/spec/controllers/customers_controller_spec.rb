require 'rails_helper'

RSpec.describe CustomersController, type: :controller do

  describe 'as Guest' do
    context '#index' do
      it 'responds successfully' do
        get :index
        expect(response).to be_success
      end

      it 'responds a 200 response' do
        get :index
        expect(response).to have_http_status(200)
      end
    end

    it 'responds a 302 response (not authorized)' do
      customer = create(:customer)
      get :show, params: { id: customer.id }
      expect(response).to have_http_status(302)
    end
  end

  describe 'as Logged Member' do
    before do
        @member = create(:member)
        @customer = create(:customer)
    end

    it 'route' do
        is_expected.to route(:get,'/customers').to(action: :index)
    end


    it 'content_type' do
        customer_params = attributes_for(:customer)
        sign_in @member
        get :show, format: :json, params:{id: @customer.id}
        post :create, params:{customer: customer_params}
        expect(response.content_type).to eq('application/json')
    end

    it 'flash_notice works' do
        customer_params = attributes_for(:customer)
        sign_in @member
        post :create, params:{customer: customer_params}
        expect(flash[:notice]).to match(/successfully created/)
    end

    it 'trying to add customer with valid attributes' do
        customer_params = attributes_for(:customer)
        sign_in @member
        expect{post :create, params:{customer: customer_params}}.to change(Customer, :count).by(1)
    end

    it 'trying to add customer with invalid attributes' do
        customer_params = attributes_for(:customer, address:nil)
        sign_in @member
        expect{post :create, params:{customer: customer_params}}
        .not_to change(Customer, :count)
    end

    it 'responds a 200 response' do
      sign_in @member
      get :show, params: { id: @customer.id }
      expect(response).to have_http_status(200)
    end

    it 'render a :show template' do
      sign_in @member
      get :show, params: { id: @customer.id }
      expect(response).to render_template(:show)
    end
  end
end
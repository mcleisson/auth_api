require "rails_helper"

RSpec.describe "Sessão", :type => :request do
    before(:each) do
        @user =  FactoryBot.create(:user) 
        @sign_in_url = '/api/v1/auth/sign_in' 
        @sign_out_url = '/api/v1/auth/sign_out'
        @login_params = {
            email: @user.email,
            password: @user.password
        }
    end

    describe 'POST /api/v1/auth/sign_in' do
        context 'parâmetros de login válidos' do
            before do
                post @sign_in_url, params: @login_params, as: :json
            end
            
            it 'retorna status 200' do
                expect(response).to have_http_status(200)
            end
            
            it 'retorna token de acesso no cabeçalho de autenticação' do
                expect(response.headers['access-token']).to be_present
            end
            
            it 'retorna o usuário no cabeçalho de autenticação' do
                expect(response.headers['client']).to be_present
            end
            
            it 'retorna expiração no cabeçalho de autenticação' do
                expect(response.headers['expiry']).to be_present
            end
            
            it 'retorna uid no cabeçalho de autenticação' do
                expect(response.headers['uid']).to be_present
            end
        end
            
            context 'parâmetros de login inválidos' do
            before { post @sign_in_url }
            
            it 'retorna o status não autorizado 401' do
                expect(response.status).to eq 401
            end
        end
    end
    
    
    describe 'DELETE /api/v1/auth/sign_out' do
   
    before do
      #login @user created in the beore block in outer describe block
      post @sign_in_url, params: @login_params, as: :json
      @headers = {
        'uid' => response.headers['uid'],
        'client' => response.headers['client'],
        'access-token' => response.headers['access-token']
      }
    end
    
    it 'retorna status 200' do
      delete @sign_out_url, headers: @headers
      expect(response).to have_http_status(200)
    end
    
  end
end
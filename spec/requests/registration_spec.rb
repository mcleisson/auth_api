require "rails_helper"
RSpec.describe "Cadastro", :type => :request do
    before(:each) do
        @sign_up_url = '/api/v1/auth/' 
        @signup_params = {
            email: 'user@example.com',
            password: '12345678',
            password_confirmation: '12345678'
        }
    end

  describe 'Método de registro de e-mail' do
    describe 'POST /api/v1/auth/' do
        context 'parâmetros de inscrição válidos' do
            before do
            post @sign_up_url, params: @signup_params
            end

            it 'retorna status 200' do
            expect(response).to have_http_status(200)
            end
            
            it 'retorna cabeçalho de autenticação com atributos corretos' do
            expect(response.headers['access-token']).to be_present
            end
            
            it 'retorna o usuário no cabeçalho de autenticação' do
            expect(response.headers['user']).to be_present
            end
            
            it 'retorna expiração no cabeçalho de autenticação' do
            expect(response.headers['expiry']).to be_present
            end
            
            it 'retorna uid no cabeçalho de autenticação' do
            expect(response.headers['uid']).to be_present
            end
            
            it 'retorna o status de sucesso' do
            parsed_response = JSON.parse(response.body)
            expect(parsed_response['status']).to eq('success')
            end
            
            it 'Criação de novo Usuário' do
            expect{
                post @sign_up_url, params: @signup_params.merge({email: "test@example.com"})
            }.to change(User, :count).by(1)
        end
        end
        
        context 'parâmetros de inscrição inválidos' do
            before { post @sign_up_url }
                it 'retorna entidade não processável 422' do
                expect(response.status).to eq 422
                end
            end
        end
    end
end
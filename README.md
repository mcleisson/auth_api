# README
![GitHub repo size](https://img.shields.io/github/repo-size/iuricode/README-template?style=for-the-badge)
![GitHub language count](https://img.shields.io/github/languages/count/iuricode/README-template?style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/iuricode/README-template?style=for-the-badge)


    Versão do Ruby: 2.6.5
    Versão do Rails: 6.0.3.4
    Versão do PostgreSQL: 10.15

    GEM's Usadas:

    devise_token_auth (gem para autenticação de usuários com token)

    rack-cors (gem utilizada para permitir chamadas em AJAX)

    gem pry-rails (gem utilizada para testes)

    rspec-core rspec-rails rspec-expectations rspec-mocks rspec-support` (gems utilizadas para escrever
     testes da aplicação)

    factory_bot_rails (gem utilizada para gerar factories)

    faker (gem utilizada para gerar dados aleatórios para os testes TDD)

# Como Rodar o este projeto

1 - Faça o download via comando git clone.

2 - Abra o projeto em seu editor de código preferido e abra o arquivo database.yml que está no diretório /config. Altere com as informações de seu banco de dados (user, password, host), salve o arquivo.

3 - Via linha acesse o proejeto, e execute os seguintes comandos:

`bundle install` (irá instalar as gems do projeto);

`rails db:create` (se estiver com as informações corretas de banco de dados, irá criar as bases de dados);

`rails db:migrate` (irá criar as tabelas na base de dados);

`rails db:seed` (irá popular a tabela users com 2 usuários);

`rails s` (irá executar o servidor). Caso ocorra tudo bem irá aparecer a seguinte mensagem:

=> Booting Puma<br>
=> Rails 6.0.3.4 application starting in development<br>
=> Run `rails server --help` for more startup options<br>
Puma starting in single mode...<br>

Version 4.3.6 (ruby 2.6.5-p114), codename: Mysterious Traveller<br>
Min threads: 5, max threads: 5<br>
Environment: development<br>
Listening on tcp://127.0.0.1:3000<br>
Listening on tcp://[::1]:3000<br>
Use Ctrl-C to stop<br>

Para verificar se está sendo executado corretamente acesse via navegador http://localhost:3000 onde irá aparecer uma pagina do Rails com a versão do Ruby e a Versão do Rails.

# Verificando a Autenticação:

Para testarmos a aplicação deverá ser utilizado algum programa/plugin para requisições API.
Os testes foram efetuados com o programa POSTMAN. Abaixo estão os endereços para utilização:

http://localhost:3000/api/v1/auth/ (utilizado para registrar novo usuário). Deve ser passado os parâmetros email, password e password_confirmation na opção body > x-www-form-urlencoded. O JSON de retorno que deverá aparecer é:

    {
    "status": "success",
        "data": {
            "uid": "teste2@teste.com",
            "id": 3,
            "email": "teste2@teste.com",
            "provider": "email",
            "allow_password_change": false,
            "first_name": null,
            "last_name": null,
            "role": null,
            "created_at": "2020-11-26T00:49:23.325Z",
            "updated_at": "2020-11-26T00:49:23.738Z"
        }
    }

http://localhost/api/vi/auth/sign_in (utlizado para logar). Deve ser passado o usuário e senha para logar na opção body > form-data e inserir
os atributos email e password. O JSON de retorno que deverá aparecer é:

    {
        "data": {
            "id": 1,
            "email": "teste@teste.com",
            "provider": "email",
            "uid": "teste@teste.com",
            "allow_password_change": false,
            "first_name": "Marcel",
            "last_name": "Pereira",
            "role": "user"
        }
    }

http://localhost:3000/api/v1/users (Lista os usuários cadastrados). Ainda não foi implementado a autenticação para listar apenas o próprio usuário. O JSON de retorno que deverá aparecer é:

    [
        {
            "id": 1,
            "provider": "email",
            "uid": "teste2@teste.com",
            "allow_password_change": false,
            "first_name": null,
            "last_name": null,
            "email": "teste2@teste.com",
            "role": null,
            "created_at": "2020-11-26T01:21:11.578Z",
            "updated_at": "2020-11-26T01:21:11.893Z"
        }
    ]

# Executando testes RSpec

Para executar o teste rspec, via linha de comando, acesse o diretório do projeto e execute o comando:

`rspec -f d`

Este comando irá executar todos os testes nos diretórios factories, requests e support que estão localizados na pasta spec dentro da pasta config.
O Retorno deste comando se tudo ocorrer corretamente é:

<pre>Cadastro
  Método de registro de e-mail
    POST /api/v1/auth/
      parâmetros de inscrição válidos
<font color="#4E9A06">        retorna status 200</font>
<font color="#4E9A06">        retorna cabeçalho de autenticação com atributos corretos</font>
<font color="#4E9A06">        retorna o usuário no cabeçalho de autenticação</font>
<font color="#4E9A06">        retorna expiração no cabeçalho de autenticação</font>
<font color="#4E9A06">        retorna uid no cabeçalho de autenticação</font>
<font color="#4E9A06">        retorna o status de sucesso</font>
<font color="#4E9A06">        Criação de novo Usuário</font>
      parâmetros de inscrição inválidos
<font color="#4E9A06">        retorna entidade não processável 422</font>

Sessão
  POST /api/v1/auth/sign_in
    parâmetros de login válidos
<font color="#4E9A06">      retorna status 200</font>
<font color="#4E9A06">      retorna token de acesso no cabeçalho de autenticação</font>
<font color="#4E9A06">      retorna o usuário no cabeçalho de autenticação</font>
<font color="#4E9A06">      retorna expiração no cabeçalho de autenticação</font>
<font color="#4E9A06">      retorna uid no cabeçalho de autenticação</font>
    parâmetros de login inválidos
<font color="#4E9A06">      retorna o status não autorizado 401</font>
  DELETE /api/v1/auth/sign_out
<font color="#4E9A06">    retorna status 200</font>

Finished in 9.95 seconds (files took 11.24 seconds to load)
<font color="#4E9A06">15 examples, 0 failures</font>
</pre>

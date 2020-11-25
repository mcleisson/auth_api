# README

Versão do Ruby: 2.6.5
Versão do Rails: 6.0.3.4
Versão do PostgreSQL: 10.15

Como Rodar o este projeto

1 - Faça o download via comando git clone.

2 - Abra o projeto em seu editor de código preferido e abra o arquivo database.yml que está no diretório /config. Altere com as informações de seu banco de dados (user, password, host), salve o arquivo.

3 - Via linha acesse o proejeto, e execute os seguintes comandos:

`bundle install` (irá instalar as gems do projeto)
`rails db:create` (se estiver com as informações corretas de banco de dados, irá criar as bases de dados);
`rails db:migrate` (irá criar as tabelas na base de dados)
`rails db:seed` (irá popular a tabela users com 2 usuários)
`rails s` (irá executar o servidor). Caso ocorra tudo bem irá aparecer a seguinte mensagem:

=> Booting Puma
=> Rails 6.0.3.4 application starting in development
=> Run `rails server --help` for more startup options
Puma starting in single mode...

- Version 4.3.6 (ruby 2.6.5-p114), codename: Mysterious Traveller
- Min threads: 5, max threads: 5
- Environment: development
- Listening on tcp://127.0.0.1:3000
- Listening on tcp://[::1]:3000
  Use Ctrl-C to stop

Para verificar se está sendo executado corretamente acesse via navegador http://localhost:3000 onde irá aparecer uma pagina do Rails com a versão do Ruby e a Versão do Rails

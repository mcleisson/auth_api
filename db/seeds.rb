# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Cria registro na tabela Users
User.create first_name: 'Marcel', last_name: 'Pereira', email: 'teste1@teste.com', password: 123456, role: 'user'
User.create first_name: 'Maikel', last_name: 'Bald', email: 'maikel@ruptiva.com', password: 'ilikeruptiva', role: 'admin'
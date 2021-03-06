# Encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# API keys
Setting['facebook.key']     = 'key'
Setting['facebook.secret']  = 'secret'
Setting['twitter.key']      = 'key'
Setting['twitter.secret']   = 'secret'

User.create(name: 'Test USER',
            email: 'test@example.com',
            password: 'password',
            password_confirmation: 'password',
            gender: 'Masculino',
            document_number: 123456789)

Category.create([
  { name: 'Doação de sangue' },
  { name: 'Alimentos' },
  { name: 'Roupas'},
  { name: 'Apoio psiquiátrico' }])


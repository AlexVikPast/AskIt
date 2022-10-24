# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# AskIt
## 1 урок. http://127.0.0.1:3000/?name=Alex

## 2 урок.
### rails db:create
### rails g model Question title:string body:text
### rails db:migrate
### rails c
#### q = Question.new
#### q = Question.new title: "My first question", body: "sample"
#### q.save

## 4 урок.
### yarn add bootstrap
### yarn upgrade

## 5 урок.
### rails g model Answer body:text question:belongs_to
### q = Question.first
### a = q.answers.build body: "My"
### http://127.0.0.1:3000/rails/info/routes - просмотр всех роутингов

## 8 урок.
### rails c
### u = User.new email: "mail@mail.ru", password: "123", password_confirmation: "123"
### u.save
### u.authenticate "123" ---> User. Пускает в систему если пароль верен

## 9 урок.
### rails g migration add_missing_null_checks

## 11 урок.
### add gem 'rubyzip'
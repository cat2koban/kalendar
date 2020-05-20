# Kalendar
kalendar is like a Google calendar.

## Technology stacks
- Ruby 2.6.2
- Rails 6.0.2.2
- MySQL 14.14
- Webpacker 4.2.2
- Vue.js 2.6.11
- bulma 0.8.2
- buefy 0.8.18

## Setup
### 1. Install Ruby / Bunlder

### 2. Install MySQL

### 3. Set your environment variables to database configure file
https://github.com/cat2koban/kalendar/blob/master/config/database.yml

I using [direnv](https://github.com/direnv/direnv) for manage environment variables. 

```yml
development:
  <<: *default
  adapter: mysql2
  encofing: utf8mb4
  database: kalendar_development
  pool: 5
  username: <%= ENV["DEVELOPMENT_MYSQL_USERNAME"]%>
  password: <%= ENV["DEVELOPMENT_MYSQL_PASSWORD"]%>
  host: localhost

test:
  <<: *default
  adapter: mysql2
  encofing: utf8mb4
  database: kalendar_test
  pool: 5
  username: <%= ENV["TEST_MYSQL_USERNAME"]%>
  password: <%= ENV["TEST_MYSQL_PASSWORD"]%>
  host: localhost
```

### 4. Run bundle installation

I using [rbenv](https://github.com/rbenv/rbenv) for manage ruby versions.

```
$ bundle install
$ bundle exec rails db:migrate
$ bundle exec 
```

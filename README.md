# Kalendar
kalendar is like a Google calendar.

## Technology stacks
- Ruby 2.6.2
- Rails 6.0.2.2
- MySQL 5.7
- Webpacker 4.2.2
- Simple Calendar 2.3.0
- Vue.js 2.6.11
- bulma 0.8.2
- buefy 0.8.18

## Setup
### Install Ruby / Bunlder

I using [rbenv](https://github.com/rbenv/rbenv) for manage ruby versions.

### Install MySQL

https://qiita.com/hkusu/items/cda3e8461e7a46ecf25d

### Set your environment variables to database configure file

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

### Bundle installation

```zsh
$ bundle install
$ bundle exec rails db:migrate
```

### Build webpack

```zsh
$ bin/webpack
```

### Run rails server

```zsh
$ bundle exec rails server
```

## Contribute

1. Fork ([https://github.com/cat2koban/kalendar/fork](https://github.com/cat2koban/kalendar/fork))
2. Create a feature branch
3. Commit your changes
4. Rebase your local changes against the master branch
5. Run test suite with the `bundle exec rspec` command and confirm that it passes
6. Run `bundle exec rubocop -a`
7. Create new Pull Request


## Author
[cat2koban](https://github.com/cat2koban/)

[![Build Status](https://travis-ci.org/onigra/pundit_sample.svg?branch=travis)](https://travis-ci.org/onigra/pundit_sample) [![Coverage Status](https://coveralls.io/repos/onigra/pundit_sample/badge.png?branch=travis)](https://coveralls.io/r/onigra/pundit_sample?branch=travis) [![Code Climate](https://codeclimate.com/github/onigra/pundit_sample.png)](https://codeclimate.com/github/onigra/pundit_sample)

# setup

```sh
git clone https://github.com/onigra/pundit_sample.git
cd pundit_sample
bundle install

bin/rake db:create
bin/rake db:migrate
bin/rake db:seed_fu
bin/rails s
```

# テストアカウント

詳細は[こちら](https://github.com/onigra/pundit_sample/blob/master/db/fixtures/sample_data.rb)

|email|password|権限|
|:---:|:------:|:--:|
|admin@example.com|adminadmin|管理者|
|user@example.com|useruser|usersのCRUDが可能|
|role@example.com|rolerole|rolesのCRUDが可能|
|view@example.com|viewview|usersの閲覧のみ可能|


[![Build Status](https://travis-ci.org/onigra/pundit_sample.svg?branch=travis)](https://travis-ci.org/onigra/pundit_sample) [![Coverage Status](https://coveralls.io/repos/onigra/pundit_sample/badge.png?branch=travis)](https://coveralls.io/r/onigra/pundit_sample?branch=travis) [![Code Climate](https://codeclimate.com/github/onigra/pundit_sample.png)](https://codeclimate.com/github/onigra/pundit_sample)

# 環境

* Ruby 2.1.2
* Rails 4.1.1

## Requirements

* MySQL

# Setup

```sh
$ git clone https://github.com/onigra/pundit_sample.git
$ cd pundit_sample
$ bundle install

$ bundle exec db:create
$ bundle exec db:migrate
$ bundle exec db:seed_fu
$ bundle exec s
```

# テストアカウント

詳細は[こちら](https://github.com/onigra/pundit_sample/blob/master/db/fixtures/sample_data.rb)

|email|password|権限|
|:---:|:------:|:--|
|admin@example.com|adminadmin|全ての操作が可能|
|user@example.com|useruser|Userのindex, show, create, update, destroyが可能。 <br> Role(権限)に対しての操作は一切行えない|
|role@example.com|rolerole|Role(権限)のindex, show, create, update, destroyが可能。 <br> Userに対しての操作は一切行えない|
|view@example.com|viewview|User、Roleの閲覧(index, show)のみ可能。 <br> 新規作成、更新、削除は行えない|


# Misokaze

Misokaze is script for twitter bot. 

## Requirements

* Ruby-2.2.2
* Bundler

## Usage

```
git clone git@github.com:fktan5/Misokaze.git
cd Misokaze
bundle install
```

1. .authfileに認証用のキー等を追記
2. tweets.txtにつぶやく内容を書く。（1line 1tweet）

### Execution
`ruby main.rb .authfile tweets.txt`

* 現状：Cronで回してる

* トークン取得の際これ使うと楽 : [get-twitter-oauth-token](https://rubygems.org/gems/get-twitter-oauth-token/versions/1.1.0)
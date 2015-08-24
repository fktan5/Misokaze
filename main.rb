# rubydeTwit.rb
# ARGV[0] = textofAuth, ARGV[1] = textoftweets
require 'bundler'
Bundler.require

log = Logger.new("app.log")

#1 consumer key
#2 consumer secret
#3 Access token
#4 Access token secret
begin
	textfile = File.expand_path(ARGV[0], ".")
  puts textfile
  auth_file = File.read(textfile, :encoding => Encoding::UTF_8)
	twitfile = File.expand_path(ARGV[1], ".")
  twits = File.read(twitfile, :encoding => Encoding::UTF_8)
rescue => ex
  log.error("error nofile? : " + ex.to_s)
  return
end

if(twits == nil)
  log.error("No Words!")
else
  twit = twits.split[rand(twits.split.size)]
  twit = twit + " [auto]"
end

unless (auth_file == nil)
  auth_elms = auth_file.split
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = auth_elms[0]
    config.consumer_secret     = auth_elms[1]
    config.access_token        = auth_elms[2]
    config.access_token_secret = auth_elms[3]
  end
  begin
    client.update(twit)
  rescue Twitter::Error::Forbidden => ex
    log.error("while tweeting error:" + ex.to_s)
  rescue Twitter::Error => ex
    log.error("error:" + ex.to_s)
  rescue => ex
    log.error("error:" + ex.to_s)
  end
end

# _*_ encoding: utf-8 _*_

require "sinatra/base"
require "haml"
require "random_ipsum"

class FakeDict < Sinatra::Base
  get '/' do
    haml :index
  end

  get '/env' do
    env['SERVER_NAME']
  end

  get '/search/:word' do
    @word = params['word']
    @descript = RandomIpsum.sentence
    puts Time.now.to_s + ' ' + @word
    haml :search
  end

  get '/search' do
    @word = params['word']
    if @word.length.zero?
      @word = RandomIpsum.words(1)
    else
      @word = @word.gsub(/.,/,'')
    end
      redirect to ("http://#{@word}.dict.tagbible.net"), 303
  end

  not_found do
   "無此頁"
  end
end

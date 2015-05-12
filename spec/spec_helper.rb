require('sinatra/activerecord')
ENV['RACK_ENV'] = 'test'
require('rspec')
require('pg')
require('question')
require('survey')

RSpec.configure do |config|
  config.after(:each) do
    Question.all().each() do |question|
      question.destroy()
    end
    Survey.all().each() do |survey|
      survey.destroy()
    end
  end
end

require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/question')
require('./lib/survey')
require('pg')

get('/') do
  @surveys = Survey.all()
  erb(:index)
end

get('/designer') do
  @questions = Question.all()
  @surveys = Survey.all()
  erb(:designer)
end

get('/surveys') do
  @surveys = Survey.all()
  erb(:surveys)
end

get('/takers') do
end



get('/surveys/new') do
  @surveys = Survey.all()
  erb(:survey_form)
end

post('/surveys/new') do
  name = params.fetch('survey_name')
  survey = Survey.create({:name => name})
  @surveys = Survey.all()
  erb(:surveys)
end


 get('/surveys/:id') do
   id = params.fetch("id").to_i()
   @survey = Survey.find(id)
   @survey_questions = @survey.questions()
   erb(:survey)
 end

get('/questions') do
  @questions = Question.all()
  erb(:questions)
end

post('/questions/new') do
  name = params.fetch('question_name')
  question = Question.create({:name => name})
  @questions = Question.all()
  erb(:questions)
end

get('/questions/:id') do
  @questions = Question.all()
  @id = params.fetch('id').to_i()
  @question = Question.find(@id)
  @surveys = Survey.all()
  erb(:question_info)
end

patch('/questions/:id/update') do
  name = params.fetch('update_question_name')
  @id = params.fetch('id').to_i()
  question = Question.find(@id)
  question.update({:name => name})
  redirect('/questions/' + @id.to_s())
end

patch('/surveys/:id/add_question') do
  @id = params.fetch('id').to_i()
  @survey = Survey.find(@id)
  question_name = params.fetch('question_name')
  response_1 = params.fetch('response_1')
  response_2 = params.fetch('response_2')
  response_3 = params.fetch('response_3')
  response_4 = params.fetch('response_4')
  @survey.questions().create({:name => question_name, :response_1 => response_1, :response_2 => response_2, :response_3 => response_3, :response_4 => response_4})
  redirect('/surveys/' + @id.to_s())
end

delete('/surveys/:id') do
  @id = params.fetch('id').to_i()
  question_id = params.fetch('question_id').to_i()
  question = Question.find(question_id)
  question.update({:survey_id => nil})
  @questions = Question.all()
  redirect('/surveys/' + @id.to_s())
end

patch('/surveys/:id') do
  survey_id = params.fetch("id").to_i()
  @survey = Survey.find(survey_id)
  name = params.fetch("survey_name")
  @survey.update({:name => name})
  redirect('/surveys/' + survey_id.to_s())
end

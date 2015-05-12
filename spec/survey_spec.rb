require('spec_helper')
require('survey')
require('pg')
require('rspec')

describe Survey do

  describe('#capitalize') do
    it('capitalizes the name of the survey') do
      survey = Survey.create({:name => "test"})
      expect(survey.name()).to(eq("Test"))
    end
  end
end

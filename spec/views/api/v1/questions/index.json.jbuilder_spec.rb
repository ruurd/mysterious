require 'rails_helper'

RSpec.describe "api/v1/questions/index.json", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(description: 'meaning of foo', query: 'foo'),
      Question.create!(description: 'meaning of bar', query: 'bar')
    ])
  end

  it "renders a list of questions as json" do
    render options = {
               format: :json,
               file: 'api/v1/questions/index.json.jbuilder'
           }
  end
end

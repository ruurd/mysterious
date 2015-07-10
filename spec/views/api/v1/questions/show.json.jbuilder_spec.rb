require 'rails_helper'

RSpec.describe "api/v1/questions/show.json", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(description: 'meaning of foo', query: 'foo'))
  end

  it "renders json" do
    render options = {
               format: :json,
               file: 'api/v1/questions/show.json.jbuilder'
           }
  end
end

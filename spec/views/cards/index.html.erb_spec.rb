require 'rails_helper'

RSpec.describe "cards/index", type: :view do
  before(:each) do
    assign(:cards, [
      Card.create!(
        :content => "MyText"
      ),
      Card.create!(
        :content => "MyText"
      )
    ])
  end

  it "renders a list of cards" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

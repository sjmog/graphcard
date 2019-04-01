require 'rails_helper'

RSpec.describe "cards/index", type: :view do
  before(:each) do
    assign(:cards, [
      Card.create!(
        :word => "Word",
        :content => "MyText"
      ),
      Card.create!(
        :word => "Word",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of cards" do
    render
    assert_select "tr>td", :text => "Word".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

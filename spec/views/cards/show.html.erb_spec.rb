require 'rails_helper'

RSpec.describe "cards/show", type: :view do
  before(:each) do
    @card = assign(:card, Card.create!(
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end

require 'rails_helper'

RSpec.describe "cards/edit", type: :view do
  before(:each) do
    @card = assign(:card, Card.create!(
      :content => "MyText"
    ))
  end

  it "renders the edit card form" do
    render

    assert_select "form[action=?][method=?]", card_path(@card), "post" do
      assert_select "textarea[name=?]", "card[content]"
    end
  end
end

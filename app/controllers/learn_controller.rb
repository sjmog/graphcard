class LearnController < ApplicationController
  # GET /learn
  # GET /learn.json
  def current_repetition
    @cards = Card.in_current_repetition
    @card  = @cards.sample
  end

  # POST /learn/cards/:id
  def respace
    Card.find(params[:id]).respace(params["commit"])

    redirect_to learn_path
  end
end
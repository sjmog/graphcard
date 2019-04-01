class LearnController < ApplicationController
  # GET /learn
  # GET /learn.json
  def random
    @card = Card.random
  end
end
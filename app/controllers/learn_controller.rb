class LearnController < ApplicationController
  before_action :authenticate_user!, only: [:current_repetition, :respace]

  # GET /learn
  # GET /learn.json
  def current_repetition
    @cards = current_user.cards_due
    @card  = @cards.sample
  end

  # POST /learn/cards/:id
  def respace
    card = Card.find(params[:id])

    if !card.belongs_to?(current_user)
      format.html { redirect_to cards_path, notice: "That card doesn't belong to you." }
      format.json { render json: { notice: "That card doesn't belong to you." }, status: :unauthorized }
    end

    card.respace(params["commit"])

    redirect_to learn_path
  end
end
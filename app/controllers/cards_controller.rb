class CardsController < ApplicationController
	before_action :set_card, only: [:show, :edit, :update, :destroy]

	def index
		@cards = Card.all
		# @cards = Card.all.where(card_type: params[:card_type])
		respond_to do |format|
			format.html
			format.csv { send_data @cards.to_csv(['card_holder_name', 'card_number', 'cvv_number', 'valid_from', 'valid_upto', 'user_id', 'card_type', 'bank_name'])}
			format.json { render json: CardDatatable.new(params, view_context: view_context) }
		end
	end

	def import
		Card.import(params[:file])
		redirect_to cards_path, notice: "Cards imported"
	end

	def show
		@card = Card.find(params[:id])
	end

	def new
		@card = Card.new
	end

	def edit
		@card = Card.find(params[:id])
	end

	def create
		@card = Card.new(card_params)
		@card.save
		CrudNotificationMailer.create_notification(@card).deliver_now
		redirect_to cards_path
	end

	def update
		@card = Card.find(params[:id])
		@card.update(card_params)
		CrudNotificationMailer.update_notification(@card).deliver_now
		redirect_to cards_path
	end

	def destroy
		@card = Card.find(params[:id])
		CrudNotificationMailer.delete_notification(@card).deliver_now
		@card.destroy
		redirect_to cards_path
	end

	private
	  def set_card
      @card = Card.find(params[:id])
    end

		def card_params
	    params.require(:card).permit(:card_holder_name, :card_number, :cvv_number, :valid_from, :valid_upto, :user_id, :card_type, :bank_name).merge(user: current_user)
	  end
end
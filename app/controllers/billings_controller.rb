class BillingsController < ApplicationController
	before_action :set_billing, only: [:show, :edit, :update, :destroy]

	def index
		@billings = Billing.all
	end

	def show
		@billing = Billing.find(params[:id])
	end

	def new
	@billing = Billing.new
	end

	def edit
		@billing = Billing.find(params[:id])
	end

	def create
		@billing = Billing.find(params[:id])
		@billing.save
		redirect_to billings_path
	end

	def update
		@billing = Billing.find(params[:id])
	end

	def destroy
		@billing.destroy
	end

	private
		def set_billing
			@billing = Billing.find(params[:id])
		end
end

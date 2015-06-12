class AdvicesController < ApplicationController

	def index
		# If url does not match advice
	  	if request.path != advice_index_path
	      	redirect_to advice_index_path, status: :moved_permanently
	  	end
	end

	def show
		@advice = Advice.find(params[:id])

		# If url does not match advice
	  	if request.path != advice_show_path(@advice)
	      	redirect_to advice_show_path(@advice), status: :moved_permanently
	  	end

	end

	def random_advice
		@random = Advice.where(live: true).where.not(id: params[:advice_id].to_i).order('RANDOM()').limit(1).first
	    if @random  
	      redirect_to advice_path(@random)
	    else 
	      redirect_to :back and return
	    end
  	end

end

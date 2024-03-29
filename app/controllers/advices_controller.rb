class AdvicesController < ApplicationController

	def index
		@advices = Advice.where(live: true).order(vote_total: :desc)

		@alltime = Advice.where(live: true).order(vote_total: :desc)
		@last7 = Advice.where(live: true).order(vote_total: :desc).where("created_at >= ?", 1.week.ago)
		@last24 = Advice.where(live: true).order(vote_total: :desc).where("created_at >= ?", 1.day.ago)


		# If url does not match index
	  	if request.path != advice_index_path
	      	redirect_to advice_index_path, status: :moved_permanently
	  	end
	end

	def show
		@advice = Advice.find(params[:id])

		# If url does not match advice
	  	if request.path != advice_show_path(@advice)
	      	redirect_to advice_show_path(@advice)
	  	end
	end

	def create
	    @new_advice = Advice.create(advice_params)
	    if @new_advice.save
	      session[:submission] = "true" 
	      redirect_to advice_show_path(@new_advice)
	    else
	      render root_url, alert: "Error"
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

  	def upvote
		@advice = Advice.find(params[:id])
		@advice.update_attributes(vote_up: @advice.vote_up + 1)
		@advice.update_attributes(vote_total: @advice.vote_total + 1)
		redirect_to @advice
	end

	def downvote
		@advice = Advice.find(params[:id])
		@advice.update_attributes(vote_down: @advice.vote_down + 1)
		@advice.update_attributes(vote_total: @advice.vote_total - 1)
		redirect_to @advice
	end

  	private

	def advice_params
		params.require(:advice).permit(:body, :live, :twitter_handle, :vote_up, :vote_down, :vote_total)
	end

end

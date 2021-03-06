class CompanyrolesController < ApplicationController
	
	add_breadcrumb "Inicio", :root_path

	def index_emprered
		num_page = 20
		if params[:search]
	      if params[:order]
	        if params[:order] == 'sector_id'
	          @companies = Company.joins(:sector).search(params[:search]).order(" name DESC").paginate(:page => params[:page], :per_page => num_page)
	        else
	          @companies = Company.search(params[:search]).order("? DESC",params[:order]).paginate(:page => params[:page], :per_page => num_page)
	        end
	      else
	        @companies = Company.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => num_page)
	      end
	    else
	      if params[:order]
	        if params[:order] == 'sector_id'
	          
	          @companies = Company.joins(:sector).order(" name DESC").paginate(:page => params[:page], :per_page => num_page)
	        else
	          @companies = Company.all.order("? DESC",params[:order]).paginate(:page => params[:page], :per_page => num_page)
	        end
	      else
	        @companies = Company.all.paginate(:page => params[:page], :per_page => num_page)
	      end
	    end
	end

	def index_agenteae
		num_page = 20
		if params[:search]
	      if params[:order]
	        if params[:order] == 'sector_id'
	          @companies = Company.joins(:sector).search(params[:search]).order(" name DESC").paginate(:page => params[:page], :per_page => num_page)
	        else
	          @companies = Company.search(params[:search]).order("? DESC",params[:order]).paginate(:page => params[:page], :per_page => num_page)
	        end
	      else
	        @companies = Company.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => num_page)
	      end
	    else
	      if params[:order]
	        if params[:order] == 'sector_id'
	          
	          @companies = Company.joins(:sector).order(" name DESC").paginate(:page => params[:page], :per_page => num_page)
	        else
	          @companies = Company.all.order("? DESC",params[:order]).paginate(:page => params[:page], :per_page => num_page)
	        end
	      else
	        @companies = Company.all.paginate(:page => params[:page], :per_page => num_page)
	      end
	    end
	end

	def show_reply_company
		@company = Company.find(params[:id])
		if @company.user_login
			@replies = Reply.where("user_id = ?", @company.user_login.id)
			if @replies.length > 0
				redirect_to survey_reply_path(survey_id:@replies[0].survey, id: @replies[0])
			else
				redirect_to root_path
			end
		end
	end

	def results_company
	
	end

	def show_reply
	    @user = current_user
	    #redirect_to root_path
		@replies = Reply.where("user_id = ?", @user.id)
		if @replies.length > 0
		  redirect_to survey_reply_path(survey_id:@replies[0].survey, id: @replies[0])
		else
			@survey = Survey.first
		  	unless @survey
		  		redirect_to root_path
		  	else
		  		@companies = Company.where("user_login_id = ?", @user.id)
				if @companies.length > 0
					@company = @companies[0]
					@company.state = 'Progreso'
					@company.stage = 'Diagnóstico'
					t_start =Time.now
				    t_end = t_start + 345600
					@company.date_start = t_start
					@company.date_end = t_end
					@company.save
		      	end
		  		redirect_to new_survey_reply_path(survey_id:@survey)
		  	end
		end
	    
	    #@company = @user.companies.build(company_params)
  end

end

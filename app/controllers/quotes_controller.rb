class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Could not save</strong>. The data you entered is invalid.'
    end
    redirect_to root_path
  end

  def about
  end

  def show
    # Get the first quote where the id is the value the user is looking for
    @quote = Quote.where(:id => params[:id]).first
    # Display an error message of "Not found" if a user navigates to a show page for a quote that doesn't exist.
    if @quote.blank?
      render :text => "Not found", :status => :not_found
    end
  end

  private
  def quote_params
    params.require(:quote).permit(:saying, :author)
  end
end

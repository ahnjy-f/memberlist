class SearchesController < ApplicationController
  def result
      @searches = (params[:last_name]).where('created_at >= :years_ago', :years_ago => Time.now-1.years).where("last_name LIKE ?", "%#{params[:search_text]}%")
  end
end

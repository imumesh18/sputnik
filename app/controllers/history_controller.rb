class HistoryController < ApplicationController
  def index
  	@all_record = History.all.order(:updated_at)#_by(:admin_id => session[:admin_id], :status => "Rejected")
  #	@accepted_record = History.all#find_by(:admin_id => session[:admin_id], :status => "Accepted")
   p @all_record
  end
end

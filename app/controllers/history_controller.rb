class HistoryController < ApplicationController
  def index
  	@all_record = History.all.order(:updated_at)
   	p @all_record
  end
end

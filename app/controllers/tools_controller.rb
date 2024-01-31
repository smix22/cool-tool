class ToolsController < ApplicationController

  def index
    if params[:search]
      @search = Tool.where("lower(name) like ?", "%#{params[:search].downcase}%")
                .or(Tool.where("lower(category) like ?", "%#{params[:search].downcase}%"))
      if @search.blank?
        @message = "No results for \"#{params[:search]}\". Please run a new search."
      else
        @tools = @search
      end
    end
  end

  def show
    @tool = Tool.find(params[:id])
  end
end

class ToolsController < ApplicationController

  def index
    if params[:search]
      @keyword = params[:search].strip
      @search = Tool.where("lower(name) like ?", "%#{@keyword.downcase}%")
                .or(Tool.where("lower(category) like ?", "%#{@keyword.downcase}%"))
      if @search.blank?
        @message = "No results for \"#{@keyword}\". Please run a new search."
      elsif @keyword == ""
        @message = ""
      else
        @tools = @search
      end
    end
  end

  def show
    @tool = Tool.find(params[:id])
  end
end

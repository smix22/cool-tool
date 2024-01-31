class ToolsController < ApplicationController

  def index
    if params[:search]
      @search = Tool.where("lower(name) like ?", "%#{params[:search].downcase}%")
                .or(Tool.where("lower(category) like ?", "%#{params[:search].downcase}%"))
    end
    if @search.blank?
      @tools = Tool.all
    else
      @tools = @search
    end
  end

  def show
    @tool = Tool.find(params[:id])
  end
end

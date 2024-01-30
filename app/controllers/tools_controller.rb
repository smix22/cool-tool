class ToolsController < ApplicationController

  def index
    @tools = Tool.all
  end

  def search
    @search = Tool.find_by(name: params[:search])
  end
  
  def show
    @tool = Tool.find(params[:id])
  end
end

class ToolsController < ApplicationController

  def index
    if params[:search]
      @keyword = params[:search].strip
      @search = Tool.where("lower(name) like ?", "%#{@keyword.downcase}%")
                .or(Tool.where("lower(category) like ?", "%#{@keyword.downcase}%"))
      if @search.blank?
        @message = "No results for \"#{@keyword}\". Please run a new search."
      elsif @keyword == ""
        @message = "You did not enter anything. Please run a new search."
      else
        @tools = @search
      end
    else
      @tools = Tool.all
    end
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tools = Tool.where(user_id: 2)
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = User.find(2)
    if @tool.save
      redirect_to tool_path(@tool)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @tool = Tool.find(params[:id])
    
    if @tool.destroy
      redirect_to tools_path, status: :see_other
    else
      render :index, status: :unprocessable_entity
    end
  end
  
  private

  def tool_params
    params.require(:tool).permit(:name, :details, :category, :location, :photo, :user_id)
  end
end

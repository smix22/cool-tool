class ToolsController < ApplicationController

  def index
    if params[:search_key] or params[:search_loc]
      @keyword = params[:search_key].strip
      @location = params[:search_loc].strip
      if @location.blank?
        @search_loc = Tool.all
      else
        @search_loc = Tool.where("lower(location) like ?", "%#{@location.downcase}%")
      end
      if @keyword.blank?
        @search = @search_loc
      else
        @search = @search_loc.where("lower(name) like ?", "%#{@keyword.downcase}%")
                  .or(@search_loc.where("lower(category) like ?", "%#{@keyword.downcase}%"))
      end
      if @search.blank?
        @message = "No results. Please run a new search."
      else
        @tools = @search
      end
    else
      @tools = Tool.all
    end
  end

  def show
    @tool = Tool.find(params[:id])
    @booking = Booking.new
  end

  def new
    @tools = Tool.where(user_id: 2).order(created_at: :desc)
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = User.find(2)
    if @tool.save
      redirect_to tool_path(@tool)
      @message = "You created this tool successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    @tool.update(tool_params)
    redirect_to tool_path(@tool)
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

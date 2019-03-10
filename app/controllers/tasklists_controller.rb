class TasklistsController < ApplicationController
  def index
      @tasklists = Task.all
  end

  def show
      @tasklist = Task.find(params[:id])
  end

  def new
      @tasklist = Task.new
  end

  def create
    @tasklist = Task.new(tasklist_params)

    if @tasklist.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to @message
    else
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
    end      
  end

  def edit
      @tasklist = Task.find(params[:id])
  end

  def update
    @tasklist = Task.find(params[:id])

    if @tasklist.update(tasklist_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @tasklist
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @tasklist = Task.find(params[:id])
    @tasklist.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to tasklists_url

  end    
    
    
  private

  # Strong Parameter
  def tasklist_params
    params.require(:tasklist).permit(:content)
  end    
    
end

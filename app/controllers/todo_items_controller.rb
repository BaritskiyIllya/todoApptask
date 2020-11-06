class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, except: [:create]#only: [:show, :edit, :update, :destroy]

  # GET todo_lists/1/todo_items
  def index
    @todo_items = @todo_list.todo_items
  end

  # GET todo_lists/1/todo_items/1
  def show
  end

  # GET todo_lists/1/todo_items/new
  def new
    @todo_item = @todo_list.todo_items.build
  end

  # GET todo_lists/1/todo_items/1/edit
  def edit
  end

  def completed

    if @todo_item.completed == false
      @todo_item.update_attributes(completed: true)
    else
      @todo_item.update_attributes(completed: false)
    end
    redirect_to(@todo_item.todo_list)
  end
  # POST todo_lists/1/todo_items
  def create
    @todo_item = @todo_list.todo_items.build(todo_item_params)

    if @todo_item.save
      redirect_to(@todo_item.todo_list)
    else
      render action: 'new'
    end
  end

  # PUT todo_lists/1/todo_items/1
  def update
    respond_to do |format|
      if @todo_item.update_attributes(todo_item_params)
        format.html { redirect_to @todo_item.todo_list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo_item }
      else
        format.js { render :edit }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE todo_lists/1/todo_items/1
  def destroy
    @todo_item.destroy

    # redirect_to todo_list_todo_items_url(@todo_list)
    redirect_to(@todo_item.todo_list)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = TodoList.find(params[:todo_list_id])
    end

    def set_todo_item
      @todo_item = @todo_list.todo_items.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def todo_item_params
      params.require(:todo_item).permit(:description, :completed, :completed_at, :position, :todo_list_id)
    end
end

class TodosController < ApplicationController
 
 def index
      @todos = Todo.all # you have to supply a scope in order to make the program go to the DB and retrieve the data
      #@todos = Todo.sorted
  end
    
 def new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todo_params) #strong params
    if @todo.save
      # If save succeeds, show notice and redirect to the index action
      flash[:notice] = "ToDo Item created successfully."
      
      redirect_to (todos_path) #==> path to index
      #redirect_to todo_path(@todo) # get the show view
    else
      # If save fails, redisplay the form so user can fix problems
      render('new') # new.html.erb - this does not perform the new action. This just renders that form template
    end
  end
  
  def show
    @todo = Todo.find(params[:id]) # ==> single instance
  end
  
  def edit
    @todo = Todo.find(params[:id]) 
  end
  
  def update
    # Find a new object using form parameters
      @todo = Todo.find(params[:id])
      # Update the object
      if @todo.update_attributes(todo_params) #private def below
        # If save succeeds, show notice and redirect to the show action
        flash[:notice] = "ToDo Item updated successfully."
        redirect_to(todo_path(@todo)) #==> show
      else
        # If save fails, redisplay the form so user can fix problems
        render('edit')
      end
  end
  
  def delete
    @todo = Todo.find(params[:id])
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    # show notice and redirect to index
    flash[:notice] = "ToDo Item '#{@todo.name}' destroyed successfully."
    redirect_to(todos_path)
  end
  
# ***********************************************************************************************************************************************  
private
  
  def todo_params
    # This is an example of mass assignment
    params.require(:todo).permit(:name, :description)
    
  end
  
  
  
end 


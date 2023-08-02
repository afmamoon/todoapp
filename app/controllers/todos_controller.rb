class TodosController < ActionController::Base

    def new
        # This action is for view /todos/new 
        # @todo is an instance variable which is available through the controller and the View
        @todo = Todo.new        
    end

    def create
        @todo = Todo.new(todo_params)

        if @todo.save
        # When it is saved; Redirect to show which is as below. todo_path --> Came from routes for show and id needs to be passed since this is the requirement for show path
            flash[:notice] = "Todo was created successfully!"
            redirect_to todo_path(@todo)           
        else
            render 'new' # or below one
            #redirect_to new_todo_path()            
        end
    end

    def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy
        flash[:notice] = "Todo was Deleted successfully!"
        
        redirect_to todos_path
    end

    def show
        @todo = Todo.find(params[:id])
    end

    def edit
        @todo = Todo.find(params[:id])
    end

    def update
        @todo = Todo.find(params[:id])
        if @todo.update(todo_params)
            flash[:notice] = "Todo was successfully updated"
            redirect_to todo_path(@todo) # Sent back to the todo which was just updated. 
        else
            render 'edit'
        end
    end

    def index
        @todos = Todo.all

        # This completes the Todos action. Now need to iterate through this in the index view

    end





    # This private method is here to allow the controller to receive below two parameters.
    private
        def todo_params
            params.require(:todo).permit(:name, :description)
        end


end
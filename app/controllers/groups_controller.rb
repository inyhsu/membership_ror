class GroupsController < ApplicationController
    def groups 
        @groups = Group.all
    end

    def create
        @group = Group.new(group_params)
        @group.user = current_user
      if @group.valid?
            @group.save
            group = @group
            user = current_user
            @join = Join.create(user:user,group:group)
            redirect_to "/groups"
      else

          flash[:errors] = @group.errors.full_messages
          redirect_to "/groups"
      end
    end

    def show
        @g = Group.find(params[:id])
    
    end

    def destroy
        @d_group = Group.find(params[:id])
        @d_group.destroy
        redirect_to "/groups"
    end



    private
        def group_params
        params.require(:group).permit(:name, :description)
    end
end

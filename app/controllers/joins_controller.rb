class JoinsController < ApplicationController
    def create
        group = Group.find_by_id(params[:id])
        user = current_user
        @join = Join.create(user:user,group:group)
        redirect_to "/groups/#{group.id}"
    end

    def destroy
        @d_join = Join.find_by(user_id: current_user.id, group_id: params[:id])
        @d_join.destroy
        redirect_to "/groups"
    end
end

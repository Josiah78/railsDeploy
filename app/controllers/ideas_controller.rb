class IdeasController < ApplicationController
    def ideas
        @user = current_user
        @ideas = Idea.all
    end

    def create
        @idea = Idea.create( idea_params )
        if @idea.valid?
            redirect_to '/ideas'
        else
            flash[:errors] = @idea.errors.full_messages
            redirect_to '/ideas'
        end
    end

    def oneIdea
        @idea = Idea.find(params[:idea_id])
        @users = User.all
    end

    def add
        if Idea.find_by(id: params[:idea_id])
            @idea = Idea.find(params[:idea_id])
            if not @idea.usersWhoLiked.include?(current_user)
                Like.create(user: User.find(session[:user_id]), idea: Idea.find(params[:idea_id]))
            end
        end
        redirect_to '/ideas'
    end

    def delete
        if Idea.find_by(id: params[:idea_id])
            @ideaDelete = Idea.find(params[:idea_id])
            if @ideaDelete.user_id == current_user.id
                @ideaDelete.destroy
            end
        end
        redirect_to '/ideas'
    end

    private
        def idea_params
            params.require(:idea).permit(:content).merge(user: User.find(current_user))
        end
end
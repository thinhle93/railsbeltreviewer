class EventController < ApplicationController
    def create
        #create event here
        event = Event.create(event_params)
        if !event.valid? 
            flash[:errors] = event.errors.full_messages
        end
        redirect_to "/users/find/#{session[:userid]}"

        #render text: "in event create"
    end

    def show
        @event = Event.find(params[:id])
        @attendees = @event.attendees
        @comments = @event.comments
        @date = "#{@event.date.strftime('%b %d, %Y')}"
    end

    def newcomment
        comment = Comment.create(content: params[:comment], user_id: params[:userid], event_id: params[:eventid])
        if !comment.valid?
            flash[:errors] = comment.errors.full_messages
        end
        redirect_to "/event/find/#{params[:eventid]}"
    end

    def join
        Attend.create(user_id: session[:userid], event_id: params[:id])
        redirect_to "/users/find/#{session[:userid]}"
    end

    def unjoin
        Attend.find_by(user_id: session[:userid], event_id: params[:id]).destroy
        redirect_to "/users/find/#{session[:userid]}"

    end

    def delete
        Event.find(params[:id]).destroy
        redirect_to "/users/find/#{session[:userid]}"
    end

    def eventedit
        @event = Event.find(params[:id])
    end

    def update
        event = Event.find(params[:id])
        event.update(event_params)
        if !event.valid?
            flash[:errors] = event.errors.full_messages
            redirect_to "/event/edit/#{params[:id]}"
        else
            redirect_to "/users/find/#{session[:userid]}"
        end

    end

    private
        def event_params
            params.require(:event).permit(:name, :city, :state, :date, :user_id)
        end
end

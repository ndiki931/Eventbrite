class EventsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user!, except: [:index, :login]

  # View list of events (order by most recents first)
  def index
    @events = Event.all.order('created_at DESC')
  end

  # Show an event
  def show
    @event = Event.find(params[:id])
  end

  # Display a view to create an event
  def new
    @event = Event.new
  end

  # Create a new event
  def create
    @event = Event.new(post[:event])

    if @event.save
      flash[:success] = "L'évènement a été créé avec succès."
      redirect_to events_path
    else
      render 'new'
    end
  end

  # Display a view with a form to edit an existing event
  def edit
    @event = Event.find(params[:id])
    # has_rights_user(@event)
  end

  # Edit an existing event
  def update
    @gossip = Gossip.find_by(title: params[:title])

    if @gossip.update(title: params[:title], content: params[:content], user: current_user)
      flash[:success] = 'Le potin a été mis à jour avec succès.'
      redirect_to gossips_path
    else
      render 'edit'
    end
  end

  # Delete an event
  def destroy
    Gossip.find(params[:id]).delete
    redirect_to gossips_path
  end

  # Subscribe logged-in user to the event
  def subscribe_to_event(event)
    @event = event

    event.users << current_user

    # render event(id: @event.id)
    redirect_to root_path
  end
end

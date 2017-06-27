class LikesController < ApplicationController

  # This action will show our likes for a user.
  # Lets assume you have an authentication system (ex Devise) that logs a user in and provides a `current_user` object
  # GET /likes
  def index
    # Assign the logged in user to @user
    @user = current_user
    # Grab all of the books and put them into an array in @books
    @horses = Horse.all
  end

  # This is our key action. We will use this action to create a Like
  # POST /likes
  def create
    # Grab our book from the DB. Note that this syntax is for Rails 3.2 and below. Rails 4 uses something called Strong Parameters, but that is for another time.
    horse = Horse.find(params[:horse_id])
    # Create a like
    Like.create(:horse => horse, :user => current_user)
    # redirect back to the Like index page and assign a flash
    redirect_to likes_path, :notice => "You just liked the horse #{horse.name}"
  end

  # here is where we will destroy a Like
  # DELETE /likes/:id
  def destroy
    # Get the like form the DB
    like = Like.find(params[:id])
    # destroy it
    like.destroy
    redirect_to likes_path, :notice => "You destroyed a like"
  end
end

class HorsesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy, :like, :unlike]

  def like
  @horse.liked_by current_user
  respond_to do |format|
    format.html { redirect_to :back }
    format.js
    end
 end
def unlike
  @horse.unliked_by current_user
  respond_to do |format|
    format.html { redirect_to :back }
    format.js
    end
 end

 private
  def set_event
    @horse = Horse.find(params[:id])
  end
end

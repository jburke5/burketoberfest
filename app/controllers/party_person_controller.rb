class PartyPersonController < ApplicationController
    before_action :set_person, only: [:show, :edit, :update, :destroy]

  
  def show
  end

  def index
      @people = PartyPerson.all
  end

  def new
      @person = PartyPerson.new
      @person.ip = request.env["HTTP_X_FORWARDED_FOR"]
  end

  def edit
  end

  def create
      @person = PartyPerson.new(game_params)
      
      if @PartyPerson.save
          redirect_to @PartyPerson, notice: 'Person was successfully created.'
          else
          render action: 'new'
      end
  end

  def update
  end

  def destroy
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
        @person = PartyPerson.find_by(ip: request.env["HTTP_X_FORWARDED_FOR"])
    end

end

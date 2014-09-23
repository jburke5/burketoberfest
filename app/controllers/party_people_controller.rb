class PartyPeopleController < ApplicationController
    before_action :set_person, only: [:show, :edit, :update, :destroy]

  
  def show
  end

  def index
      @people = PartyPerson.all
  end

  def new
      @person = PartyPerson.new
  end

  def edit
  end

  def create
      @person = PartyPerson.new(name: person_params[:name], ip: ip)
      
      if @person.save
          redirect_to @person, notice: 'Person was successfully created.'
          else
          render action: 'new'
      end
  end

  def update
  end

  def destroy
  end

private
  def ip
    request.env["REMOTE_HOST"]
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_person
        @person = PartyPerson.find_by(ip: ip)
    end
    
    def person_params
      params.require(:party_person).permit(:name)
    end

end

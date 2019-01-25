class PlayersController < ApplicationController
  
    def index
    end
  
  
    def new
        @player = Player.new
        @team = Team.find(params[:id])
    end
    
    def create
        #THIS IS THE LINE IDK WHAT TO DO WITH
        @team = Team.find(params[:id])
        @player = @team.players.build(player_params)
    
        respond_to do |format|
          if @player.save
            format.html { redirect_to @team, notice: 'Player was successfully created.' }
            format.json { render :show, status: :created, location: @player }
          else
            format.html { render :new }
            format.json { render json: @player.errors, status: :unprocessable_entity }
          end
        end
    end
    
    def edit
        @player = Player.find(params[:id])
    end
    
    def update
      @player = Player.find(params[:id])
      @team = Team.find(@player.team_id)
        respond_to do |format|
          if @player.update(player_params)
            format.html { redirect_to team_path(@team), notice: 'Player was successfully updated.' }
            format.json { render :show, status: :ok, location: @player }
          else
            format.html { render :edit }
            format.json { render json: @player.errors, status: :unprocessable_entity }
          end
        end
    end
    
    def destroy
      @player = Player.find(params[:id])
      @team = Team.find(@player.team_id)
      @player.destroy
      respond_to do |format|
        format.html { redirect_to team_path(@team), notice: 'Player was successfully removed.' }
        format.json { head :no_content }
      end
    end
    
    private
    
    def player_params
      params.require(:player).permit(:name, :gender, :good_kicker, :p1, :p2, :p3, :p4, :p5, :p6, :p7, :p8, :p9, :p10, :active)
    end
end

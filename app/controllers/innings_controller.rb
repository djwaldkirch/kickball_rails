class InningsController < ApplicationController
    
    def show
        @inning = Inning.find(params[:id])
    end
    
    def edit
        @inning = Inning.find(params[:id])
    end
    
    def update
        @inning = Inning.find(params[:id])
        respond_to do |format|
          if @inning.update(inning_params)
            format.html { redirect_to @inning.game, notice: 'Game was successfully updated.' }
            format.json { render :show, status: :ok, location: @game }
          else
            format.html { render :edit }
            format.json { render json: @game.errors, status: :unprocessable_entity }
          end
        end
    end
    
    private
        
    def inning_params
      params.require(:inning).permit(:p, :c, :first, :third, :lr, :rr, :l, :r, :lc, :rc)
    end
end

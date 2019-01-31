class DashboardsController < ApplicationController
    def index
        @user = current_user
        @teams = @user.teams
        @games = @user.games
    end
end

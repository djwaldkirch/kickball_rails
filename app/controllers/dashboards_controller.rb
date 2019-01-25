class DashboardsController < ApplicationController
    def index
        @teams = Team.all
        @games = Game.all
    end
end

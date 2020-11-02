class LeaguesController < ApplicationController

    def index
        leagues = League.all 
        render json: leagues
    end

    def create 
        league = League.create(league_params)
        if league.valid?
        render json: league
        else render json:{error:"Failed to add new league."}
        
    end

    def show 
        league = League.find(params[:id])
        render json: league
    end

    def update 
        league = League.find(params[:id])
        league.update(league_params)
        render json: league
    end

    def destroy 
        # byebug
        league = League.find(params[:id])
        league.destroy
        render json:{message: "league has been deleted"}
    end
    
    private 

    def league_params 
        params.require(:league).permit(:user_id, :name)
    end

end

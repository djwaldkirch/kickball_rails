class Game < ApplicationRecord
    has_many :innings
    belongs_to :user
    belongs_to :team
    
    def generate_lineup(t)
      clear_all
       roster = get_working_roster(t)
       roster = create_bench_order(roster)
       set_defense(self, roster)
    end
    
    #get working roster of people
    def get_working_roster(t)
        Player.all.select { |p| (p.team_id == team.id) && (p.active == true) }
    end
    
    def clear_all
      self.innings.each do |inning|
        inning.p = nil
        inning.c = nil
        inning.first = nil
        inning.third = nil
        inning.lr = nil
        inning.rr = nil
        inning.l = nil
        inning.lc = nil
        inning.rc = nil
        inning.r = nil
        inning.bench = nil
      end
    end
    
    def create_bench_order(players)
      kicking_order = []
      guys = []
      girls = []
      players = players.shuffle
      players.each do |player|
        if player.gender == 'female'
          girls << player
        else
          guys << player
        end
      end
    
      if guys.length > girls.length
        bigger = guys
        smaller = girls
      elsif girls.length > guys.length
        bigger = girls
        smaller = guys
      elsif guys.length == girls.length
        kicking_order = guys.zip(girls).compact.flatten
        return kicking_order
      end
    
      (smaller.length).times do |x|
        kicking_order << bigger[0]
        bigger.shift
        kicking_order << smaller[0]
        smaller.shift
      end
    
      index = 0
      while bigger.any?
        kicking_order.insert(index, bigger[0])
        bigger.shift
        index += 3
      end
      return kicking_order
    end
    
    def set_defense(game, players)
    
      game.innings.each do |inning|
         bench = []
         bench_no = players.length - 10
         
         bench_no.times do
             player = players[0]
             bench << player.name
             players.shift
             players << player
         end
         
         bench_display = ""
         bench.each do |x|
           bench_display += x + ", "
         end
         inning.bench = bench_display
         
         playing = players[0...-(bench_no)]
         playing = playing.shuffle
         
         playing.each do |plr|
           player_prefs = [plr.p1, plr.p2, plr.p3, plr.p4, plr.p5, plr.p6, plr.p7, plr.p8, plr.p9, plr.p10]
           
           index = 0
           
           until index > 9 do 
             if free?(inning.p) && player_prefs[index] == 'p'
              inning.p = plr.name
              break
             elsif free?(inning.c) && player_prefs[index] == 'c'
              inning.c = plr.name
              break
             elsif free?(inning.first) && player_prefs[index] == 'first'
              inning.first = plr.name
              break
             elsif free?(inning.third) && player_prefs[index] == 'third'
              inning.third = plr.name
              break
             elsif free?(inning.lr) && player_prefs[index] == 'lr'
              inning.lr = plr.name
              break
             elsif free?(inning.rr) && player_prefs[index] == 'rr'
              inning.rr = plr.name
              break
             elsif free?(inning.l) && player_prefs[index] == 'l'
              inning.l = plr.name
              break
             elsif free?(inning.lc) && player_prefs[index] == 'lc'
              inning.lc = plr.name
              break
             elsif free?(inning.rc) && player_prefs[index] == 'rc'
              inning.rc = plr.name
              break
             elsif free?(inning.r) && player_prefs[index] == 'r'
              inning.r = plr.name
              break
             else
              index += 1
             end
           end
         end
      end
    end
    
    
    def free?(position)
      position == nil
    end

end

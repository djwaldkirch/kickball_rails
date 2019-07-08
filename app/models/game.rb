class Game < ApplicationRecord
    has_many :innings, inverse_of: :game, dependent: :destroy
    has_one :kicking_order, inverse_of: :game, dependent: :destroy
    belongs_to :user
    belongs_to :team
    accepts_nested_attributes_for :innings

    validates :no_of_innings, presence: true
    validates :date, presence: true
    validates :opponent, presence: true

    def export_defense(team)
      header = [" "]
      pitcher_row = ["P:"]
      catcher_row = ["C:"]
      first_row = ["1:"]
      third_row = ["3:"]
      lr_row = ["LR:"]
      rr_row = ["RR:"]
      l_row = ["L:"]
      lc_row = ["LC:"]
      rc_row = ["RC:"]
      r_row = ["R:"]
      rows = [header,pitcher_row,catcher_row,first_row,third_row,lr_row,rr_row,l_row,lc_row,rc_row,r_row]
      index = 0

      self.innings.each do |inning|
        index += 1
        header << index
        pitcher_row << inning.p
        catcher_row << inning.c
        first_row << inning.first
        third_row << inning.third
        lr_row << inning.lr
        rr_row << inning.rr
        l_row << inning.l
        lc_row << inning.lc
        rc_row << inning.rc
        r_row << inning.r
      end

      rows << [" "]

      bench_index = 0
      bench_size = get_bench_size(team)

      bench_size.times do
          bench_row = ["B:"]
          self.innings.each do |inning|
             bench_split = inning.bench.gsub(/"+/, '').split(", ")
             bench_row << bench_split[bench_index]
          end
          bench_index += 1
          rows << bench_row
      end

      rows << [""]
      rows << ["","KICKING"]
      self.kicking_order.order.split(",").each do |name|
        rows << ["", name]
      end

      CSV.generate do |csv|
        rows.each do |row|
          csv << row
        end
      end
    end

    def get_bench_size(team)
        roster = get_working_roster(team)
        return roster.length - 10
    end


    def generate_lineup(t)
       self.innings = []
       create_innings
       roster = get_working_roster(t)
       roster = create_bench_order(roster)
       set_kicking_order(roster)
       set_defense(self, roster)
       self.save
    end

    def create_innings
        (self.no_of_innings).times do
          self.innings << Inning.new
        end
    end

    def set_kicking_order(roster)
      self.kicking_order = KickingOrder.new(order:"")
      self.kicking_order.save
      roster.each do |player|
        self.kicking_order.order += player.name + ","
      end
      self.kicking_order.save
    end

    #get working roster of people
    def get_working_roster(t)
        Player.all.select { |p| (p.team_id == team.id) && (p.active == true) }
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
         bench_display = bench_display[0...-2]
         inning.update_attribute(:bench, bench_display)

         playing = players[0...-(bench_no)]
         playing = playing.shuffle

         playing.each do |plr|
           player_prefs = [plr.p1, plr.p2, plr.p3, plr.p4, plr.p5, plr.p6, plr.p7, plr.p8, plr.p9, plr.p10]

           index = 0

           until index > 9 do
             if free?(inning.p) && player_prefs[index] == 'p'
              inning.update_attribute(:p, plr.name)
              #inning.p = plr.name
              break
             elsif free?(inning.c) && player_prefs[index] == 'c'
              inning.update_attribute(:c, plr.name)
              break
             elsif free?(inning.first) && player_prefs[index] == 'first'
              inning.update_attribute(:first, plr.name)
              break
             elsif free?(inning.third) && player_prefs[index] == 'third'
              inning.update_attribute(:third, plr.name)
              break
             elsif free?(inning.lr) && player_prefs[index] == 'lr'
              inning.update_attribute(:lr, plr.name)
              break
             elsif free?(inning.rr) && player_prefs[index] == 'rr'
              inning.update_attribute(:rr, plr.name)
              break
             elsif free?(inning.l) && player_prefs[index] == 'l'
              inning.update_attribute(:l, plr.name)
              break
             elsif free?(inning.lc) && player_prefs[index] == 'lc'
              inning.update_attribute(:lc, plr.name)
              break
             elsif free?(inning.rc) && player_prefs[index] == 'rc'
              inning.update_attribute(:rc, plr.name)
              break
             elsif free?(inning.r) && player_prefs[index] == 'r'
              inning.update_attribute(:r, plr.name)
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

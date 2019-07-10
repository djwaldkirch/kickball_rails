dan = User.new(
    name: "Dan Waldkirch",
    email: "djwaldkirch@gmail.com",
    password: "kickball",
    password_confirmation: "kickball",
)
dan.save!

cam = User.new(
    name: "Cameron Elkin",
    email: "cameron_elkin@yahoo.com",
    password: "kickball",
    password_confirmation: "kickball",
)
cam.save!


Game.create!([
  {no_of_innings: 7, opponent: "Test", date: "2019-07-07", user_id: 2, team_id: 1}
])
Inning.create!([
  {p: "Jon", c: "Felicia", first: "Jamie", third: "Sara J", lr: "Cam", rr: "Maria", l: "Luis", lc: "Marc", rc: "Drew", r: "Kim", bench: "Zoe, Leah, Dan, Cristina, Flavia, Kenny, Bre, Sarah B, Steven", game_id: 1},
  {p: "Jon", c: "Zoe", first: "Sarah B", third: "Leah", lr: "Dan", rr: "Kenny", l: "Steven", lc: "Bre", rc: "Flavia", r: "Cristina", bench: "Felicia, Cam, Kim, Luis, Jamie, Marc, Maria, Drew, Sara J", game_id: 1},
  {p: "Luis", c: "Kim", first: "Felicia", third: "Sara J", lr: "Cam", rr: "Maria", l: "Steven", lc: "Marc", rc: "Drew", r: "Jamie", bench: "Jon, Zoe, Leah, Dan, Cristina, Flavia, Kenny, Bre, Sarah B", game_id: 1},
  {p: "Jon", c: "Leah", first: "Cristina", third: "Flavia", lr: "Dan", rr: "Kenny", l: "Sara J", lc: "Bre", rc: "Sarah B", r: "Zoe", bench: "Steven, Felicia, Cam, Kim, Luis, Jamie, Marc, Maria, Drew", game_id: 1},
  {p: "Cam", c: "Kim", first: "Felicia", third: "Sarah B", lr: "Jamie", rr: "Maria", l: "Steven", lc: "Marc", rc: "Drew", r: "Luis", bench: "Sara J, Jon, Zoe, Leah, Dan, Cristina, Flavia, Kenny, Bre", game_id: 1},
  {p: "Jon", c: "Zoe", first: "Cristina", third: "Kenny", lr: "Dan", rr: "Bre", l: "Sara J", lc: "Leah", rc: "Drew", r: "Flavia", bench: "Sarah B, Steven, Felicia, Cam, Kim, Luis, Jamie, Marc, Maria", game_id: 1},
  {p: "Maria", c: "Felicia", first: "Sarah B", third: "Bre", lr: "Cam", rr: "Marc", l: "Luis", lc: "Steven", rc: "Kim", r: "Jamie", bench: "Drew, Sara J, Jon, Zoe, Leah, Dan, Cristina, Flavia, Kenny", game_id: 1}
])
KickingOrder.create!([
  {game_id: 1, order: "Zoe,Leah,Dan,Cristina,Flavia,Kenny,Bre,Sarah B,Steven,Felicia,Cam,Kim,Luis,Jamie,Marc,Maria,Drew,Sara J,Jon,"}
])
Player.create!([
  {name: "Dan", gender: "male", good_kicker: nil, p1: "p", p2: "lr", p3: "lc", p4: "rc", p5: "l", p6: "r", p7: "first", p8: "third", p9: "rr", p10: "c", p11: nil, team_id: 1, active: true},
  {name: "Jamie", gender: "female", good_kicker: nil, p1: "lr", p2: "r", p3: "lc", p4: "rc", p5: "first", p6: "rr", p7: "third", p8: "lr", p9: "c", p10: "p", p11: nil, team_id: 1, active: true},
  {name: "Luis", gender: "male", good_kicker: nil, p1: "l", p2: "r", p3: "lc", p4: "rc", p5: "rr", p6: "p", p7: "first", p8: "third", p9: "lr", p10: "c", p11: nil, team_id: 1, active: true},
  {name: "Sara J", gender: "female", good_kicker: nil, p1: "l", p2: "r", p3: "rr", p4: "lc", p5: "rc", p6: "first", p7: "third", p8: "c", p9: "lr", p10: "p", p11: nil, team_id: 1, active: true},
  {name: "Steven", gender: "male", good_kicker: nil, p1: "l", p2: "r", p3: "lc", p4: "rc", p5: "first", p6: "rr", p7: "p", p8: "third", p9: "c", p10: "lr", p11: nil, team_id: 1, active: true},
  {name: "Cristina", gender: "female", good_kicker: nil, p1: "first", p2: "third", p3: "c", p4: "rr", p5: "p", p6: "l", p7: "r", p8: "lc", p9: "rc", p10: "lr", p11: nil, team_id: 1, active: true},
  {name: "Cam", gender: "male", good_kicker: nil, p1: "lr", p2: "lc", p3: "rc", p4: "l", p5: "r", p6: "first", p7: "rr", p8: "p", p9: "third", p10: "c", p11: nil, team_id: 1, active: true},
  {name: "Kenny", gender: "male", good_kicker: nil, p1: "third", p2: "rr", p3: "first", p4: "c", p5: "l", p6: "r", p7: "lc", p8: "rc", p9: "p", p10: "lr", p11: nil, team_id: 1, active: true},
  {name: "Bre", gender: "female", good_kicker: nil, p1: "third", p2: "first", p3: "rr", p4: "c", p5: "l", p6: "lc", p7: "rc", p8: "r", p9: "p", p10: "lr", p11: nil, team_id: 1, active: true},
  {name: "Drew", gender: "male", good_kicker: nil, p1: "rc", p2: "lc", p3: "l", p4: "r", p5: "lr", p6: "rr", p7: "first", p8: "third", p9: "p", p10: "c", p11: nil, team_id: 1, active: true},
  {name: "Kim", gender: "female", good_kicker: nil, p1: "r", p2: "l", p3: "rc", p4: "lc", p5: "rr", p6: "c", p7: "first", p8: "third", p9: "c", p10: "p", p11: nil, team_id: 1, active: true},
  {name: "Marc", gender: "male", good_kicker: nil, p1: "lc", p2: "rc", p3: "l", p4: "r", p5: "lr", p6: "rr", p7: "p", p8: "first", p9: "third", p10: "c", p11: nil, team_id: 1, active: true},
  {name: "Zoe", gender: "female", good_kicker: nil, p1: "c", p2: "third", p3: "rr", p4: "first", p5: "l", p6: "r", p7: "lc", p8: "rc", p9: "p", p10: "lr", p11: nil, team_id: 1, active: true},
  {name: "Leah", gender: "female", good_kicker: nil, p1: "c", p2: "third", p3: "first", p4: "rr", p5: "l", p6: "r", p7: "lc", p8: "rc", p9: "p", p10: "lr", p11: nil, team_id: 1, active: true},
  {name: "Sarah B", gender: "female", good_kicker: nil, p1: "first", p2: "third", p3: "rr", p4: "l", p5: "r", p6: "lc", p7: "rc", p8: "p", p9: "c", p10: "lr", p11: nil, team_id: 1, active: true},
  {name: "Maria", gender: "female", good_kicker: nil, p1: "rr", p2: "first", p3: "third", p4: "c", p5: "p", p6: "l", p7: "r", p8: "lc", p9: "rc", p10: "lr", p11: nil, team_id: 1, active: true},
  {name: "Flavia", gender: "female", good_kicker: nil, p1: "third", p2: "first", p3: "c", p4: "rr", p5: "l", p6: "r", p7: "lc", p8: "rc", p9: "lr", p10: "p", p11: nil, team_id: 1, active: true},
  {name: "Felicia", gender: "female", good_kicker: nil, p1: "first", p2: "third", p3: "c", p4: "p", p5: "rr", p6: "l", p7: "lc", p8: "rc", p9: "r", p10: "lr", p11: nil, team_id: 1, active: true},
  {name: "Jon", gender: "male", good_kicker: nil, p1: "p", p2: "lr", p3: "lc", p4: "rc", p5: "l", p6: "r", p7: "rr", p8: "first", p9: "third", p10: "c", p11: nil, team_id: 1, active: true}
])
Team.create!([
  {name: "Leg Day", user_id: 2}
])

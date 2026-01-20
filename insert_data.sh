#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo Clearing tables...
echo $($PSQL "truncate table games, teams restart identity cascade")
echo Tables cleared

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WG OG
do
#skip first line
if [[ $YEAR != 'year' ]]
then
  #get winner_id
  WINNER_ID=$($PSQL"select team_id from teams where name = '$WINNER'")
  #if not found
  if [[ -z $WINNER_ID ]]
  then
    #insert new team
    echo $($PSQL"insert into teams(name) values('$WINNER')")
    #get winner_id to insert into games table later
    WINNER_ID=$($PSQL"select team_id from teams where name = '$WINNER'")
  fi

  #get opponent_id
  OPPONENT_ID=$($PSQL"select team_id from teams where name = '$OPPONENT'")  
  #if not found
  if [[ -z $OPPONENT_ID ]]
  then
    #insert new team
    echo $($PSQL"insert into teams(name) values('$OPPONENT')")
    #get opponent_id to insert into games table later
    OPPONENT_ID=$($PSQL"select team_id from teams where name = '$OPPONENT'")
  fi
  #insert game
  GAME_ID=$($PSQL"select game_id from games where year = $YEAR AND round = '$ROUND'
            AND winner_id = $WINNER_ID AND opponent_id = $OPPONENT_ID AND 
            winner_goals = $WG AND opponent_goals = $OG")
  if [[ -z $GAME_ID ]]
  then
    echo $($PSQL"insert into games(year,round,winner_id,opponent_id,winner_goals,opponent_goals)
           values($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WG, $OG)")
  fi
fi
done

SELECT name, position 
FROM player 
 JOIN team_has_player ON player.player_ID= team_has_player.player_ID
 WHERE team_has_player.country='France' AND year='2018'
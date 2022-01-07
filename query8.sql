select time_issued,color,player.name
From penalties
join player on penalties.player_ID=player.player_ID 
where match_id=6418 and color='Yellow'
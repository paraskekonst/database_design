SELECT time_scored,name
FROM goals_scored
join player ON goals_scored.player_id=player.player_ID
WHERE match_id='6418'
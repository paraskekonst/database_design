SELECT EXISTS(SELECT *
FROM team
WHERE country='Brazil' AND leaderboard_pos < '5')
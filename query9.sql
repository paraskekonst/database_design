select scorer.name , count(scorer.match_id) AS goals , count(color) AS cards
from scorer JOIN card_penalty ON scorer.player_ID=card_penalty.player_ID AND scorer.year=card_penalty.year
where card_penalty.player_ID=1809 AND card_penalty.year=2018
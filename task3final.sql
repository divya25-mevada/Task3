CREATE DATABASE IF NOT EXISTS ipl_database;
USE ipl_database;
CREATE TABLE ipl_matches (
    match_id INT PRIMARY KEY AUTO_INCREMENT,
    season YEAR NOT NULL,
    match_date DATE NOT NULL,
    venue VARCHAR(100),
    
    -- Team 1 information
    team1_id INT,
    team1_name VARCHAR(50),
    team1_city VARCHAR(50),
    team1_captain_id INT,
    team1_captain_name VARCHAR(100),
    
    -- Team 2 information
    team2_id INT,
    team2_name VARCHAR(50),
    team2_city VARCHAR(50),
    team2_captain_id INT,
    team2_captain_name VARCHAR(100),
    
    -- Match results
    toss_winner_id INT,
    toss_decision VARCHAR(10),
    match_winner_id INT,
    win_by_runs INT,
    win_by_wickets INT,
    
    -- Player of the match
    player_of_match_id INT,
    player_of_match_name VARCHAR(100),
    player_batting_style VARCHAR(50),
    player_bowling_style VARCHAR(50),
    
    -- Batting performance (for player of match)
    runs_scored INT,
    balls_faced INT,
    fours INT,
    sixes INT,
    strike_rate DECIMAL(5,2),
    
    -- Bowling performance (for player of match)
    overs_bowled DECIMAL(3,1),
    runs_conceded INT,
    wickets_taken INT,
    maidens INT,
    economy_rate DECIMAL(5,2)
);

-- Sample data for 5 matches
INSERT INTO ipl_matches VALUES
(1, 2023, '2023-04-09', 'Wankhede Stadium', 
 1, 'Mumbai Indians', 'Mumbai', 101, 'Rohit Sharma',
 2, 'Chennai Super Kings', 'Chennai', 102, 'MS Dhoni',
 1, 'bat', 1, 15, NULL,
 101, 'Rohit Sharma', 'Right-handed', 'Right-arm offbreak',
 65, 45, 5, 3, 144.44,
 NULL, NULL, NULL, NULL, NULL),

(2, 2023, '2023-04-10', 'M. Chinnaswamy Stadium',
 3, 'Royal Challengers Bangalore', 'Bangalore', 103, 'Virat Kohli',
 4, 'Kolkata Knight Riders', 'Kolkata', 104, 'Andre Russell',
 3, 'field', 4, NULL, 6,
 104, 'Andre Russell', 'Right-handed', 'Right-arm fast',
 80, 40, 4, 8, 200.00,
 4.0, 35, 2, 0, 8.75),

(3, 2023, '2023-04-11', 'Eden Gardens',
 4, 'Kolkata Knight Riders', 'Kolkata', 104, 'Andre Russell',
 5, 'Delhi Capitals', 'Delhi', 105, 'Rishabh Pant',
 5, 'bat', 5, 25, NULL,
 105, 'Rishabh Pant', 'Left-handed', NULL,
 78, 50, 6, 4, 156.00,
 NULL, NULL, NULL, NULL, NULL),

(4, 2023, '2023-04-12', 'Arun Jaitley Stadium',
 5, 'Delhi Capitals', 'Delhi', 105, 'Rishabh Pant',
 1, 'Mumbai Indians', 'Mumbai', 101, 'Rohit Sharma',
 1, 'field', 5, NULL, 7,
 106, 'Jasprit Bumrah', 'Right-handed', 'Right-arm fast',
 NULL, NULL, NULL, NULL, NULL,
 4.0, 18, 4, 1, 4.50),

(5, 2023, '2023-04-13', 'M. A. Chidambaram Stadium',
 2, 'Chennai Super Kings', 'Chennai', 102, 'MS Dhoni',
 3, 'Royal Challengers Bangalore', 'Bangalore', 103, 'Virat Kohli',
 2, 'bat', 2, 12, NULL,
 102, 'MS Dhoni', 'Right-handed', 'Right-arm medium',
 42, 28, 3, 2, 150.00,
 NULL, NULL, NULL, NULL, NULL);
 select * from  ipl_matches;
 SELECT player_name, batting_style, bowling_style 
FROM players 
WHERE team_id = (SELECT team_id FROM teams WHERE team_name = 'Mumbai Indians') 
ORDER BY player_name;
SELECT m.match_id, t1.team_name AS team1, t2.team_name AS team2, m.win_by_runs
FROM matches m
JOIN teams t1 ON m.team1_id = t1.team_id
JOIN teams t2 ON m.team2_id = t2.team_id
WHERE m.win_by_runs > 20
ORDER BY m.win_by_runs DESC;
SELECT m.match_id, t1.team_name AS team1, t2.team_name AS team2, m.win_by_runs
FROM matches m
JOIN teams t1 ON m.team1_id = t1.team_id
JOIN teams t2 ON m.team2_id = t2.team_id
WHERE m.win_by_runs > 20
ORDER BY m.win_by_runs DESC;
SELECT p.player_name, AVG(bs.runs_scored) AS avg_runs, 
       MAX(bs.runs_scored) AS highest_score
FROM batting_stats bs
JOIN players p ON bs.player_id = p.player_id
GROUP BY p.player_id
ORDER BY avg_runs DESC;

SELECT p.player_name
FROM players p
WHERE p.player_id IN (
    SELECT bs.player_id 
    FROM batting_stats bs 
    WHERE bs.runs_scored >= 100
);
CREATE VIEW top_performers AS
SELECT p.player_name, 
       MAX(bs.runs_scored) AS highest_score,
       MAX(bs.strike_rate) AS best_strike_rate,
       MAX(bw.wickets_taken) AS best_wickets
FROM players p
LEFT JOIN batting_stats bs ON p.player_id = bs.player_id
LEFT JOIN bowling_stats bw ON p.player_id = bw.player_id
GROUP BY p.player_id
HAVING MAX(bs.strike_rate) > 200 OR MAX(bw.wickets_taken) >= 5;
select *from  ipl_matches;


 
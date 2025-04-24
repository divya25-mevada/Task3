📌 Project Overview
This project provides a comprehensive IPL (Indian Premier League) cricket matches database with detailed match information, player statistics, and analytical queries. The database is designed for cricket analytics and performance tracking.

📊 Table: ipl_matches
Column Group	Columns Included
Match Identification	match_id, season, match_date, venue
Team 1 Information	team1_id, team1_name, team1_city, team1_captain_id, team1_captain_name
Team 2 Information	team2_id, team2_name, team2_city, team2_captain_id, team2_captain_name
Match Results	toss_winner_id, toss_decision, match_winner_id, win_by_runs, win_by_wickets
Player of Match	player_of_match_id, player_of_match_name, player_batting_style, player_bowling_style
Batting Performance	runs_scored, balls_faced, fours, sixes, strike_rate
Bowling Performance	overs_bowled, runs_conceded, wickets_taken, maidens, economy_rate

📊 Analytical Features
Included SQL Queries
Team Performance Analysis

List all matches for a specific team

Calculate win/loss records

Player Statistics

Average runs by Player of the Match

Bowling performance metrics

Advanced Analytics

High performance matches view

Multiple award winners identification

Optimization
Pre-configured indexes for faster querying:

Player names

Match dates

Team combinations

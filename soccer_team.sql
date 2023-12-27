DROP DATABASE IF EXISTS soccer_DB;

CREATE DATABASE soccer_DB;

\c soccer_DB


-- Team Table
CREATE TABLE Team (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(50)
);

-- Player Table
CREATE TABLE Player (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(50),
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Team(team_id)
);

-- Season Table
CREATE TABLE Season (
    season_id INT PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

-- Game Table
CREATE TABLE Game (
    game_id INT PRIMARY KEY,
    start_date DATE,
    end_date DATE,
    season_id INT,
    FOREIGN KEY (season_id) REFERENCES Season(season_id)
);

-- Goal Table
CREATE TABLE Goal (
    goal_id INT PRIMARY KEY,
    player_id INT,
    game_id INT,
    FOREIGN KEY (player_id) REFERENCES Player(player_id),
    FOREIGN KEY (game_id) REFERENCES Game(game_id)
);

-- Referee Table
CREATE TABLE Referee (
    referee_id INT PRIMARY KEY,
    referee_name VARCHAR(50)
);

-- Game_Referee Table (Association Table)
CREATE TABLE Game_Referee (
    game_id INT,
    referee_id INT,
    PRIMARY KEY (game_id, referee_id),
    FOREIGN KEY (game_id) REFERENCES Game(game_id),
    FOREIGN KEY (referee_id) REFERENCES Referee(referee_id)
);

-- Match Table
CREATE TABLE Match (
    match_id INT PRIMARY KEY,
    team1_id INT,
    team2_id INT,
    FOREIGN KEY (team1_id) REFERENCES Team(team_id),
    FOREIGN KEY (team2_id) REFERENCES Team(team_id)
);

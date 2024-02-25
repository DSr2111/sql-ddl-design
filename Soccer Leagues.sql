CREATE TABLE "Teams" (
  "id" integer,
  "name" text,
  "city" text
);

CREATE TABLE "Matches" (
  "id" integer,
  "home_team_id" integer,
  "away_team_id" integer,
  "location" text,
  "date" date,
  "start_time" time,
  "season_id" integer,
  "head_referee_id" integer,
  "ass_ref_1_id" integer,
  "ass_ref_2_id" integer
);

CREATE TABLE "Goals" (
  "id" integer,
  "match_id" integer,
  "goalscorer_id" integer
);

CREATE TABLE "Players" (
  "id" integer,
  "first_name" text,
  "last_name" text,
  "age" integer,
  "current_team_id" integer
);

CREATE TABLE "Referees" (
  "id" integer,
  "name" text
);

CREATE TABLE "Season" (
  "id" integer,
  "start_date" date,
  "end_date" date
);

CREATE TABLE "Lineups" (
  "id" integer,
  "player_id" integer,
  "match_id" integer,
  "team_id" integer
);

CREATE TABLE "Results" (
  "team_id" integer,
  "match_id" integer,
  "result" text
);

ALTER TABLE "Players" ADD FOREIGN KEY ("current_team_id") REFERENCES "Teams" ("id");

ALTER TABLE "Matches" ADD FOREIGN KEY ("head_referee_id") REFERENCES "Referees" ("id");

ALTER TABLE "Results" ADD FOREIGN KEY ("match_id") REFERENCES "Matches" ("id");

ALTER TABLE "Matches" ADD FOREIGN KEY ("season_id") REFERENCES "Season" ("id");

ALTER TABLE "Matches" ADD FOREIGN KEY ("id") REFERENCES "Lineups" ("match_id");

ALTER TABLE "Goals" ADD FOREIGN KEY ("goalscorer_id") REFERENCES "Players" ("id");

ALTER TABLE "Goals" ADD FOREIGN KEY ("match_id") REFERENCES "Matches" ("id");

ALTER TABLE "Lineups" ADD FOREIGN KEY ("team_id") REFERENCES "Teams" ("id");

ALTER TABLE "Results" ADD FOREIGN KEY ("team_id") REFERENCES "Teams" ("id");

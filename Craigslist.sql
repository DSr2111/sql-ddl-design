CREATE TABLE "Locations" (
  "id" integer,
  "name" text,
  "city" text,
  "state" text
);

CREATE TABLE "Posts" (
  "id" integer,
  "user_id" integer,
  "title" text,
  "body" text,
  "location_id" integer,
  "category_id" integer,
  "region_id" integer
);

CREATE TABLE "User" (
  "id" integer,
  "first_name" text,
  "last_name" text,
  "preferred_region_id" integer
);

CREATE TABLE "Category" (
  "id" integer,
  "name" text
);

CREATE TABLE "Region" (
  "id" integer,
  "name" text
);

ALTER TABLE "Region" ADD FOREIGN KEY ("id") REFERENCES "User" ("preferred_region_id");

ALTER TABLE "Posts" ADD FOREIGN KEY ("location_id") REFERENCES "Locations" ("id");

ALTER TABLE "Posts" ADD FOREIGN KEY ("user_id") REFERENCES "User" ("id");

ALTER TABLE "Category" ADD FOREIGN KEY ("id") REFERENCES "Posts" ("category_id");

ALTER TABLE "Region" ADD FOREIGN KEY ("id") REFERENCES "Posts" ("region_id");

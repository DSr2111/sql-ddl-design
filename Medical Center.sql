CREATE TABLE "Medical_Center" (
  "id" integer,
  "name" text,
  "city" text,
  "province" text
);

CREATE TABLE "Doctors" (
  "id" integer,
  "first_name" text,
  "last_name" text,
  "medical_center_id" integer,
  "patient_seen" integer
);

CREATE TABLE "Patients" (
  "id" integer,
  "first_name" text,
  "last_name" text,
  "doctor_seen" integer
);

CREATE TABLE "Diseases" (
  "id" integer,
  "name" text
);

CREATE TABLE "Visit_Diagnosis" (
  "id" integer,
  "doctor_id" integer,
  "patient_id" integer,
  "disease_id" integer
);

ALTER TABLE "Doctors" ADD FOREIGN KEY ("medical_center_id") REFERENCES "Medical_Center" ("id");

ALTER TABLE "Visit_Diagnosis" ADD FOREIGN KEY ("patient_id") REFERENCES "Patients" ("id");

ALTER TABLE "Visit_Diagnosis" ADD FOREIGN KEY ("doctor_id") REFERENCES "Doctors" ("id");

ALTER TABLE "Visit_Diagnosis" ADD FOREIGN KEY ("disease_id") REFERENCES "Diseases" ("id");

ALTER TABLE "Doctors" ADD FOREIGN KEY ("id") REFERENCES "Patients" ("doctor_seen");

ALTER TABLE "Patients" ADD FOREIGN KEY ("id") REFERENCES "Doctors" ("patient_seen");

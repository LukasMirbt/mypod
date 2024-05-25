BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "example" (
    "id" serial PRIMARY KEY,
    "name" text NOT NULL,
    "data" integer NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "note" (
    "id" serial PRIMARY KEY,
    "text" text NOT NULL
);


--
-- MIGRATION VERSION FOR mypod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('mypod', '20240525161542960', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240525161542960', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;

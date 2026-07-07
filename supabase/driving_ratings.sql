-- Run this once in the Supabase SQL editor of the INTERNAL project
-- (ref nabcgxkbsdbqjgbsziep). Creates a dedicated schema + table that
-- backs the "how's my driving" rating page, kept separate from
-- `public` so it doesn't mix with the other apps in this project.
--
-- Row Level Security is ON. The anon/publishable key can INSERT new
-- ratings (so anyone visiting the page can submit one) and SELECT all
-- ratings (so the page can display the running list + average), but
-- cannot UPDATE or DELETE with that key.
--
-- IMPORTANT: after running this, go to
-- Project Settings -> API -> Exposed schemas (in the Supabase dashboard)
-- and add "rate_my_driving" to the list. PostgREST only serves schemas
-- that are explicitly exposed there — without this step the site's
-- requests will 404/permission-error even though the table exists.

create schema if not exists rate_my_driving;

grant usage on schema rate_my_driving to anon, authenticated;

create table if not exists rate_my_driving.driving_ratings (
  id          uuid primary key default gen_random_uuid(),
  created_at  timestamptz not null default now(),
  stars       smallint not null check (stars between 1 and 5),
  comment     text
);

alter table rate_my_driving.driving_ratings enable row level security;

drop policy if exists "Public can submit ratings" on rate_my_driving.driving_ratings;
drop policy if exists "Public can read ratings" on rate_my_driving.driving_ratings;

create policy "Public can submit ratings"
  on rate_my_driving.driving_ratings
  for insert
  to anon, authenticated
  with check (true);

create policy "Public can read ratings"
  on rate_my_driving.driving_ratings
  for select
  to anon, authenticated
  using (true);

grant select, insert on rate_my_driving.driving_ratings to anon, authenticated;

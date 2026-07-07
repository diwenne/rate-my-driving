-- Run this once in the Supabase SQL editor of the INTERNAL project
-- (ref nabcgxkbsdbqjgbsziep). Creates the table that backs the
-- "how's my driving" rating page.
--
-- Row Level Security is ON. The anon/publishable key can INSERT new
-- ratings (so anyone visiting the page can submit one) and SELECT all
-- ratings (so the page can display the running list + average), but
-- cannot UPDATE or DELETE with that key.

create table if not exists public.driving_ratings (
  id          uuid primary key default gen_random_uuid(),
  created_at  timestamptz not null default now(),
  stars       smallint not null check (stars between 1 and 5),
  comment     text
);

alter table public.driving_ratings enable row level security;

drop policy if exists "Public can submit ratings" on public.driving_ratings;
drop policy if exists "Public can read ratings" on public.driving_ratings;

create policy "Public can submit ratings"
  on public.driving_ratings
  for insert
  to anon, authenticated
  with check (true);

create policy "Public can read ratings"
  on public.driving_ratings
  for select
  to anon, authenticated
  using (true);

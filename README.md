# How's My Driving?

A tiny homemade site where people can rate your driving out of 5 stars and leave a comment.

## Setup

1. Open the Supabase SQL editor for the internal project (ref `nabcgxkbsdbqjgbsziep`) and run `supabase/driving_ratings.sql` once. This creates the `driving_ratings` table with RLS policies that let anyone submit and read ratings, but not edit or delete them.
2. That's it — `index.html` is a fully self-contained static page (uses the public anon key, safe to expose since RLS locks down what it can do).

## Hosting on GitHub Pages

1. Create a new GitHub repo (public) and push this folder to it.
2. In the repo settings, enable GitHub Pages, serving from the `main` branch root.
3. Your site will be live at `https://<username>.github.io/<repo-name>/`.

# How's My Driving?

A tiny homemade site where people can rate your driving out of 5 stars and leave a comment.

## Setup

Backed by a dedicated Firebase project (`rate-my-driving-hmd`), kept separate from any other apps.

1. Firestore database, security rules (`firebase/firestore.rules`), and the web app config baked into `index.html` are already provisioned. The rules let anyone create a rating and read the list, but not update or delete one.
2. To change the rules, edit `firebase/firestore.rules` and run `firebase deploy --only firestore:rules` (requires the Firebase CLI logged into an account with access to the project).
3. `index.html` is a fully self-contained static page — the Firebase config in it is not secret (same trust model as Supabase's anon key); access is enforced entirely by the security rules.

## Hosting on GitHub Pages

1. Create a new GitHub repo (public) and push this folder to it.
2. In the repo settings, enable GitHub Pages, serving from the `main` branch root.
3. Your site will be live at `https://<username>.github.io/<repo-name>/`.

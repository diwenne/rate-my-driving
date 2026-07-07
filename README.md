# How's My Driving?

A tiny homemade site where people can rate your driving out of 5 stars and leave a comment.

## Setup

Backed by a dedicated Firebase project (`rate-my-driving-hmd`), kept separate from any other apps.

1. Firestore database, security rules (`firebase/firestore.rules`), and the web app config baked into `index.html` are already provisioned. The rules let anyone create a rating and read the list. Delete is open at the rules level too — the page gates it behind a password prompt (the "·" next to the footer) purely in client-side JS. That's obscurity, not real access control: there's no Firebase Auth wired up, so a technical visitor could bypass the prompt and delete ratings directly. Good enough to stop casual clicking, not a determined attacker.
2. To change the rules, edit `firebase/firestore.rules` and run `firebase deploy --only firestore:rules` (requires the Firebase CLI logged into an account with access to the project).
3. `index.html` is a fully self-contained static page — the Firebase config in it is not secret (same trust model as Supabase's anon key); create/read access is enforced by the security rules, delete is not.

## Hosting on GitHub Pages

1. Create a new GitHub repo (public) and push this folder to it.
2. In the repo settings, enable GitHub Pages, serving from the `main` branch root.
3. Your site will be live at `https://<username>.github.io/<repo-name>/`.

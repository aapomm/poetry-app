# Caveman Poetry

A real-time multiplayer word party game built with Ruby on Rails. Players split into two teams — **Mad** and **Glad** — and take turns describing or acting out words while their judge scores them.

## How It Works

1. A host creates a game and shares the 4-letter code with friends
2. Players join via the code and the host starts when everyone is ready
3. Players are randomly shuffled into two teams: **Mad** and **Glad**
4. Each turn, one player performs and one acts as judge
5. Sub-turns present two words: an easy word (1 point) and a hard word (3 points)
6. The judge marks words as scored or unscored; skipping or bonking a word costs 1 point
7. Turns are timed — the game moves to the next player when time runs out or words run out
8. After all rounds, the team with the most points wins

## Tech Stack

- **Ruby** 3.3.6
- **Rails** 8
- **SQLite** (via persistent volume in production)
- **Turbo Streams / ActionCable** for real-time updates
- Deployed on **Fly.io**

## Setup

```bash
bin/setup
```

This installs dependencies, prepares the database, and starts the dev server.

To set up without starting the server:

```bash
bin/setup --skip-server
```

Then start the server manually:

```bash
bin/dev
```

## Game Configuration

| Setting        | Default  | Range          |
|----------------|----------|----------------|
| Rounds         | 2        | 1 – 10         |
| Time per turn  | 2 min    | 5s – 10 min    |

## Deployment

The app is deployed to Fly.io as `caveman-poetry` in the `sin` (Singapore) region.

```bash
fly deploy
```

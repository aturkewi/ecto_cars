# EctoCars

This repo is for a [blog post](INSERT LINK HERE) about composable ecto queries.

## Getting started

- Clone down this repo to your local with `git clone git@github.com:aturkewi/ecto_cars.git` and cd into the directory with `cd ecto_cars`
- Run `mix deps.get`
- Create your database with `mix ecto.create` and run migrations with `mix ecto.migrate`
- Seed your data by getting into an iex session with `iex -S mix`
  - Once in the IEX session, run `Mix.Tasks.Seed.run([])` to see your data from [here](https://github.com/aturkewi/ecto_cars/blob/master/lib/mix/tasks/seed.ex).

If you want to following along with the blog post, jump to the start with `git checkout tags/start`. 

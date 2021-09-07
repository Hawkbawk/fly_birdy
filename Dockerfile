FROM elixir:1.12

WORKDIR /usr/src/app

# Install Hex package manager and rebar, which is required by cowboy.
RUN mix local.hex --force
RUN mix local.rebar --force

# Install nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get -qq update && apt-get install -qy --no-install-recommends \
  nodejs \
  inotify-tools

COPY mix.exs mix.exs
COPY mix.lock mix.lock

COPY assets/package.json assets/package.json
COPY assets/package-lock.json assets/package-lock.json

RUN mix deps.get
RUN npm install --prefix assets

COPY . .

EXPOSE 4000

CMD mix phx.server

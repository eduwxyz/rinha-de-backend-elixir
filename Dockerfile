FROM elixir:1.15.1-alpine


WORKDIR /app

RUN apk add --no-cache git ncurses libstdc++ libgcc && \
    mix local.hex --force && \
    mix local.rebar --force


COPY mix.exs mix.lock ./

RUN mix deps.get
RUN mix deps.compile

ENV MIX_ENV=prod

COPY . .

RUN mix do compile


ENV PORT=3000
EXPOSE 3000

CMD ["mix", "phx.server"]
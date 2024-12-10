CREATE TABLE public.actor_films (
    Actor TEXT,
    ActorId Text,
    Film TEXT,
    Year integer,
    votes Integer,
    Rating REAL,
    FilmID text,
    PRIMARY KEY(ActorId, FilmId)
)
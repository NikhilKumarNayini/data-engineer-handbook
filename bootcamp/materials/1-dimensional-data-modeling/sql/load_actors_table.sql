WITH yearly_films AS (
    SELECT
        actor,
        actorid,
        film,
        year,
        votes,
        rating,
        filmid
    FROM
        "public".actor_films
    GROUP BY
        actor, actorid, film, year, votes, rating, filmid
),
classified_films AS (
    SELECT
        actor,
        actorid,
        film,
        votes,
        rating,
        filmid,
        year,
        CASE
            WHEN rating > 8 THEN 'star'
            WHEN rating > 7 THEN 'good'
            WHEN rating > 6 THEN 'average'
            ELSE 'bad'
        END AS film_quality_class
    FROM
        yearly_films
)
INSERT INTO public.actors (actorid, actor_name, films, quality_class, is_active)
SELECT
    actorid,
    actor,
    JSONB_AGG(
            json_build_object(
                'film', film,
                'votes', votes,
                'rating', rating,
                'filmid', filmid
        )
    ) AS films,
    film_quality_class AS quality_class,
    true -- Assuming they are active for the current year
FROM
    classified_films
GROUP BY
    actorid, actor, film_quality_class;
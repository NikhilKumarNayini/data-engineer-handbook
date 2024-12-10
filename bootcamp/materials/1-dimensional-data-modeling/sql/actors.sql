
CREATE TABLE if not exists public.actors (
    actorid VARCHAR(255) NOT NULL,
    actor_name VARCHAR(255) NOT NULL,
    films JSONB,
    quality_class VARCHAR(50) NOT NULL CHECK (quality_class IN ('star', 'good', 'average', 'bad')),
    is_active BOOLEAN
);
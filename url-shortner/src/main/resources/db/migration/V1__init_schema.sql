CREATE TABLE users (
    id            BIGSERIAL PRIMARY KEY,
    email         VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at    TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    updated_at    TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_users_email ON users (email);

CREATE TABLE short_urls (
    id          BIGSERIAL PRIMARY KEY,
    short_code  VARCHAR(20)  NOT NULL UNIQUE,
    long_url    TEXT         NOT NULL,
    user_id     BIGINT REFERENCES users (id),
    expires_at  TIMESTAMPTZ,
    click_count BIGINT       NOT NULL DEFAULT 0,
    created_at  TIMESTAMPTZ  NOT NULL DEFAULT NOW(),
    deleted_at  TIMESTAMPTZ
);

CREATE UNIQUE INDEX idx_short_urls_short_code ON short_urls (short_code) WHERE deleted_at IS NULL;
CREATE INDEX idx_short_urls_user_id ON short_urls (user_id);
CREATE INDEX idx_short_urls_expires_at ON short_urls (expires_at) WHERE expires_at IS NOT NULL;

CREATE TABLE click_events (
    id           BIGSERIAL PRIMARY KEY,
    short_url_id BIGINT      NOT NULL REFERENCES short_urls (id),
    clicked_at   TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    ip_address   VARCHAR(45),
    country_code VARCHAR(2),
    user_agent   TEXT,
    referrer     TEXT,
    device_type  VARCHAR(20),
    browser      VARCHAR(50)
);

CREATE INDEX idx_click_events_short_url_id_clicked_at ON click_events (short_url_id, clicked_at DESC);
CREATE INDEX idx_click_events_country_code ON click_events (country_code);

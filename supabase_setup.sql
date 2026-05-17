-- Run this in Supabase → SQL Editor

CREATE TABLE IF NOT EXISTS price_history (
    id         bigserial PRIMARY KEY,
    product_name text NOT NULL,
    shop         text NOT NULL,
    price        numeric(10,2) NOT NULL,
    currency     text NOT NULL DEFAULT 'EUR',
    checked_at   timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_ph_product_time
    ON price_history (product_name, checked_at DESC);

-- Row Level Security
ALTER TABLE price_history ENABLE ROW LEVEL SECURITY;

CREATE POLICY "anon_read"   ON price_history FOR SELECT USING (true);
CREATE POLICY "anon_insert" ON price_history FOR INSERT WITH CHECK (true);

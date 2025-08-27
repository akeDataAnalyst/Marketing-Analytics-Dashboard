-- Deliverable 2: Campaign Performance & ROI
-- Calculate Total Revenue Per User
SELECT
    user_id,
    SUM(
        CASE
            WHEN event_name = 'chapter_purchase' THEN 1.99
            WHEN event_name = 'subscription_start' THEN 9.99
            ELSE 0
        END
    ) AS total_revenue
FROM
    app_events
GROUP BY
    user_id;
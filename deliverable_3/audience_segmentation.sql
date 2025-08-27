-- Audience Segmentation
-- Step 1: Calculate Recency, Frequency, and Monetary Values
SELECT
    u.user_id,
    u.acquisition_channel,
    DATEDIFF(CURDATE(), MAX(a.timestamp)) AS recency,
    COUNT(
        CASE
            WHEN a.event_name IN ('chapter_purchase', 'subscription_start') THEN 1
            ELSE NULL
        END
    ) AS frequency,
    SUM(
        CASE
            WHEN a.event_name = 'chapter_purchase' THEN 1.99
            WHEN a.event_name = 'subscription_start' THEN 9.99
            ELSE 0
        END
    ) AS monetary
FROM
    users u
JOIN
    app_events a ON u.user_id = a.user_id
GROUP BY
    u.user_id, u.acquisition_channel
ORDER BY
    recency ASC, frequency DESC, monetary DESC;
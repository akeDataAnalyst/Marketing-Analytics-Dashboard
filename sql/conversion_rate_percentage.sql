-- Deliverable 1: User Path & Conversion Analysis (SQL)
-- Step 2: Join with User Data and Calculate Conversions
SELECT
    u.acquisition_channel,
    COUNT(u.user_id) AS total_signups,
    COUNT(t1.user_id) AS converted_users,
    (COUNT(t1.user_id) / COUNT(u.user_id)) * 100 AS conversion_rate_percentage
FROM
    users u
LEFT JOIN
    (
        SELECT
            user_id,
            MIN(timestamp) AS first_key_action_date
        FROM
            app_events
        WHERE
            event_name IN ('story_read', 'chapter_purchase')
        GROUP BY
            user_id
    ) t1 ON u.user_id = t1.user_id
GROUP BY
    u.acquisition_channel
ORDER BY
    converted_users DESC;
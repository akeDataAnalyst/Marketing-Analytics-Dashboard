-- First Key Action for Each User
SELECT
    user_id,
    MIN(timestamp) AS first_key_action_date
FROM
    app_events
WHERE
    event_name IN ('story_read', 'chapter_purchase')
GROUP BY
    user_id;
-- Step 2: Combine Everything to Calculate CAC & ROAS
SELECT
    c.campaign_name,
    c.cost,
    COUNT(u.user_id) AS users_acquired,
    c.cost / COUNT(u.user_id) AS customer_acquisition_cost,
    SUM(revenue.total_revenue) AS total_revenue,
    SUM(revenue.total_revenue) / c.cost AS return_on_ad_spend
FROM
    campaigns c
INNER JOIN
    users u ON c.campaign_name = u.acquisition_channel
LEFT JOIN
    (
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
            user_id
    ) AS revenue ON u.user_id = revenue.user_id
WHERE
    c.cost > 0
GROUP BY
    c.campaign_name, c.cost
ORDER BY
    return_on_ad_spend DESC;
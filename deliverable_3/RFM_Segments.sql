-- Step 2: Assign RFM Segments
WITH user_rfm AS (
    SELECT
        u.user_id,
        DATEDIFF(CURDATE(), MAX(a.timestamp)) AS recency_days,
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
        u.user_id
), rfm_scores AS (
  SELECT
    user_id,
    NTILE(4) OVER (ORDER BY recency_days DESC) AS r_score, -- Lowest recency_days (most recent) gets a higher score
    NTILE(4) OVER (ORDER BY frequency ASC) AS f_score, -- Highest frequency gets a higher score
    NTILE(4) OVER (ORDER BY monetary ASC) AS m_score -- Highest monetary value gets a higher score
  FROM user_rfm
)
SELECT
  user_id,
  r_score,
  f_score,
  m_score,
  CASE
    WHEN r_score = 4 AND f_score = 4 AND m_score = 4 THEN 'Champions'
    WHEN r_score IN (4,3) AND f_score = 4 AND m_score = 4 THEN 'Loyal Champions'
    WHEN r_score = 4 AND f_score = 3 AND m_score = 3 THEN 'Loyal'
    WHEN r_score IN (4,3) AND f_score IN (2, 3) AND m_score IN (3, 4) THEN 'Potential Loyalists'
    WHEN r_score IN (2, 3) AND f_score = 4 AND m_score IN (3, 4) THEN 'Loyal'
    WHEN r_score IN (3, 4) AND f_score BETWEEN 1 AND 2 AND m_score BETWEEN 1 AND 4 THEN 'New Customers'
    WHEN r_score IN (1, 2) AND f_score BETWEEN 3 AND 4 AND m_score BETWEEN 3 AND 4 THEN 'At Risk'
    WHEN r_score IN (1, 2) AND f_score IN (1, 2) AND m_score IN (1, 2) THEN 'Hibernating'
    ELSE 'Other'
  END AS customer_segment
FROM rfm_scores
ORDER BY user_id;
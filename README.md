# Marketing Analytics Dashboard: A Data-Driven Approach to User Acquisition & Segmentation
This project demonstrates a complete marketing analytics workflow, from raw data to actionable business insights. The goal was to build an interactive dashboard to track Key Performance Indicators (KPIs), analyze channel performance, and segment the user base for a fictional app. The dashboard provides a single source of truth for marketing stakeholders to make data-driven decisions.

[Tableau Dashboard](scre/tabluescre.PNG)

## Project Phases

This project was completed in three main phases:
1. Data Preparation & Engineering (MySQL)
In this initial phase, the core data was prepared using MySQL queries. Key deliverables included:
•	User Acquisition & Conversion Analysis: Queries were written to identify key user journeys, from sign-up to their first key action (conversion), providing the foundation for the entire analysis.
•	Path & Conversion Analysis: Specific SQL was used to trace user behavior and calculate conversion rates, which are critical for understanding funnel performance.
•	Data Aggregation: The results were aggregated and prepared for more complex analysis in the next phase.

[MySQL](scre/scr_mysql.PNG)

2. Data Transformation & Segmentation (Python)
Following the initial MySQL analysis, Python was used for more complex data transformation that would be challenging to do with SQL alone. The key steps included:
•	RFM (Recency, Frequency, Monetary) Analysis: Users were segmented into groups like "Champions," "Loyalists," and "At Risk" based on their behavioral data.
•	ROAS (Return on Ad Spend) Calculation: A custom calculation was created to accurately measure the return on investment for each marketing channel, ensuring accuracy by handling repeated cost data.
•	Data Export: The final, prepared dataset was exported as a single CSV file, ready for visualization in Tableau.

3. Dashboard Design & Visualization (Tableau)
Using the cleaned and segmented data, an interactive and easy-to-use dashboard was built in Tableau. The dashboard focuses on three key areas:
•	Top-Level KPIs: Single-value metrics for Total Users, Overall Conversion Rate, Total Revenue, and Overall ROAS.
•	Channel Performance: Visualizations comparing the effectiveness and profitability of different acquisition channels (Google, Facebook, Instagram, Organic).
•	Audience Segmentation: A scatter plot and pie chart to visualize the distribution of user segments and help identify high-value customers.

## Key Insights & Recommendations
Based on the dashboard's KPIs, the following insights and recommendations have been identified:
•	**Insight 1**: Instagram is the Most Profitable Channel.
    o	*Finding*: Instagram has the highest Overall ROAS at 1.33, meaning it generates $1.33 for every $1.00 spent. This is a highly profitable channel and a key driver of revenue.
    o	*Recommendation*: Increase investment in Instagram campaigns. Analyze the creative and targeting strategies used on this channel and replicate its success where possible.
•	**Insight 2**: Facebook is Underperforming.
    o	*Finding*: Facebook has the lowest Overall ROAS at 0.356, indicating a significant loss. It costs nearly three times as much to acquire revenue from Facebook as it does from Instagram.
    o	*Recommendation*: Re-evaluate the Facebook strategy. Consider A/B testing new ad copy, visuals, and audience targeting. If performance doesn't improve, decrease or reallocate the budget.
•	**Insight 3**: High-Quality Organic Users.
    o	*Finding*: The Organic channel has the highest Overall Conversion Rate at 87.5%. These users are highly engaged and valuable, generating a significant amount of revenue at no direct cost.
    o	*Recommendation*: Focus on content marketing and SEO. Invest in strategies that naturally attract more organic traffic, as these users are a high-quality, zero-cost asset.
•	**Insight 4**: Overall Profitability is Neutral.
    o	*Finding*: The Overall ROAS for all channels is 0.918, meaning the marketing efforts as a whole are close to breaking even. While some channels are profitable, the losses from others (like Facebook) are holding back overall performance.
    o	*Recommendation*: Optimize for profitability. By reallocating budget from underperforming to high-performing channels, you can quickly turn the overall negative ROAS into a positive one.

**Technologies Used**
•	**MySQL**: For initial data querying and aggregation.
•	**Python**: For advanced data transformation and segmentation.
•	**Pandas & NumPy**: Essential libraries for data manipulation.
•	**Tableau**: For dashboard design and data visualization.



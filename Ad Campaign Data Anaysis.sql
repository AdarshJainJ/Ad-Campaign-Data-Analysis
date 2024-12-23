
# Create Database Called Marketing
CREATE DATABASE MARKETING;

# Use Marketing Database
USE MARKETING;

# Create Table Called Campaign
CREATE TABLE CAMPAIGN 
(
ID INT PRIMARY KEY,
CAMPAIGN_DATE DATETIME,
CAMPAIGN_NAME VARCHAR(50),
CATEGORY VARCHAR(30),
CAMPAIGN_ID INT,
IMPRESSIONS INT,
SPENT FLOAT,
CLICKS INT,
LEADS INT,
ORDERS INT,
REVENUE FLOAT);

# View the Table Created
SELECT * FROM CAMPAIGN;

-- Calculate the Important KPIs of the Ad Campaign

#1. Calculate the Customer Acquisition Cost (CAC)

SELECT CAMPAIGN_NAME, (SUM(SPENT)/SUM(LEADS)) AS CAC FROM CAMPAIGN GROUP BY CAMPAIGN_NAME ORDER BY CAC DESC;

-- Interpretation: Facebook campaigns and has high CAC, we can optimize the FB campaigns with more precise targeting to get high leads.

#2. Calculate the Return On Ad Spent (ROAS)

SELECT CAMPAIGN_NAME, (((SUM(REVENUE)-SUM(SPENT)) / SUM(SPENT)) * 100) AS ROAS FROM CAMPAIGN GROUP BY CAMPAIGN_NAME ORDER BY ROAS DESC; 

-- Interpretation: FB campaigns, Instagram_tier2 campaigns had negative ROAS, we need to review the creative again & Google search Ad also had
-- negative ROAS it needs better keyword optimization.

#3. Calculate CLick-Through Rate (CTR):

SELECT CAMPAIGN_NAME, (SUM(CLICKS) / SUM(IMPRESSIONS)) * 100 AS CTR FROM CAMPAIGN GROUP BY CAMPAIGN_NAME ORDER BY CTR DESC;

-- Interpretation: FB retargeting campaign is performing well, while other FB campaigns are underperforming in all the metrics 
-- this clearly shows optimization is required in targeting of other FB campaigns and other Display ads are getting low CTR review the creative.

#4. Calculate the Cost Per Click (CPC)

SELECT CAMPAIGN_NAME, CAST((SUM(SPENT)/SUM(CLICKS)) AS DECIMAL(10, 2)) AS CPC FROM CAMPAIGN GROUP BY CAMPAIGN_NAME ORDER BY CPC DESC;

-- Interpretation: Again, FB campaigns has high CPC greater than search Ads, this clearly shows the optimization is also needed in bidding.
-- As the goal of FB & Insta campaigns is more towards Brand Awarness while Search Ads is for quick Clicks & Leads

#5. Calculate Cost Per Lead (CPL)

SELECT CAMPAIGN_NAME, CAST((SUM(SPENT)/SUM(LEADS)) * 100 AS DECIMAL(10,2)) AS CPL FROM CAMPAIGN GROUP BY CAMPAIGN_NAME ORDER BY CPL DESC;

-- Interpretation: Again, CPL is high for FB ads than Search Ads, unless it's the Lead Generation Campaign in FB then so high CPL is not needed.
-- Proper Bidding strategy need to be implemented in FB, Insta & Search Campaigns

#6. Calculate Cost Per Mile (CPM)

SELECT CAMPAIGN_NAME, CAST((SUM(SPENT)/SUM(IMPRESSIONS)) * 1000 AS DECIMAL(10,2)) AS CPM FROM CAMPAIGN GROUP BY CAMPAIGN_NAME ORDER BY CPM DESC;

-- Interpretation: Banner_partner display ad campaign has least CPM showing that optimization might be needed in Targeting the proper 
-- niche Audience (Can't conclude only based on this metric further investigation has to be done). FB retargeting has high CPM which is good.

#6. Calculate Revenue Per Click (RPC)

SELECT CAMPAIGN_NAME, (SUM(REVENUE)/SUM(CLICKS)) AS RPC FROM CAMPAIGN GROUP BY CAMPAIGN_NAME ORDER BY RPC DESC;

-- Interpretation: FB re-targeting has high RPC showing the best targeting startegy, Google Display and Google Search campaigns had less RPC 
-- showing not good tagrgeting strategy

#7. Calculate Average Order Value (AOV)

SELECT CAMPAIGN_NAME, (SUM(REVENUE)/SUM(ORDERS)) AS AOV FROM CAMPAIGN GROUP BY CAMPAIGN_NAME ORDER BY AOV DESC;

-- Interpretation: Influencer Campaigns from FB & Insta has high AOV showing that Audience Conversion rate is high when partnered with influencers.

#8. Calculate Customer Segment Profitability (CSP) based on Category:

SELECT CATEGORY, CAST((SUM(REVENUE) - SUM(SPENT)) AS DECIMAL(10,2)) AS PROFIT FROM CAMPAIGN GROUP BY CATEGORY ORDER BY PROFIT DESC;

-- Interpretation: Influencer campaigns has high profits followed by Display & Search Ads. 
-- But Social Media campaigns has severe loss, it's time to sunset Social existing campaigns and came up with new optimization startegy. 

/*
    Select Data
*/

--1
SELECT t_name 
FROM Influencers;

--2
SELECT t_name 
FROM SocialMediaPlatforms;

--3
SELECT t_name 
FROM Influencers 
WHERE t_age > 25;

--4
SELECT t_name 
FROM Brands 
WHERE t_category = 'beauty';

--5
SELECT COUNT(t_name) AS '50K+'
FROM Influencers 
WHERE t_instagram_followers = 50000;

--6
SELECT t_name 
FROM SocialMediaPlatforms 
WHERE t_average_user_age = (
    SELECT MIN(t_average_user_age) 
    FROM SocialMediaPlatforms );

--7
SELECT t_name
FROM Influencers, Collaborations
WHERE Collaborations.t_brand_id = 1 
	AND Collaborations.t_influencer_id = Influencers.t_influencer_id;

--8
SELECT t_name
FROM SocialMediaPlatforms
WHERE t_total_users > 1000000;

--9
SELECT t_name
FROM Influencers
WHERE t_age > 24 
	AND t_age < 31;

--10
SELECT DISTINCT Brands.t_name
FROM Brands, Collaborations
WHERE Brands.t_brand_id NOT IN (
		SELECT Collaborations.t_brand_id 
		FROM Collaborations 
		WHERE t_platform_id = 4
	);

--11
SELECT DISTINCT Brands.t_name
FROM Brands, Collaborations
WHERE Brands.t_brand_id = (
	SELECT t_brand_id
	FROM Collaborations
	WHERE t_duration = (
		SELECT MAX(t_duration) 
		FROM Collaborations
		)
	);

--11.2 I figured the where clause might be hard to read, so i treid with join. I still prefer my first option...
SELECT DISTINCT Brands.t_name
FROM Brands
jOIN Collaborations
	ON Brands.t_brand_id = Collaborations.t_brand_id
WHERE t_duration = (
	SELECT MAX(t_duration) 
	FROM Collaborations
);

--12
SELECT Influencers.t_name, COUNT(Collaborations.t_influencer_id) AS "Count"
FROM Influencers, Collaborations
WHERE Collaborations.t_influencer_id = Influencers.t_influencer_id
GROUP BY Influencers.t_name;

--13
SELECT DISTINCT Brands.t_name
FROM Collaborations
LEFT JOIN Influencers
	ON Influencers.t_influencer_id = Collaborations.t_influencer_id 
LEFT JOIN Brands
	ON Brands.t_brand_id = Collaborations.t_brand_id
WHERE Influencers.t_instagram_followers > 40000;

--14
SELECT SocialMediaPlatforms.t_name, AVG(Influencers.t_age) AS "Average Age"
FROM Collaborations
LEFT JOIN Influencers
	ON Influencers.t_influencer_id = Collaborations.t_influencer_id
LEFT JOIN SocialMediaPlatforms
	ON SocialMediaPlatforms.t_platform_id = Collaborations.t_platform_id
GROUP BY SocialMediaPlatforms.t_name;

--15
SELECT Influencers.t_name, COUNT(Collaborations.t_brand_id) AS 'Mush'
FROM Collaborations
JOIN Influencers
	ON Influencers.t_influencer_id = Collaborations.t_influencer_id
WHERE (
	SELECT COUNT(*) 
	FROM Collaborations
	WHERE Collaborations.t_influencer_id = Influencers.t_influencer_id
	) > 1
GROUP BY Influencers.t_name;

--16

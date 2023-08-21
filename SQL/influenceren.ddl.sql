/*
    Create the database and it's tables.
*/

--create the database
USE master;
DROP DATABASE Influenceren;
CREATE DATABASE Influenceren;
GO
--go to the database
USE Influenceren;

--create each table in the database
CREATE TABLE Influencers( 
	t_influencer_id int PRIMARY KEY,
	t_name varchar(50) NOT NULL,
	t_age int,
	t_instagram_followers int
);

CREATE TABLE SocialMediaPlatforms(
  t_platform_id int PRIMARY KEY,
  t_name varchar(30) NOT NULL,
  t_average_user_age float,
  t_total_users bigint
);

CREATE TABLE Brands(
  t_brand_id int PRIMARY KEY,
  t_name varchar(30) NOT NULL,
  t_category varchar(30) NOT NULL
);

CREATE TABLE Collaborations(
  t_collaboration_id int PRIMARY KEY,
  t_influencer_id int FOREIGN KEY REFERENCES Influencers(t_influencer_id),
  t_brand_id int FOREIGN KEY REFERENCES Brands(t_brand_id),
  t_platform_id int FOREIGN KEY REFERENCES SocialMediaPlatforms(t_platform_id),
  t_duration smallint,
  t_payment float,
);

/*
    --Populate the tables with data
*/

INSERT INTO Influencers( t_influencer_id, t_name, t_age, t_instagram_followers )
VALUES
(1,'Anna', 24, 50000),
(2,'Bent',22,20000),
(3,'Caroline',26,80000),
(4,'David',28,45000),
(5,'Ella',30,70000),
(6,'Frank',27,32000),
(7,'Grace',29,92000),
(8,'Henry',31,48000);

INSERT INTO SocialMediaPlatforms( t_platform_id, t_name, t_average_user_age, t_total_users )
VALUES
(1,'Instagram',24.5,1000000),
(2,'TikTok',18.5,2000000),
(3,'YouTube',28.5,1500000),
(4,'Snapchat',20.0,800000),
(5,'Twitter',27.5,500000),
(6,'Facebook',32.5,2000000),
(7,'Pinterest',29.0,600000),
(8,'LinkedIn',34.0,400000);

INSERT INTO Brands( t_brand_id, t_name, t_category )
VALUES
(1,'FashionCO','fasion'),
(2,'BeautyBliss','beauty'),
(3,'TechTron','technology'),
(4,'GlamGlow','beauty'),
(5,'SportSpot','sports'),
(6,'EcoEssentials','lifestyle'),
(7,'TrendTech','technology'),
(8,'MystiqueMakeup','beauty');

INSERT INTO Collaborations( t_collaboration_id, t_influencer_id, t_brand_id, t_platform_id, t_duration, t_payment )
VALUES
(1,1,1,1,30,5000.00),
(2,2,3,2,10,3000.50),
(3,3,2,3,20,7500.00),
(4,4,4,4,15,2500.00),
(5,1,2,1,25,6000.50),
(6,3,1,2,40,6500.75),
(7,5,5,5,45,5300.00),
(8,6,6,6,20,3500.25),
(9,7,7,7,15,4700.50),
(10,8,8,8,25,2900.00),
(11,5,7,1,30,5100.75),
(12,6,5,2,40,4400.00),
(13,7,6,3,35,6500.25),
(14,8,7,4,20,7000.50);

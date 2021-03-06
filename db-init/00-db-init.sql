/* initialize beer, breweries, and distributors */
DROP DATABASE IF EXISTS beerapi;

CREATE DATABASE beerapi;

USE beerapi;


CREATE TABLE breweries(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    zip INT NOT NULL,
    phone VARCHAR(15) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE beer(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    style VARCHAR(24) NOT NULL,
    abv FLOAT NULL,
    ibu FLOAT NULL,
    description TEXT NULL,
    image VARCHAR(255) NULL,
    brewerid INT NOT NULL,

    FOREIGN KEY (brewerid) REFERENCES breweries(id)
        ON DELETE CASCADE,

    PRIMARY KEY (id)
);

CREATE TABLE distributors(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    zip INT NOT NULL,
    phone VARCHAR(15) NOT NULL,
    ownerid CHAR(24) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE beerDistributors(
    beerid INT NOT NULL,
    distributorid INT NOT NULL,

    PRIMARY KEY (beerid, distributorid)
);

INSERT INTO breweries(id,name,address,city,state,zip,phone) VALUES (1,'Deschutes Brewery','1044 NW Bond Street','Bend','OR',97703,'541-382-9242');
INSERT INTO breweries(id,name,address,city,state,zip,phone) VALUES (2,'Ninkasi Brewery','272 Van Buren Street','Eugene','OR',97402,'541-344-2739');
INSERT INTO breweries(id,name,address,city,state,zip,phone) VALUES (3,'Block 15 Brewing Company','3415 SW Deschutes St','Corvallis','OR',97333,'541-752-2337');

INSERT INTO beer(name,style,abv,ibu,description,image,brewerid) VALUES ('Deschutes River Ale','Hybrid/mixed Beer',3.9,28,'Here’s a session ale that’s clean and refreshing enough for the long haul, but fully graced with hop aroma, malt poise and clear craft passion.  Sit back, relax and let the subtle pleasures reveal.','https://s3.amazonaws.com/brewerydbapi/beer/So05N1/upload_2KrnoD-large.png',1);
INSERT INTO beer(name,style,abv,ibu,description,image,brewerid) VALUES ('The Abyss Barrel Aged Scotch','American Imperial Stout',12.3,42,'Complex earthy, smoky, and oak notes play against a refined, yet boozy, mix of sweet and bitterness.',NULL,1);
INSERT INTO beer(name,style,abv,ibu,description,image,brewerid) VALUES ('Fresh Squeezed IPA','American IPA',6.4,60,'This mouthwateringly delicious IPA gets its flavor from a heavy helping of citra and mosaic hops. Don''t worry, no fruit was harmed in the making of this beer.','https://s3.amazonaws.com/brewerydbapi/beer/NKIjJb/upload_RThmwE-large.png',1);
INSERT INTO beer(name,style,abv,ibu,description,image,brewerid) VALUES ('Total Domination IPA','American IPA',6.7,65,'Multiple hops collide in balanced perfection, dominating the senses, achieving total satisfaction. From the Pacific Northwest, birthplace of the modern IPA, comes a beer whose name says it all. Total Domination has a citrusy, floral hop aroma, and big hop flavor balanced with a richness imparted by Carahell and Munich malts. This beer is a big flavorful Northwest IPA that maintains its drinkability, and as such has garnered great admiration from the novice craft drinker and the seasoned hop head alike.','https://s3.amazonaws.com/brewerydbapi/beer/infeFI/upload_taTKTO-large.png',2);
INSERT INTO beer(name,style,abv,ibu,description,image,brewerid) VALUES ('Wünderbier','German-Style Kölsch',4.4,22,'Conquer summer with Wünderbier in-hand and say “cheers” to the pure and unadulterated fun of the season. In tribute to the favored beer of Cologne (Köln), Germany, this German-Style Kölsch is golden-colored with a subtle, crisp sweetness. A wonderful summer story awaits in every sip; it’s Wünderbier!','https://s3.amazonaws.com/brewerydbapi/beer/oBNJj9/upload_ZNCJqv-large.png',2);
INSERT INTO beer(name,style,abv,ibu,description,image,brewerid) VALUES ('Vanilla Oatis','Oatmeal Stout',7,50,'A delicious Oatmeal Stout with just enough hops to balance the copious quantities of dark roasted malts, oatmeal for a creamy smooth drinkability, and whole vanilla beans for a rich complexity.','https://s3.amazonaws.com/brewerydbapi/beer/UNns8H/upload_Kpntup-large.png',2);
INSERT INTO beer(name,style,abv,ibu,description,image,brewerid) VALUES ('Sticky Hands','Imperial IPA',8.1,100,'Meet Sticky Hands. Offering a luscious blend of flavor and drinkability, this Hop Experience Ale features ample additions of sticky, lupulin-packed hops, grown in the Pacific Northwest. The result is an aromatic blast of citrus, tropical fruit, and dank herb that transitions into resinous hop flavor and a delightfully balanced finish.','https://s3.amazonaws.com/brewerydbapi/brewery/A7Nqfu/upload_XduCQg-large.png',3);
INSERT INTO beer(name,style,abv,ibu,description,image,brewerid) VALUES ('Block Party','Amber Ale',5.6,10,'The amber you’ve always wanted. Crisp and clean, but full of flavor: milk caramel, toasted biscuit, and sweet wheat. A medium-bodied brew that has character yet remains an all-game drinker that always satisfies, never disappoints, and plays well with many types of food.','https://s3.amazonaws.com/brewerydbapi/brewery/A7Nqfu/upload_XduCQg-large.png',3);

INSERT INTO distributors(id, name, address, state, zip, phone, ownerid) VALUES (1, 'Bombs Away Cafe', 'NW Monroe Ave','OR', 97330, "4929320193", 1);
INSERT INTO distributors(id, name, address, state, zip, phone, ownerid) VALUES (2, 'Suds & Suds', '342 Kings Ave','OR', 97330, "4929320193", 2);
INSERT INTO distributors(id, name, address, state, zip, phone, ownerid) VALUES (3, 'Market of Choice', 'NW 9th St','OR', 97330, "4929320193", 3);

INSERT INTO beerDistributors (beerid, distributorid) VALUES (1, 1), (2, 2), (3, 3), (4, 1), (5, 2), (6, 3), (7, 1), (8, 2)

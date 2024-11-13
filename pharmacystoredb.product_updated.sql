USE pharmacystoredb;

CREATE TABLE `product` (
  `productid` int NOT NULL AUTO_INCREMENT,
  `productname` varchar(30) NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `description` varchar(100) NOT NULL,
  `categoryId` int DEFAULT NULL,
  PRIMARY KEY (`productid`),
  UNIQUE KEY `productname` (`productname`),
  KEY `categoryId` (`categoryId`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE product MODIFY productname VARCHAR(200);


SELECT * FROM pharmacystoredb.product;

-- Haircare (categoryId = 3)
INSERT INTO product (productname, price, quantity, description, categoryId) VALUES
('Pantene Pro-V Shampoo', 350, 50, 'Anti-dandruff shampoo', 3),
('Dove Intense Repair Conditioner', 280, 30, 'Moisturizing conditioner', 3),
('Parachute Advanced Hair Oil', 150, 40, 'Nourishing hair oil', 3),
('L\'Oreal Paris Hair Serum', 450, 25, 'Frizz control serum by L\'Oreal', 3),
('Biotique Hair Mask', 300, 20, 'Deep conditioning mask by Biotique', 3);

-- Pain Killers (categoryId = 5)
INSERT INTO product (productname, price, quantity, description, categoryId) VALUES
('Crocin Pain Relief', 60, 100, 'Pain relief tablet by GSK', 5),
('Brufen', 80, 80, 'Anti-inflammatory tablet by Abbott', 5),
('Disprin', 70, 90, 'Blood thinner and pain relief by Reckitt', 5),
('Volini Gel', 95, 70, 'Pain relief gel by Sun Pharma', 5),
('Naprosyn', 110, 60, 'Pain relief capsule by Roche', 5);

-- Skin Care (categoryId = 4)
INSERT INTO product (productname, price, quantity, description, categoryId) VALUES
('Neutrogena Deep Clean Face Wash', 180, 50, 'Gentle face cleanser by Neutrogena', 4),
('Cetaphil Moisturizing Cream', 350, 40, 'Hydrating face cream by Cetaphil', 4),
('Lotus Herbals Safe Sun', 250, 35, 'SPF 50+ sunscreen by Lotus', 4),
('Olay Night Cream', 550, 25, 'Anti-aging night cream by Olay', 4),
('The Ordinary Vitamin C Serum', 700, 30, 'Vitamin C face serum by The Ordinary', 4);

-- Supplements (categoryId = 2)
INSERT INTO product (productname, price, quantity, description, categoryId) VALUES
('Celin Vitamin C', 120, 100, 'Immune booster supplement by GSK', 2),
('Seven Seas Cod Liver Oil', 350, 80, 'Fish oil supplement by Seven Seas', 2),
('Yakult Probiotics', 220, 60, 'Gut health supplement by Yakult', 2),
('One A Day Multivitamins', 400, 70, 'Daily multivitamin supplement by Bayer', 2),
('Coral Calcium', 180, 90, 'Bone health supplement by Coral LLC', 2);

SELECT * FROM product WHERE categoryId=2;
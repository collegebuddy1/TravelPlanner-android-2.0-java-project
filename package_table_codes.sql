CREATE TABLE package (
    package_id INT PRIMARY KEY AUTO_INCREMENT,
    package_name VARCHAR(255) NOT NULL,
    package_description TEXT,
    destination VARCHAR(255) NOT NULL,
    duration INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    inclusions TEXT,
    exclusions TEXT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    available_seats INT NOT NULL,
    package_images TEXT, -- JSON or TEXT to store image URLs
    average_rating DECIMAL(3, 2), -- Store the average rating
    ratings_and_reviews JSON -- JSON or TEXT to store customer ratings and reviews
);


-- Insert the first package
INSERT INTO package (package_id,package_name, package_description, destination, duration, price, inclusions, exclusions, start_date,end_date, available_seats, package_images, average_rating, ratings_and_reviews)
VALUES (
	 1,
    'Package 1',
    'Explore the beautiful beaches of Bali.',
    'Bali, Indonesia',
    7,
    1200.00,
    'Accommodation, Airport transfers, Guided tours',
    'Airfare, Meals',
    "2023-10-01", "2023-10-08",
    20,
    '["bali1.jpg", "bali2.jpg", "bali3.jpg"]',
    4.8,
    '{
        "average_rating": 4.8,
        "reviews": [
            {
                "rating": 5,
                "comment": "Amazing trip!",
                "timestamp": "2023-08-15"
            },
            {
                "rating": 4.5,
                "comment": "Beautiful destination.",
                "timestamp": "2023-08-20"
            }
        ]
    }'
);

-- Insert the second package
INSERT INTO package (package_id,package_name, package_description, destination, duration, price, inclusions, exclusions, start_date,end_date, available_seats, package_images, average_rating, ratings_and_reviews)
VALUES (
	 2,
    'Package 2',
    'Discover the magic of Rome and its history.',
    'Rome, Italy',
    5,
    1600.00,
    'Accommodation, Guided tours, Meals',
    'Airfare, Airport transfers',
    "2023-09-15",  "2023-09-20",
    15,
    '["rome1.jpg", "rome2.jpg", "rome3.jpg"]',
    4.5,
    '{
        "average_rating": 4.5,
        "reviews": [
            {
                "rating": 4.5,
                "comment": "Great cultural experience.",
                "timestamp": "2023-07-25"
            },
            {
                "rating": 4.0,
                "comment": "Historical sites are incredible.",
                "timestamp": "2023-07-30"
            }
        ]
    }'
);

-- Insert the third package
INSERT INTO package (package_id,package_name, package_description, destination, duration, price, inclusions, exclusions, start_date,end_date, available_seats, package_images, average_rating, ratings_and_reviews)
VALUES (
	 3, 
    'Package 3',
    'Safari adventure in South Africa.',
    'Cape Town, South Africa',
    10,
    2800.00,
    'Accommodation, Safari tours, Meals',
    'Airfare, Airport transfers',
    "2023-11-10", "2023-11-20",
    12,
    '["safari1.jpg", "safari2.jpg", "safari3.jpg"]',
    4.9,
    '{
        "average_rating": 4.9,
        "reviews": [
            {
                "rating": 5,
                "comment": "Incredible wildlife experience!",
                "timestamp": "2023-06-10"
            },
            {
                "rating": 4.8,
                "comment": "Must-visit for nature lovers.",
                "timestamp": "2023-06-15"
            }package
        ]
    }'
);

INSERT INTO package (package_id,package_name, package_description, destination, duration, price, inclusions, exclusions, start_date, end_date, available_seats, package_images, average_rating, ratings_and_reviews)
VALUES (
	4,
    'Package 4',
    'Explore the historic streets of Kyoto.',
    'Kyoto, Japan',
    6,
    1400.00,
    'Accommodation, Guided tours, Cultural experiences',
    'Airfare, Meals',
    "2023-12-05","2023-12-10",
    18,
    'kyoto1.jpg',
    4.6,
    '{
        "average_rating": 4.6,
        "reviews": [
            {
                "rating": 4.7,
                "comment": "Kyoto is stunning!",
                "timestamp": "2023-10-18"
            },
            {
                "rating": 4.5,
                "comment": "Rich cultural experiences.",
                "timestamp": "2023-10-22"
            }
        ]
    }'
);




CREATE TABLE travel_packages (
    package_id INT AUTO_INCREMENT PRIMARY KEY,
    package_name VARCHAR(255),
    package_description TEXT,
    destination VARCHAR(255),
    duration INT,
    price DECIMAL(10, 2),
    inclusions TEXT,
    exclusions TEXT,
    start_date DATE,
    end_date DATE,
    available_seats INT,
    average_rating DECIMAL(3, 2),
    ratings_and_reviews JSON,
    package_images VARCHAR(255),
    contactEmail VARCHAR(255),
    contactPhone VARCHAR(20)
);

CREATE TABLE cart (
    cart_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    package_id INT,
    quantity INT
);
 drop table package;
 
 
 
 -- Insert data for Package 1
INSERT INTO package (package_name, package_description, destination, duration, price, inclusions, exclusions, start_date, end_date, available_seats, average_rating, ratings_and_reviews, package_images, contactEmail, contactPhone)
VALUES ('Package 1', 'Explore the beautiful beaches of Bali.', 'Bali, Indonesia', 7, 1200.00, 'Accommodation, Airport transfers, Guided tours', 'Airfare, Meals', '2023-10-01', '2023-10-08', 20, 4.80, '{"reviews": [{"rating": 5, "comment": "Amazing trip!", "timestamp": "2023-08-15"}, {"rating": 4.5, "comment": "Beautiful destination.", "timestamp": "2023-08-20"}], "average_rating": 4.8}', 'bali1.jpg', 'JohnDoeTravel@example.com', '+91-9876543210');

-- Insert data for Package 2
INSERT INTO package (package_name, package_description, destination, duration, price, inclusions, exclusions, start_date, end_date, available_seats, average_rating, ratings_and_reviews, package_images, contactEmail, contactPhone)
VALUES ('Package 2', 'Discover the magic of Rome and its history.', 'Rome, Italy', 5, 1600.00, 'Accommodation, Guided tours, Meals', 'Airfare, Airport transfers', '2023-09-15', '2023-09-20', 15, 4.50, '{"reviews": [{"rating": 4.5, "comment": "Great cultural experience.", "timestamp": "2023-07-25"}, {"rating": 4.0, "comment": "Historical sites are incredible.", "timestamp": "2023-07-30"}], "average_rating": 4.5}', 'rome1.jpg', 'SarahAdventures@gmail.com', '+91-8765432109');

-- Insert data for Package 3
INSERT INTO package (package_name, package_description, destination, duration, price, inclusions, exclusions, start_date, end_date, available_seats, average_rating, ratings_and_reviews, package_images, contactEmail, contactPhone)
VALUES ('Package 3', 'Safari adventure in South Africa.', 'Cape Town, South Africa', 10, 2800.00, 'Accommodation, Safari tours, Meals', 'Airfare, Airport transfers', '2023-11-10', '2023-11-20', 12, 5.00, '{"reviews": [{"rating": 5, "comment": "Incredible wildlife experience!", "timestamp": "2023-06-10"}, {"rating": 4.8, "comment": "Must-visit for nature lovers.", "timestamp": "2023-06-15"}], "average_rating": 4.9}', 'safari1.jpg', 'ExploreWithMaria@hotmail.com', '+91-7654321098');

-- Insert data for Package 4
INSERT INTO package (package_name, package_description, destination, duration, price, inclusions, exclusions, start_date, end_date, available_seats, average_rating, ratings_and_reviews, package_images, contactEmail, contactPhone)
VALUES ('Package 4', 'Explore the historic streets of Kyoto.', 'Kyoto, Japan', 6, 1400.00, 'Accommodation, Guided tours, Cultural experiences', 'Airfare, Meals', '2023-12-05', '2023-12-10', 18, 4.60, '{"reviews": [{"rating": 4.7, "comment": "Kyoto is stunning!", "timestamp": "2023-10-18"}, {"rating": 4.5, "comment": "Rich cultural experiences.", "timestamp": "2023-10-22"}], "average_rating": 4.6}', 'kyoto1.jpg', 'AdventureSeekers@example.com', '+91-6543210987');

-- Insert data for Package 5
INSERT INTO package (package_name, package_description, destination, duration, price, inclusions, exclusions, start_date, end_date, available_seats, average_rating, ratings_and_reviews, package_images, contactEmail, contactPhone)
VALUES ('Package 5', 'Relax on the beautiful beaches of Maldives.', 'Maldives', 8, 2500.00, 'Accommodation, Water sports, Spa treatments', 'Airfare, Meals', '2023-09-01', '2023-09-08', 10, 3.50, '{"reviews": [{"rating": 5, "comment": "Paradise on Earth!", "timestamp": "2023-06-05"}, {"rating": 4.3, "comment": "Great water sports activities.", "timestamp": "2023-06-10"}], "average_rating": 4.7}', 'maldives1.jpg', 'WanderlustAdventures@gmail.com', '+91-5432109876');

-- Insert data for Package 6
INSERT INTO package (package_name, package_description, destination, duration, price, inclusions, exclusions, start_date, end_date, available_seats, average_rating, ratings_and_reviews, package_images, contactEmail, contactPhone)
VALUES ('Package 6', 'Explore the vibrant streets of New York City.', 'New York City, USA', 4, 1800.00, 'Accommodation, City tours, Broadway show', 'Airfare, Meals', '2023-10-20', '2023-10-24', 14, 4.80, '{"reviews": [{"rating": 4.9, "comment": "The city that never sleeps!", "timestamp": "2023-08-05"}, {"rating": 4.7, "comment": "Broadway show was fantastic.", "timestamp": "2023-08-10"}], "average_rating": 4.8}', 'nyc1.jpg', 'DreamTripsInc@hotmail.com', '+91-4321098765');

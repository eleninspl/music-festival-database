-- load.sql
-- Script για τη φόρτωση δεδομένων στη βάση του φεστιβάλ μουσικής

USE festival;

-- Απενεργοποίηση των ελέγχων ξένων κλειδιών για ταχύτερη φόρτωση
SET FOREIGN_KEY_CHECKS = 0;

-- Καθαρισμός υπαρχόντων δεδομένων (αν υπάρχουν)
TRUNCATE TABLE ARTIST_BAND;
TRUNCATE TABLE PERFORMER_GENRE;
TRUNCATE TABLE VENUE_EQUIPMENT;
TRUNCATE TABLE EVENT_STAFF;
TRUNCATE TABLE RESALE_SELLER_QUEUE;
TRUNCATE TABLE RESALE_BUYER_QUEUE;
TRUNCATE TABLE RATING;
TRUNCATE TABLE TICKET;
TRUNCATE TABLE VISITOR;
TRUNCATE TABLE PERFORMANCE;
TRUNCATE TABLE ARTIST;
TRUNCATE TABLE BAND;
TRUNCATE TABLE PERFORMER;
TRUNCATE TABLE GENRE;
TRUNCATE TABLE EQUIPMENT;
TRUNCATE TABLE STAFF;
TRUNCATE TABLE EVENT;
TRUNCATE TABLE VENUE;
TRUNCATE TABLE FESTIVAL;
TRUNCATE TABLE LOCATION;

-- Επανενεργοποίηση των ελέγχων ξένων κλειδιών
SET FOREIGN_KEY_CHECKS = 1;

-- Εισαγωγή τοποθεσιών (LOCATION)
INSERT INTO LOCATION (address, latitude, longitude, city, country, continent) VALUES
('Empire Polo Club, 81-800 Avenue 51', 33.6823, -116.2372, 'Indio', 'USA', 'North America'),
('Worthy Farm, Pilton', 51.1557, -2.5866, 'Somerset', 'UK', 'Europe'),
('Grant Park, 337 E Randolph St', 41.8756, -87.6244, 'Chicago', 'USA', 'North America'),
('Naeba Ski Resort', 36.8031, 138.7907, 'Niigata', 'Japan', 'Asia'),
('Parc del Fòrum, Carrer de la Pau, 12', 41.4103, 2.2253, 'Barcelona', 'Spain', 'Europe'),
('Nürburg', 50.3356, 6.9475, 'Rhineland-Palatinate', 'Germany', 'Europe'),
('Watkins Glen', 42.3798, -76.8713, 'New York', 'USA', 'North America'),
('Ilha do Ermal, Vieira do Minho', 41.6352, -8.1396, 'Braga', 'Portugal', 'Europe'),
('Bayfront Park, 301 Biscayne Blvd', 25.7742, -80.1887, 'Miami', 'USA', 'North America'),
('Daresbury Estate', 53.3331, -2.6486, 'Cheshire', 'UK', 'Europe'),
('Boom', 51.0897, 4.3685, 'Antwerp', 'Belgium', 'Europe'),
('Nairobi National Park', -1.3106, 36.8286, 'Nairobi', 'Kenya', 'Africa'),
('Ipanema Beach', -22.9866, -43.2079, 'Rio de Janeiro', 'Brazil', 'South America'),
('Sidney Myer Music Bowl', -37.8233, 144.9743, 'Melbourne', 'Australia', 'Oceania'),
('Victoria Park', 22.2846, 114.1907, 'Hong Kong', 'China', 'Asia');

-- Εισαγωγή φεστιβάλ (FESTIVAL)
INSERT INTO FESTIVAL (year, start_date, end_date, name, description, image, image_description, location_id) VALUES
(2020, '2020-04-10 12:00:00', '2020-04-19 23:59:59', 'Coachella 2020', 'Annual music and arts festival featuring various artists and genres', 'coachella_2020.jpg', 'Coachella 2020 official poster', 1),
(2021, '2021-06-23 10:00:00', '2021-06-27 23:59:59', 'Glastonbury 2021', 'One of the largest greenfield music and performing arts festivals in the world', 'glastonbury_2021.jpg', 'Aerial view of Glastonbury Festival', 2),
(2021, '2021-07-29 12:00:00', '2021-08-01 23:59:59', 'Lollapalooza 2021', 'Annual four-day music festival in Grant Park, Chicago', 'lollapalooza_2021.jpg', 'Lollapalooza main stage performance', 3),
(2022, '2022-07-29 10:00:00', '2022-07-31 23:59:59', 'Fuji Rock 2022', 'Japans largest outdoor music festival held at Naeba Ski Resort', 'fuji_rock_2022.jpg', 'Fuji Rock Festival mountain backdrop', 4),
(2022, '2022-06-02 14:00:00', '2022-06-04 23:59:59', 'Primavera Sound 2022', 'Music festival that takes place in Barcelona, Spain', 'primavera_2022.jpg', 'Primavera Sound beachfront stage', 5),
(2023, '2023-06-02 12:00:00', '2023-06-04 23:59:59', 'Rock am Ring 2023', 'One of Germanys largest rock music festivals', 'rock_am_ring_2023.jpg', 'Rock am Ring aerial view', 6),
(2023, '2023-08-03 14:00:00', '2023-08-06 23:59:59', 'Woodstock Revival 2023', 'Modern revival of the iconic music festival', 'woodstock_2023.jpg', 'Woodstock Revival main stage', 7),
(2024, '2024-07-18 12:00:00', '2024-07-21 23:59:59', 'Boom Festival 2024', 'Biennial transformational festival in Portugal', 'boom_2024.jpg', 'Boom Festival art installations', 8),
(2025, '2025-05-28 15:00:00', '2025-05-30 23:59:59', 'Ultra Music Festival 2025', 'Annual outdoor electronic music festival in Miami', 'ultra_2025.jpg', 'Ultra Music Festival night performance', 9),
(2025, '2025-08-22 14:00:00', '2025-08-24 23:59:59', 'Creamfields 2025', 'Major dance music festival held in the UK', 'creamfields_2025.jpg', 'Creamfields light show', 10);

-- Εισαγωγή σκηνών (VENUE)
INSERT INTO VENUE (name, description, max_capacity, image, image_description) VALUES
('Coachella Main Stage', 'Primary stage for headline acts with state-of-the-art sound and lighting', 400, 'coachella_main.jpg', 'Coachella main stage during sunset'),
('Sahara Tent', 'Massive tent dedicated to electronic music with advanced lighting systems', 500, 'sahara_tent.jpg', 'Sahara tent with laser show'),
('Mojave Tent', 'Mid-sized tent featuring alternative and indie acts', 350, 'mojave_tent.jpg', 'Mojave tent during a performance'),
('Gobi Tent', 'Intimate tent showcasing emerging artists', 400, 'gobi_tent.jpg', 'Gobi tent crowd view'),
('Outdoor Theatre', 'Open-air stage with natural amphitheater seating', 380, 'outdoor_theatre.jpg', 'Outdoor Theatre panoramic view'),
('Pyramid Stage', 'Iconic main stage of Glastonbury Festival', 550, 'pyramid_stage.jpg', 'Pyramid Stage with massive crowd'),
('Other Stage', 'Second largest stage at Glastonbury for major acts', 440, 'other_stage.jpg', 'Other Stage during a rock performance'),
('West Holts Stage', 'Stage featuring world music, reggae, and jazz', 350, 'west_holts.jpg', 'West Holts Stage during daytime'),
('Park Stage', 'Hillside stage with panoramic views of the festival', 300, 'park_stage.jpg', 'Park Stage with festival backdrop'),
('Acoustic Stage', 'Dedicated to folk and acoustic performances', 280, 'acoustic_stage.jpg', 'Acoustic Stage intimate setting'),
('T-Mobile Stage', 'Main stage at Lollapalooza with corporate sponsorship', 430, 'tmobile_stage.jpg', 'T-Mobile Stage with Chicago skyline'),
('Bud Light Stage', 'Second main stage featuring alternative acts', 400, 'bud_light_stage.jpg', 'Bud Light Stage during sunset'),
('Perrys Stage', 'Electronic dance music focused stage with elaborate production', 390, 'perrys_stage.jpg', 'Perrys Stage with light show'),
('BMI Stage', 'Smaller stage showcasing emerging talent', 250, 'bmi_stage.jpg', 'BMI Stage intimate performance'),
('Green Stage', 'Fuji Rocks main stage surrounded by mountains', 350, 'green_stage.jpg', 'Green Stage with mountain backdrop'),
('White Stage', 'Second largest stage at Fuji Rock', 330, 'white_stage.jpg', 'White Stage during rainfall'),
('Field of Heaven', 'Eco-friendly stage powered by solar energy', 290, 'field_of_heaven.jpg', 'Field of Heaven at sunset'),
('Primavera Main Stage', 'Oceanfront main stage with spectacular views', 400, 'primavera_main.jpg', 'Primavera Main Stage night view'),
('Ray-Ban Stage', 'Sponsored stage featuring indie rock bands', 370, 'rayban_stage.jpg', 'Ray-Ban Stage crowd'),
('Pitchfork Stage', 'Curated stage featuring critically acclaimed artists', 320, 'pitchfork_stage.jpg', 'Pitchfork Stage during performance'),
('Centerfeld', 'Rock am Rings central stage for headliners', 480, 'centerfeld.jpg', 'Centerfeld massive crowd view'),
('Mandora Stage', 'Heavy metal focused stage with pyrotechnics', 440, 'mandora_stage.jpg', 'Mandora Stage with fire effects'),
('Peace Garden Stage', 'Woodstock Revivals main stage with 60s aesthetic', 410, 'peace_garden.jpg', 'Peace Garden Stage with hippie decorations'),
('Freedom Stage', 'Second stage at Woodstock Revival', 400, 'freedom_stage.jpg', 'Freedom Stage panoramic view'),
('Dance Temple', 'Boom Festivals main electronic music stage', 470, 'dance_temple.jpg', 'Dance Temple psychedelic decorations'),
('Sacred Fire', 'Spiritual and world music stage at Boom', 420, 'sacred_fire.jpg', 'Sacred Fire night ceremony'),
('Ultra Main Stage', 'Massive LED stage for EDM headliners', 460, 'ultra_main.jpg', 'Ultra Main Stage light show'),
('Resistance Stage', 'Underground electronic music stage', 430, 'resistance_stage.jpg', 'Resistance Stage techno performance'),
('Steel Yard', 'Massive hangar structure at Creamfields', 380, 'steel_yard.jpg', 'Steel Yard laser production'),
('Arc Stage', 'Open-air main stage at Creamfields', 460, 'arc_stage.jpg', 'Arc Stage with pyrotechnics');

-- Εισαγωγή εξοπλισμού (EQUIPMENT)
INSERT INTO EQUIPMENT (type, description, image, image_description) VALUES
('PA System', 'High-end line array speaker system for large audiences', 'pa_system.jpg', 'Line array speakers mounted on stage'),
('Mixing Console', 'Digital mixing board for sound control', 'mixing_console.jpg', 'Professional audio mixing console'),
('Stage Lighting', 'Programmable LED lighting rig', 'stage_lighting.jpg', 'Colorful stage lighting setup'),
('Laser System', 'High-powered laser show equipment', 'laser_system.jpg', 'Laser beams during performance'),
('LED Screens', 'High-resolution video walls for visuals', 'led_screens.jpg', 'Large LED screen displaying visuals'),
('Fog Machine', 'Atmospheric effect generator', 'fog_machine.jpg', 'Fog machine creating atmosphere'),
('Pyrotechnics', 'Controlled fire and explosion effects', 'pyrotechnics.jpg', 'Pyrotechnic display on stage'),
('DJ Equipment', 'Professional CDJs and mixer setup', 'dj_equipment.jpg', 'Professional DJ setup'),
('Drum Kit', 'Complete acoustic drum set', 'drum_kit.jpg', 'Professional drum kit on stage'),
('Guitar Amplifiers', 'High-end guitar amplification', 'guitar_amps.jpg', 'Row of guitar amplifiers'),
('Bass Amplifiers', 'Specialized amplifiers for bass guitars', 'bass_amps.jpg', 'Professional bass amplifier'),
('Keyboard Rig', 'Synthesizers and keyboard controllers', 'keyboard_rig.jpg', 'Professional keyboard setup'),
('Microphones', 'Various professional microphones', 'microphones.jpg', 'Collection of performance microphones'),
('In-Ear Monitors', 'Personal monitoring system for performers', 'in_ear_monitors.jpg', 'In-ear monitoring system'),
('Stage Monitors', 'Floor speakers for on-stage monitoring', 'stage_monitors.jpg', 'Stage monitor speakers'),
('Power Distribution', 'Professional electrical distribution system', 'power_distribution.jpg', 'Power distribution units'),
('Truss System', 'Aluminum framework for mounting equipment', 'truss_system.jpg', 'Stage truss system'),
('Wireless Systems', 'Radio frequency transmission equipment', 'wireless_systems.jpg', 'Wireless transmitters and receivers'),
('CO2 Jets', 'Compressed gas special effects', 'co2_jets.jpg', 'CO2 jet effect during show'),
('Confetti Cannons', 'Devices for shooting confetti into the air', 'confetti_cannons.jpg', 'Confetti explosion at concert');

-- Εισαγωγή συσχέτισης σκηνών-εξοπλισμού (VENUE_EQUIPMENT)
INSERT INTO VENUE_EQUIPMENT (venue_id, equipment_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 16), (1, 17), (1, 19),
(2, 1), (2, 2), (2, 3), (2, 4), (2, 5), (2, 6), (2, 8), (2, 16), (2, 17), (2, 19),
(3, 1), (3, 2), (3, 3), (3, 5), (3, 6), (3, 9), (3, 10), (3, 11), (3, 12), (3, 13),
(4, 1), (4, 2), (4, 3), (4, 6), (4, 13), (4, 14), (4, 15), (4, 16), (4, 18),
(5, 1), (5, 2), (5, 3), (5, 5), (5, 6), (5, 9), (5, 10), (5, 11), (5, 13), (5, 15),
(6, 1), (6, 2), (6, 3), (6, 4), (6, 5), (6, 6), (6, 7), (6, 16), (6, 17), (6, 20),
(7, 1), (7, 2), (7, 3), (7, 5), (7, 6), (7, 9), (7, 10), (7, 11), (7, 13), (7, 15),
(8, 1), (8, 2), (8, 3), (8, 6), (8, 9), (8, 10), (8, 11), (8, 13), (8, 15), (8, 18),
(9, 1), (9, 2), (9, 3), (9, 6), (9, 9), (9, 10), (9, 11), (9, 12), (9, 13), (9, 15),
(10, 1), (10, 2), (10, 3), (10, 13), (10, 14), (10, 15), (10, 18),
(11, 1), (11, 2), (11, 3), (11, 4), (11, 5), (11, 6), (11, 7), (11, 16), (11, 17), (11, 19),
(12, 1), (12, 2), (12, 3), (12, 5), (12, 6), (12, 9), (12, 10), (12, 11), (12, 13), (12, 15),
(13, 1), (13, 2), (13, 3), (13, 4), (13, 5), (13, 6), (13, 8), (13, 16), (13, 17), (13, 19),
(14, 1), (14, 2), (14, 3), (14, 13), (14, 14), (14, 15), (14, 18),
(15, 1), (15, 2), (15, 3), (15, 4), (15, 5), (15, 6), (15, 7), (15, 16), (15, 17), (15, 19),
(16, 1), (16, 2), (16, 3), (16, 5), (16, 6), (16, 9), (16, 10), (16, 11), (16, 13), (16, 15),
(17, 1), (17, 2), (17, 3), (17, 6), (17, 9), (17, 10), (17, 11), (17, 13), (17, 15), (17, 18),
(18, 1), (18, 2), (18, 3), (18, 4), (18, 5), (18, 6), (18, 7), (18, 16), (18, 17), (18, 19),
(19, 1), (19, 2), (19, 3), (19, 5), (19, 6), (19, 9), (19, 10), (19, 11), (19, 13), (19, 15),
(20, 1), (20, 2), (20, 3), (20, 5), (20, 6), (20, 9), (20, 10), (20, 11), (20, 13), (20, 15),
(21, 1), (21, 2), (21, 3), (21, 4), (21, 5), (21, 6), (21, 7), (21, 16), (21, 17), (21, 19),
(22, 1), (22, 2), (22, 3), (22, 4), (22, 5), (22, 6), (22, 7), (22, 10), (22, 11), (22, 13),
(23, 1), (23, 2), (23, 3), (23, 5), (23, 6), (23, 9), (23, 10), (23, 11), (23, 13), (23, 15),
(24, 1), (24, 2), (24, 3), (24, 5), (24, 6), (24, 9), (24, 10), (24, 11), (24, 13), (24, 15),
(25, 1), (25, 2), (25, 3), (25, 4), (25, 5), (25, 6), (25, 8), (25, 16), (25, 17), (25, 19),
(26, 1), (26, 2), (26, 3), (26, 6), (26, 8), (26, 13), (26, 15), (26, 18),
(27, 1), (27, 2), (27, 3), (27, 4), (27, 5), (27, 6), (27, 8), (27, 16), (27, 17), (27, 19),
(28, 1), (28, 2), (28, 3), (28, 4), (28, 5), (28, 6), (28, 8), (28, 16), (28, 17), (28, 19),
(29, 1), (29, 2), (29, 3), (29, 4), (29, 5), (29, 6), (29, 8), (29, 16), (29, 17), (29, 19),
(30, 1), (30, 2), (30, 3), (30, 4), (30, 5), (30, 6), (30, 7), (30, 16), (30, 17), (30, 20);

-- Εισαγωγή προσωπικού (STAFF)
INSERT INTO STAFF (first_name, last_name, age, role, experience_level, staff_type) VALUES
-- Τεχνικό προσωπικό
('John', 'Smith', 35, 'Sound Engineer', 'expert', 'technical'),
('Emily', 'Johnson', 29, 'Lighting Technician', 'experienced', 'technical'),
('Michael', 'Williams', 42, 'Stage Manager', 'expert', 'technical'),
('Sarah', 'Brown', 31, 'Video Technician', 'intermediate', 'technical'),
('David', 'Jones', 27, 'Audio Assistant', 'beginner', 'technical'),
('Jessica', 'Garcia', 38, 'Lighting Director', 'expert', 'technical'),
('Daniel', 'Miller', 33, 'Monitor Engineer', 'experienced', 'technical'),
('Lisa', 'Davis', 26, 'Backline Technician', 'intermediate', 'technical'),
('Robert', 'Rodriguez', 45, 'Production Manager', 'expert', 'technical'),
('Jennifer', 'Martinez', 30, 'FOH Engineer', 'experienced', 'technical'),
('James', 'Hernandez', 25, 'Lighting Assistant', 'beginner', 'technical'),
('Michelle', 'Lopez', 36, 'Video Director', 'expert', 'technical'),
('Christopher', 'Gonzalez', 32, 'RF Coordinator', 'experienced', 'technical'),
('Amanda', 'Wilson', 28, 'Audio Technician', 'intermediate', 'technical'),
('Matthew', 'Anderson', 41, 'Technical Director', 'expert', 'technical'),
('Elizabeth', 'Thomas', 34, 'Pyrotechnics Specialist', 'experienced', 'technical'),
('Andrew', 'Taylor', 24, 'Stage Hand', 'trainee', 'technical'),
('Stephanie', 'Moore', 37, 'Production Coordinator', 'expert', 'technical'),
('Joshua', 'Jackson', 31, 'LED Technician', 'intermediate', 'technical'),
('Nicole', 'White', 29, 'Audio Systems Engineer', 'experienced', 'technical'),
('Alexander', 'Peterson', 33, 'Systems Engineer', 'expert', 'technical'),
('Sophia', 'Bennett', 29, 'Projection Specialist', 'experienced', 'technical'),
('Benjamin', 'Reynolds', 37, 'Audio Systems Designer', 'expert', 'technical'),
('Olivia', 'Chen', 26, 'Visual Effects Technician', 'intermediate', 'technical'),
('Ethan', 'Sullivan', 31, 'Broadcast Engineer', 'experienced', 'technical'),
('Isabella', 'Morgan', 28, 'Stage Automation Technician', 'intermediate', 'technical'),
('Lucas', 'Wagner', 40, 'Technical Supervisor', 'expert', 'technical'),
('Ava', 'Fisher', 25, 'Digital Media Specialist', 'beginner', 'technical'),
('Jackson', 'Powell', 34, 'Rigging Specialist', 'experienced', 'technical'),
('Emma', 'Harrison', 30, 'Sound Designer', 'experienced', 'technical'),

-- Προσωπικό ασφαλείας(55)
('William', 'Harris', 38, 'Security Manager', 'expert', 'security'),
('Ashley', 'Martin', 32, 'Security Supervisor', 'experienced', 'security'),
('Ryan', 'Thompson', 35, 'Security Guard', 'intermediate', 'security'),
('Megan', 'Garcia', 29, 'Security Guard', 'beginner', 'security'),
('Kevin', 'Martinez', 42, 'Security Coordinator', 'expert', 'security'),
('Samantha', 'Robinson', 31, 'Security Guard', 'intermediate', 'security'),
('Brian', 'Clark', 36, 'Security Guard', 'experienced', 'security'),
('Lauren', 'Rodriguez', 27, 'Security Guard', 'beginner', 'security'),
('Justin', 'Lewis', 33, 'Security Guard', 'intermediate', 'security'),
('Heather', 'Lee', 30, 'Security Guard', 'beginner', 'security'),
('Brandon', 'Walker', 39, 'Security Supervisor', 'experienced', 'security'),
('Amber', 'Hall', 28, 'Security Guard', 'beginner', 'security'),
('Jonathan', 'Allen', 34, 'Security Guard', 'intermediate', 'security'),
('Melissa', 'Young', 31, 'Security Guard', 'intermediate', 'security'),
('Patrick', 'Hernandez', 40, 'Security Manager', 'expert', 'security'),
('Rebecca', 'King', 29, 'Security Guard', 'beginner', 'security'),
('Sean', 'Wright', 35, 'Security Guard', 'experienced', 'security'),
('Tiffany', 'Lopez', 32, 'Security Guard', 'intermediate', 'security'),
('Eric', 'Hill', 37, 'Security Supervisor', 'experienced', 'security'),
('Brittany', 'Scott', 30, 'Security Guard', 'beginner', 'security'),
('Nathan', 'Douglas', 36, 'Security Team Leader', 'expert', 'security'),
('Victoria', 'Russell', 31, 'Access Control Specialist', 'experienced', 'security'),
('Caleb', 'Fletcher', 34, 'Security Analyst', 'experienced', 'security'),
('Madison', 'Coleman', 28, 'Crowd Management Specialist', 'intermediate', 'security'),
('Tyler', 'Warren', 39, 'Emergency Response Coordinator', 'expert', 'security'),
('Abigail', 'Dixon', 32, 'Security Patrol Officer', 'intermediate', 'security'),
('Zachary', 'Gibson', 35, 'VIP Security Specialist', 'experienced', 'security'),
('Hannah', 'Hayes', 29, 'Security Screening Officer', 'beginner', 'security'),
('Gabriel', 'Ferguson', 37, 'Security Communications Officer', 'experienced', 'security'),
('Lily', 'Marshall', 30, 'Perimeter Security Specialist', 'intermediate', 'security'),
('Adrian', 'Foster', 33, 'Security Team Leader', 'experienced', 'security'),
('Bianca', 'Patel', 29, 'Security Guard', 'intermediate', 'security'),
('Cameron', 'Nguyen', 34, 'Security Supervisor', 'experienced', 'security'),
('Danielle', 'Kim', 27, 'Security Guard', 'beginner', 'security'),
('Felix', 'Rivera', 38, 'Security Coordinator', 'expert', 'security'),
('Georgia', 'Sharma', 31, 'Security Guard', 'intermediate', 'security'),
('Hugo', 'Tanaka', 35, 'Security Analyst', 'experienced', 'security'),
('Iris', 'Novak', 26, 'Security Guard', 'beginner', 'security'),
('Julian', 'Mendoza', 40, 'Security Manager', 'expert', 'security'),
('Kira', 'Okonkwo', 30, 'Security Guard', 'intermediate', 'security'),
('Leo', 'Vasquez', 36, 'Security Supervisor', 'experienced', 'security'),
('Maya', 'Cheng', 28, 'Security Guard', 'beginner', 'security'),
('Nolan', 'Singh', 37, 'Emergency Response Specialist', 'expert', 'security'),
('Paige', 'Kowalski', 32, 'Security Guard', 'intermediate', 'security'),
('Quinn', 'Rossi', 29, 'Security Guard', 'beginner', 'security'),
('Rowan', 'Ahmed', 39, 'Security Team Leader', 'experienced', 'security'),
('Serena', 'Diaz', 31, 'Security Guard', 'intermediate', 'security'),
('Tristan', 'Wong', 34, 'Security Communications Officer', 'experienced', 'security'),
('Uma', 'Gupta', 27, 'Security Guard', 'beginner', 'security'),
('Vincent', 'Kone', 41, 'Security Coordinator', 'expert', 'security'),
('Whitney', 'Fernandez', 33, 'Security Guard', 'intermediate', 'security'),
('Xavier', 'Dubois', 36, 'VIP Security Specialist', 'experienced', 'security'),
('Yasmin', 'Ivanov', 28, 'Security Guard', 'beginner', 'security'),
('Zane', 'Nakamura', 38, 'Security Supervisor', 'experienced', 'security'),
('Alicia', 'Mbeki', 32, 'Security Guard', 'intermediate', 'security'),

-- Βοηθητικό προσωπικό(55)
('Thomas', 'Green', 25, 'Usher', 'beginner', 'auxiliary'),
('Christina', 'Adams', 23, 'Ticket Scanner', 'trainee', 'auxiliary'),
('Steven', 'Baker', 29, 'Information Booth Staff', 'intermediate', 'auxiliary'),
('Laura', 'Gonzalez', 22, 'Merchandise Seller', 'trainee', 'auxiliary'),
('Jeffrey', 'Nelson', 31, 'First Aid Responder', 'experienced', 'auxiliary'),
('Kimberly', 'Carter', 26, 'Lost and Found Attendant', 'beginner', 'auxiliary'),
('Charles', 'Mitchell', 33, 'Accessibility Assistant', 'intermediate', 'auxiliary'),
('Angela', 'Perez', 24, 'Greeter', 'trainee', 'auxiliary'),
('Mark', 'Roberts', 28, 'VIP Liaison', 'intermediate', 'auxiliary'),
('Cynthia', 'Turner', 27, 'Hospitality Staff', 'beginner', 'auxiliary'),
('Paul', 'Phillips', 35, 'Guest Services Manager', 'expert', 'auxiliary'),
('Stephanie', 'Campbell', 23, 'Concessions Worker', 'trainee', 'auxiliary'),
('Gregory', 'Parker', 30, 'Waste Management', 'intermediate', 'auxiliary'),
('Rachel', 'Evans', 25, 'Volunteer Coordinator', 'beginner', 'auxiliary'),
('Kenneth', 'Edwards', 34, 'Transportation Coordinator', 'experienced', 'auxiliary'),
('Emily', 'Collins', 26, 'Transportation Coordinator', 'experienced', 'auxiliary'),
('Catherine', 'Collins', 26, 'Artist Liaison', 'intermediate', 'auxiliary'),
('Timothy', 'Stewart', 29, 'Box Office Staff', 'beginner', 'auxiliary'),
('Olivia', 'Sanchez', 24, 'Information Desk', 'trainee', 'auxiliary'),
('Donald', 'Morris', 32, 'Accessibility Coordinator', 'experienced', 'auxiliary'),
('Deborah', 'Rogers', 27, 'Hospitality Assistant', 'beginner', 'auxiliary'),
('Owen', 'Wallace', 26, 'Social Media Coordinator', 'intermediate', 'auxiliary'),
('Zoe', 'Hudson', 24, 'Sustainability Coordinator', 'beginner', 'auxiliary'),
('Liam', 'Spencer', 29, 'Food Vendor Liaison', 'intermediate', 'auxiliary'),
('Chloe', 'Grant', 23, 'Festival Ambassador', 'trainee', 'auxiliary'),
('Mason', 'Cooper', 32, 'Logistics Coordinator', 'experienced', 'auxiliary'),
('Ella', 'Kennedy', 25, 'Customer Experience Specialist', 'beginner', 'auxiliary'),
('Carter', 'Watson', 28, 'Crowd Flow Manager', 'intermediate', 'auxiliary'),
('Grace', 'Pierce', 22, 'Festival Guide', 'trainee', 'auxiliary'),
('Logan', 'Brooks', 31, 'Accessibility Services Specialist', 'experienced', 'auxiliary'),
('Scarlett', 'Price', 27, 'Community Outreach Coordinator', 'intermediate', 'auxiliary'),
('Blake', 'Hoffman', 25, 'Information Booth Staff', 'beginner', 'auxiliary'),
('Cassandra', 'Jimenez', 23, 'Ticket Scanner', 'trainee', 'auxiliary'),
('Dominic', 'Petrov', 30, 'Guest Services Coordinator', 'intermediate', 'auxiliary'),
('Elena', 'Takahashi', 26, 'Merchandise Seller', 'beginner', 'auxiliary'),
('Finn', 'Morales', 24, 'Usher', 'trainee', 'auxiliary'),
('Giselle', 'Cohen', 32, 'First Aid Responder', 'experienced', 'auxiliary'),
('Hector', 'Lindberg', 27, 'Lost and Found Attendant', 'beginner', 'auxiliary'),
('Ivy', 'Okoro', 29, 'Hospitality Staff', 'intermediate', 'auxiliary'),
('Jared', 'Suzuki', 22, 'Greeter', 'trainee', 'auxiliary'),
('Kylie', 'Navarro', 33, 'VIP Liaison', 'experienced', 'auxiliary'),
('Lance', 'Ibrahim', 26, 'Concessions Worker', 'beginner', 'auxiliary'),
('Mila', 'Andersen', 31, 'Volunteer Coordinator', 'intermediate', 'auxiliary'),
('Nico', 'Reyes', 24, 'Festival Guide', 'trainee', 'auxiliary'),
('Octavia', 'Khatri', 28, 'Artist Liaison', 'intermediate', 'auxiliary'),
('Preston', 'Yamamoto', 35, 'Transportation Coordinator', 'experienced', 'auxiliary'),
('Ramona', 'Esposito', 25, 'Information Desk', 'beginner', 'auxiliary'),
('Simon', 'Okafor', 29, 'Box Office Staff', 'intermediate', 'auxiliary'),
('Talia', 'Bjorn', 23, 'Sustainability Ambassador', 'trainee', 'auxiliary'),
('Ulysses', 'Cardenas', 34, 'Logistics Coordinator', 'experienced', 'auxiliary'),
('Violet', 'Khalid', 27, 'Customer Experience Specialist', 'beginner', 'auxiliary'),
('Weston', 'Fujimoto', 30, 'Food Vendor Liaison', 'intermediate', 'auxiliary'),
('Xenia', 'Volkov', 26, 'Festival Ambassador', 'beginner', 'auxiliary'),
('Yusuf', 'Santiago', 31, 'Accessibility Assistant', 'intermediate', 'auxiliary'),
('Zara', 'Nielsen', 24, 'Social Media Coordinator', 'beginner', 'auxiliary');

-- Εισαγωγή μουσικών ειδών (GENRE)
INSERT INTO GENRE (name, parent_genre_id) VALUES
('Rock', NULL),
('Pop', NULL),
('Electronic', NULL),
('Hip Hop', NULL),
('Jazz', NULL),
('Classical', NULL),
('Folk', NULL),
('World Music', NULL),
('Metal', NULL),
('R&B', NULL);

-- Εισαγωγή υποειδών (με parent_genre_id)
INSERT INTO GENRE (name, parent_genre_id) VALUES
('Alternative Rock', 1),
('Indie Rock', 1),
('Hard Rock', 1),
('Progressive Rock', 1),
('Punk Rock', 1),
('Pop Rock', 2),
('Synth Pop', 2),
('K-Pop', 2),
('Dance Pop', 2),
('Techno', 3),
('House', 3),
('Trance', 3),
('Drum and Bass', 3),
('Dubstep', 3),
('Trap', 4),
('Gangsta Rap', 4),
('Conscious Hip Hop', 4),
('Bebop', 5),
('Smooth Jazz', 5),
('Fusion', 5),
('Baroque', 6),
('Romantic', 6),
('Contemporary Classical', 6),
('Traditional Folk', 7),
('Contemporary Folk', 7),
('Reggae', 8),
('Afrobeat', 8),
('Latin', 8),
('Heavy Metal', 9),
('Death Metal', 9),
('Black Metal', 9),
('Neo Soul', 10),
('Contemporary R&B', 10);

-- Εισαγωγή καλλιτεχνών (PERFORMER)
INSERT INTO PERFORMER (type, stage_name, website, instagram, image, image_description) VALUES
-- Σόλο καλλιτέχνες
('solo', 'Adele', 'https://www.adele.com', 'adele', 'adele.jpg', 'Adele performing on stage'),
('solo', 'Ed Sheeran', 'https://www.edsheeran.com', 'teddysphotos', 'ed_sheeran.jpg', 'Ed Sheeran with acoustic guitar'),
('solo', 'Beyoncé', 'https://www.beyonce.com', 'beyonce', 'beyonce.jpg', 'Beyoncé during world tour'),
('solo', 'The Weeknd', 'https://www.theweeknd.com', 'theweeknd', 'the_weeknd.jpg', 'The Weeknd in concert'),
('solo', 'Dua Lipa', 'https://www.dualipa.com', 'dualipa', 'dua_lipa.jpg', 'Dua Lipa performing hit single'),
('solo', 'Kendrick Lamar', 'https://www.kendricklamar.com', 'kendricklamar', 'kendrick_lamar.jpg', 'Kendrick Lamar live performance'),
('solo', 'Billie Eilish', 'https://www.billieeilish.com', 'billieeilish', 'billie_eilish.jpg', 'Billie Eilish on main stage'),
('solo', 'Post Malone', 'https://www.postmalone.com', 'postmalone', 'post_malone.jpg', 'Post Malone with microphone'),
('solo', 'Taylor Swift', 'https://www.taylorswift.com', 'taylorswift', 'taylor_swift.jpg', 'Taylor Swift during Eras Tour'),
('solo', 'Bruno Mars', 'https://www.brunomars.com', 'brunomars', 'bruno_mars.jpg', 'Bruno Mars dancing on stage'),
('solo', 'Ariana Grande', 'https://www.arianagrande.com', 'arianagrande', 'ariana_grande.jpg', 'Ariana Grande vocal performance'),
('solo', 'Drake', 'https://www.drakeofficial.com', 'champagnepapi', 'drake.jpg', 'Drake performing to stadium crowd'),
('solo', 'Lady Gaga', 'https://www.ladygaga.com', 'ladygaga', 'lady_gaga.jpg', 'Lady Gaga in elaborate costume'),
('solo', 'Justin Bieber', 'https://www.justinbiebermusic.com', 'justinbieber', 'justin_bieber.jpg', 'Justin Bieber on world tour'),
('solo', 'Rihanna', 'https://www.rihannanow.com', 'badgalriri', 'rihanna.jpg', 'Rihanna performing hit songs'),
('solo', 'Harry Styles', 'https://www.hstyles.co.uk', 'harrystyles', 'harry_styles.jpg', 'Harry Styles with fans'),
('solo', 'Lizzo', 'https://www.lizzomusic.com', 'lizzobeeating', 'lizzo.jpg', 'Lizzo playing flute on stage'),
('solo', 'Bad Bunny', 'https://www.badbunnyofficial.com', 'badbunnypr', 'bad_bunny.jpg', 'Bad Bunny during concert'),
('solo', 'Lorde', 'https://www.lorde.co.nz', 'lordemusic', 'lorde.jpg', 'Lorde performing at night'),
('solo', 'Frank Ocean', 'https://www.frankocean.com', 'blonded', 'frank_ocean.jpg', 'Frank Ocean rare live appearance'),
('solo', 'Daft Punk', 'https://www.daftpunk.com', 'daftpunk', 'daft_punk.jpg', 'Daft Punk with iconic helmets'),
('solo', 'David Guetta', 'https://www.davidguetta.com', 'davidguetta', 'david_guetta.jpg', 'David Guetta DJ set'),
('solo', 'Skrillex', 'https://www.skrillex.com', 'skrillex', 'skrillex.jpg', 'Skrillex performing electronic set'),
('solo', 'Deadmau5', 'https://www.deadmau5.com', 'deadmau5', 'deadmau5.jpg', 'Deadmau5 with mouse head'),
('solo', 'Calvin Harris', 'https://www.calvinharris.com', 'calvinharris', 'calvin_harris.jpg', 'Calvin Harris at DJ booth'),


-- Συγκροτήματα
('band', 'Coldplay', 'https://www.coldplay.com', 'coldplay', 'coldplay.jpg', 'Coldplay performing with light show'),
('band', 'Imagine Dragons', 'https://www.imaginedragonsmusic.com', 'imaginedragons', 'imagine_dragons.jpg', 'Imagine Dragons on stage'),
('band', 'Maroon 5', 'https://www.maroon5.com', 'maroon5', 'maroon_5.jpg', 'Maroon 5 live concert'),
('band', 'Twenty One Pilots', 'https://www.twentyonepilots.com', 'twentyonepilots', 'twenty_one_pilots.jpg', 'Twenty One Pilots duo performing'),
('band', 'The 1975', 'https://www.the1975.com', 'the1975', 'the_1975.jpg', 'The 1975 with neon lights'),
('band', 'Arctic Monkeys', 'https://www.arcticmonkeys.com', 'arcticmonkeys', 'arctic_monkeys.jpg', 'Arctic Monkeys rock performance'),
('band', 'Foo Fighters', 'https://www.foofighters.com', 'foofighters', 'foo_fighters.jpg', 'Foo Fighters with Dave Grohl'),
('band', 'Red Hot Chili Peppers', 'https://www.redhotchilipeppers.com', 'chilipeppers', 'rhcp.jpg', 'Red Hot Chili Peppers on stage'),
('band', 'Metallica', 'https://www.metallica.com', 'metallica', 'metallica.jpg', 'Metallica heavy metal concert'),
('band', 'Radiohead', 'https://www.radiohead.com', 'radiohead', 'radiohead.jpg', 'Radiohead atmospheric performance'),
('band', 'The Killers', 'https://www.thekillersmusic.com', 'thekillers', 'the_killers.jpg', 'The Killers with Brandon Flowers'),
('band', 'Muse', 'https://www.muse.mu', 'muse', 'muse.jpg', 'Muse with light production'),
('band', 'Linkin Park', 'https://www.linkinpark.com', 'linkinpark', 'linkin_park.jpg', 'Linkin Park performing live'),
('band', 'Green Day', 'https://www.greenday.com', 'greenday', 'green_day.jpg', 'Green Day punk rock show'),
('band', 'Tame Impala', 'https://www.tameimpala.com', 'tameimpala', 'tame_impala.jpg', 'Tame Impala psychedelic visuals'),
('band', 'The Strokes', 'https://www.thestrokes.com', 'thestrokes', 'the_strokes.jpg', 'The Strokes indie rock performance'),
('band', 'Gorillaz', 'https://www.gorillaz.com', 'gorillaz', 'gorillaz.jpg', 'Gorillaz with animated visuals'),
('band', 'Florence + The Machine', 'https://www.florenceandthemachine.net', 'florenceandthemachine', 'florence.jpg', 'Florence Welch performing'),
('band', 'Arcade Fire', 'https://www.arcadefire.com', 'arcadefire', 'arcade_fire.jpg', 'Arcade Fire ensemble on stage'),
('band', 'The Black Keys', 'https://www.theblackkeys.com', 'theblackkeys', 'black_keys.jpg', 'The Black Keys duo performing'),
('band', 'Kings of Leon', 'https://www.kingsofleon.com', 'kingsofleon', 'kings_of_leon.jpg', 'Kings of Leon rock concert'),
('band', 'Vampire Weekend', 'https://www.vampireweekend.com', 'vampireweekend', 'vampire_weekend.jpg', 'Vampire Weekend indie performance'),
('band', 'The xx', 'https://www.thexx.info', 'thexx', 'the_xx.jpg', 'The xx minimalist stage setup'),
('band', 'MGMT', 'https://www.whoismgmt.com', 'mgmt', 'mgmt.jpg', 'MGMT with psychedelic backdrop'),
('band', 'Paramore', 'https://www.paramore.net', 'paramore', 'paramore.jpg', 'Paramore with Hayley Williams');

-- Εισαγωγή σόλο καλλιτεχνών (ARTIST)
INSERT INTO ARTIST (first_name, last_name, birthdate, performer_id) VALUES
('Adele', 'Adkins', '1988-05-05 00:00:00', 1),
('Edward', 'Sheeran', '1991-02-17 00:00:00', 2),
('Beyoncé', 'Knowles', '1981-09-04 00:00:00', 3),
('Abel', 'Tesfaye', '1990-02-16 00:00:00', 4),
('Dua', 'Lipa', '1995-08-22 00:00:00', 5),
('Kendrick', 'Lamar', '1987-06-17 00:00:00', 6),
('Billie', 'Eilish', '2001-12-18 00:00:00', 7),
('Austin', 'Post', '1995-07-04 00:00:00', 8),
('Taylor', 'Swift', '1989-12-13 00:00:00', 9),
('Peter', 'Hernandez', '1985-10-08 00:00:00', 10),
('Ariana', 'Grande', '1993-06-26 00:00:00', 11),
('Aubrey', 'Graham', '1986-10-24 00:00:00', 12),
('Stefani', 'Germanotta', '1986-03-28 00:00:00', 13),
('Justin', 'Bieber', '1994-03-01 00:00:00', 14),
('Robyn', 'Fenty', '1988-02-20 00:00:00', 15),
('Harry', 'Styles', '1994-02-01 00:00:00', 16),
('Melissa', 'Jefferson', '1988-04-27 00:00:00', 17),
('Benito', 'Martínez', '1994-03-10 00:00:00', 18),
('Ella', 'Yelich-O''Connor', '1996-11-07 00:00:00', 19),
('Christopher', 'Breaux', '1987-10-28 00:00:00', 20),
('Thomas', 'Bangalter', '1975-01-03 00:00:00', 21),
('David', 'Guetta', '1967-11-07 00:00:00', 22),
('Sonny', 'Moore', '1988-01-15 00:00:00', 23),
('Joel', 'Zimmerman', '1981-01-05 00:00:00', 24),
('Adam', 'Wiles', '1984-01-17 00:00:00', 25);

-- Εισαγωγή συγκροτημάτων (BAND)
INSERT INTO BAND (formation_date, performer_id) VALUES
('1996-01-01 00:00:00', 26),
('2008-01-01 00:00:00', 27),
('1994-01-01 00:00:00', 28),
('2009-01-01 00:00:00', 29),
('2002-01-01 00:00:00', 30),
('2002-01-01 00:00:00', 31),
('1994-01-01 00:00:00', 32),
('1983-01-01 00:00:00', 33),
('1981-01-01 00:00:00', 34),
('1985-01-01 00:00:00', 35),
('2001-01-01 00:00:00', 36),
('1994-01-01 00:00:00', 37),
('1996-01-01 00:00:00', 38),
('1986-01-01 00:00:00', 39),
('2007-01-01 00:00:00', 40),
('1998-01-01 00:00:00', 41),
('1998-01-01 00:00:00', 42),
('2006-01-01 00:00:00', 43),
('2001-01-01 00:00:00', 44),
('2001-01-01 00:00:00', 45),
('1999-01-01 00:00:00', 46),
('2006-01-01 00:00:00', 47),
('2005-01-01 00:00:00', 48),
('2002-01-01 00:00:00', 49),
('2004-01-01 00:00:00', 50);

-- Εισαγωγή συσχέτισης καλλιτεχνών-μουσικών ειδών (PERFORMER_GENRE)
INSERT INTO PERFORMER_GENRE (performer_id, genre_id) VALUES
-- Adele
(1, 2), (1, 10), (1, 33),
-- Ed Sheeran
(2, 2), (2, 6), (2, 7),
-- Beyoncé
(3, 2), (3, 10), (3, 33),
-- The Weeknd
(4, 2), (4, 10), (4, 3),
-- Dua Lipa
(5, 2), (5, 3), (5, 9),
-- Kendrick Lamar
(6, 4), (6, 17), (6, 10),
-- Billie Eilish
(7, 2), (7, 11), (7, 12),
-- Post Malone
(8, 4), (8, 15), (8, 2),
-- Taylor Swift
(9, 2), (9, 6), (9, 7),
-- Bruno Mars
(10, 2), (10, 10), (10, 6),
-- Ariana Grande
(11, 2), (11, 9), (11, 10),
-- Drake
(12, 4), (12, 15), (12, 10),
-- Lady Gaga
(13, 2), (13, 3), (13, 9),
-- Justin Bieber
(14, 2), (14, 9), (14, 10),
-- Rihanna
(15, 2), (15, 10), (15, 3),
-- Harry Styles
(16, 2), (16, 11), (16, 6),
-- Lizzo
(17, 2), (17, 10), (17, 4),
-- Bad Bunny
(18, 2), (18, 28), (18, 4),
-- Lorde
(19, 2), (19, 11), (19, 12),
-- Frank Ocean
(20, 10), (20, 33), (20, 2),
-- Daft Punk
(21, 3), (21, 10), (21, 11),
-- David Guetta
(22, 3), (22, 11), (22, 12),
-- Skrillex
(23, 3), (23, 14), (23, 13),
-- Deadmau5
(24, 3), (24, 10), (24, 12),
-- Calvin Harris
(25, 3), (25, 11), (25, 9),
-- Coldplay
(26, 1), (26, 11), (26, 6),
-- Imagine Dragons
(27, 1), (27, 11), (27, 2),
-- Maroon 5
(28, 2), (28, 6), (28, 9),
-- Twenty One Pilots
(29, 1), (29, 11), (29, 4),
-- The 1975
(30, 1), (30, 11), (30, 2),
-- Arctic Monkeys
(31, 1), (31, 11), (31, 12),
-- Foo Fighters
(32, 1), (32, 3), (32, 13),
-- Red Hot Chili Peppers
(33, 1), (33, 3), (33, 5),
-- Metallica
(34, 9), (34, 29), (34, 1),
-- Radiohead
(35, 1), (35, 11), (35, 4),
-- The Killers
(36, 1), (36, 11), (36, 6),
-- Muse
(37, 1), (37, 4), (37, 3),
-- Linkin Park
(38, 1), (38, 9), (38, 4),
-- Green Day
(39, 1), (39, 5), (39, 12),
-- Tame Impala
(40, 1), (40, 11), (40, 3),
-- The Strokes
(41, 1), (41, 11), (41, 12),
-- Gorillaz
(42, 1), (42, 3), (42, 4),
-- Florence + The Machine
(43, 1), (43, 11), (43, 2),
-- Arcade Fire
(44, 1), (44, 11), (44, 7),
-- The Black Keys
(45, 1), (45, 11), (45, 12),
-- Kings of Leon
(46, 1), (46, 11), (46, 12),
-- Vampire Weekend
(47, 1), (47, 11), (47, 7),
-- The xx
(48, 1), (48, 11), (48, 3),
-- MGMT
(49, 1), (49, 11), (49, 3),
-- Paramore
(50, 1), (50, 5), (50, 2);

-- Εισαγωγή μελών συγκροτημάτων (ARTIST_BAND)
-- Πρώτα θα δημιουργήσω μερικούς επιπλέον καλλιτέχνες για τα συγκροτήματα
INSERT INTO PERFORMER (type, stage_name, website, instagram, image, image_description) VALUES
('solo', 'Chris Martin', NULL, 'chrismartin', 'chris_martin.jpg', 'Chris Martin of Coldplay'),
('solo', 'Jonny Buckland', NULL, NULL, 'jonny_buckland.jpg', 'Jonny Buckland of Coldplay'),
('solo', 'Guy Berryman', NULL, NULL, 'guy_berryman.jpg', 'Guy Berryman of Coldplay'),
('solo', 'Will Champion', NULL, NULL, 'will_champion.jpg', 'Will Champion of Coldplay'),
('solo', 'Dan Reynolds', NULL, 'danreynolds', 'dan_reynolds.jpg', 'Dan Reynolds of Imagine Dragons'),
('solo', 'Wayne Sermon', NULL, NULL, 'wayne_sermon.jpg', 'Wayne Sermon of Imagine Dragons'),
('solo', 'Ben McKee', NULL, NULL, 'ben_mckee.jpg', 'Ben McKee of Imagine Dragons'),
('solo', 'Daniel Platzman', NULL, NULL, 'daniel_platzman.jpg', 'Daniel Platzman of Imagine Dragons'),
('solo', 'Adam Levine', NULL, 'adamlevine', 'adam_levine.jpg', 'Adam Levine of Maroon 5'),
('solo', 'James Valentine', NULL, NULL, 'james_valentine.jpg', 'James Valentine of Maroon 5'),
('solo', 'Tyler Joseph', NULL, 'tylerrjoseph', 'tyler_joseph.jpg', 'Tyler Joseph of Twenty One Pilots'),
('solo', 'Josh Dun', NULL, 'joshuadun', 'josh_dun.jpg', 'Josh Dun of Twenty One Pilots'),
('solo', 'Matty Healy', NULL, 'trumanblack', 'matty_healy.jpg', 'Matty Healy of The 1975'),
('solo', 'Adam Hann', NULL, NULL, 'adam_hann.jpg', 'Adam Hann of The 1975'),
('solo', 'Ross MacDonald', NULL, NULL, 'ross_macdonald.jpg', 'Ross MacDonald of The 1975'),
('solo', 'George Daniel', NULL, NULL, 'george_daniel.jpg', 'George Daniel of The 1975'),
('solo', 'Alex Turner', NULL, NULL, 'alex_turner.jpg', 'Alex Turner of Arctic Monkeys'),
('solo', 'Jamie Cook', NULL, NULL, 'jamie_cook.jpg', 'Jamie Cook of Arctic Monkeys'),
('solo', 'Nick OMalley', NULL, NULL, 'nick_omalley.jpg', 'Nick OMalley of Arctic Monkeys'),
('solo', 'Matt Helders', NULL, NULL, 'matt_helders.jpg', 'Matt Helders of Arctic Monkeys');

-- Εισαγωγή των καλλιτεχνών για τα μέλη των συγκροτημάτων
INSERT INTO ARTIST (first_name, last_name, birthdate, performer_id) VALUES
('Chris', 'Martin', '1977-03-02 00:00:00', 51),
('Jonny', 'Buckland', '1977-09-11 00:00:00', 52),
('Guy', 'Berryman', '1978-04-12 00:00:00', 53),
('Will', 'Champion', '1978-07-31 00:00:00', 54),
('Dan', 'Reynolds', '1987-07-14 00:00:00', 55),
('Wayne', 'Sermon', '1984-06-15 00:00:00', 56),
('Ben', 'McKee', '1985-04-07 00:00:00', 57),
('Daniel', 'Platzman', '1986-09-28 00:00:00', 58),
('Adam', 'Levine', '1979-03-18 00:00:00', 59),
('James', 'Valentine', '1978-10-05 00:00:00', 60),
('Tyler', 'Joseph', '1988-12-01 00:00:00', 61),
('Josh', 'Dun', '1988-06-18 00:00:00', 62),
('Matty', 'Healy', '1989-04-08 00:00:00', 63),
('Adam', 'Hann', '1988-07-20 00:00:00', 64),
('Ross', 'MacDonald', '1989-10-02 00:00:00', 65),
('George', 'Daniel', '1990-03-23 00:00:00', 66),
('Alex', 'Turner', '1986-01-06 00:00:00', 67),
('Jamie', 'Cook', '1985-07-08 00:00:00', 68),
('Nick', 'O''Malley', '1985-07-05 00:00:00', 69),
('Matt', 'Helders', '1986-05-07 00:00:00', 70);

-- Συσχέτιση μελών με συγκροτήματα
INSERT INTO ARTIST_BAND (artist_id, band_id, join_date, leave_date) VALUES
-- Coldplay
(26, 1, '1996-01-01 00:00:00', NULL),
(27, 1, '1996-01-01 00:00:00', NULL),
(28, 1, '1996-01-01 00:00:00', NULL),
(29, 1, '1996-01-01 00:00:00', NULL),
-- Imagine Dragons
(30, 2, '2008-01-01 00:00:00', NULL),
(31, 2, '2008-01-01 00:00:00', NULL),
(32, 2, '2008-01-01 00:00:00', NULL),
(33, 2, '2008-01-01 00:00:00', NULL),
-- Maroon 5
(34, 3, '1994-01-01 00:00:00', NULL),
(35, 3, '1994-01-01 00:00:00', NULL),
-- Twenty One Pilots
(36, 4, '2009-01-01 00:00:00', NULL),
(37, 4, '2011-01-01 00:00:00', NULL),
-- The 1975
(38, 5, '2002-01-01 00:00:00', NULL),
(39, 5, '2002-01-01 00:00:00', NULL),
(40, 5, '2002-01-01 00:00:00', NULL),
(41, 5, '2002-01-01 00:00:00', NULL),
-- Arctic Monkeys
(42, 6, '2002-01-01 00:00:00', NULL),
(43, 6, '2002-01-01 00:00:00', NULL),
(44, 6, '2006-01-01 00:00:00', NULL),
(45, 6, '2002-01-01 00:00:00', NULL);

-- Εισαγωγή εκδηλώσεων (EVENT)
INSERT INTO EVENT (name, date, description, festival_id, venue_id) VALUES
-- Coachella 2020 (festival_id = 1)
('Coachella Day 1 Main Stage', '2020-04-10 16:00:00', 'Opening day performances on the main stage', 1, 1),
('Coachella Day 1 Sahara', '2020-04-10 14:00:00', 'Electronic music showcase', 1, 2),
('Coachella Day 2 Main Stage', '2020-04-11 16:00:00', 'Second day headline performances', 1, 1),
('Coachella Day 2 Mojave', '2020-04-11 14:00:00', 'Alternative and indie performances', 1, 3),
('Coachella Day 3 Main Stage', '2020-04-12 16:00:00', 'Final day headline performances', 1, 1),
('Coachella Day 3 Outdoor Theatre', '2020-04-12 14:00:00', 'Open-air performances', 1, 5),

-- Glastonbury 2021 (festival_id = 2)
('Glastonbury Pyramid Stage Day 1', '2021-06-23 12:00:00', 'Opening performances on the iconic Pyramid Stage', 2, 6),
('Glastonbury Other Stage Day 1', '2021-06-23 12:30:00', 'Alternative rock and indie performances', 2, 7),
('Glastonbury Pyramid Stage Day 2', '2021-06-24 12:00:00', 'Second day headline acts', 2, 6),
('Glastonbury West Holts Day 2', '2021-06-24 13:00:00', 'World music and jazz performances', 2, 8),
('Glastonbury Pyramid Stage Day 3', '2021-06-25 12:00:00', 'Third day main performances', 2, 6),
('Glastonbury Park Stage Day 3', '2021-06-25 13:30:00', 'Emerging artists showcase', 2, 9),
('Glastonbury Pyramid Stage Day 4', '2021-06-26 12:00:00', 'Fourth day headline performances', 2, 6),
('Glastonbury Acoustic Stage Day 4', '2021-06-26 11:00:00', 'Acoustic and folk performances', 2, 10),
('Glastonbury Pyramid Stage Day 5', '2021-06-27 12:00:00', 'Closing day performances', 2, 6),
('Glastonbury Other Stage Day 5', '2021-06-27 12:30:00', 'Final day alternative acts', 2, 7),

-- Lollapalooza 2021 (festival_id = 3)
('Lollapalooza T-Mobile Day 1', '2021-07-29 12:00:00', 'Opening day on the main stage', 3, 11),
('Lollapalooza Bud Light Day 1', '2021-07-29 12:30:00', 'Alternative rock showcase', 3, 12),
('Lollapalooza T-Mobile Day 2', '2021-07-30 12:00:00', 'Second day headline performances', 3, 11),
('Lollapalooza Perrys Day 2', '2021-07-30 13:00:00', 'Electronic dance music showcase', 3, 13),
('Lollapalooza T-Mobile Day 3', '2021-07-31 12:00:00', 'Third day main stage performances', 3, 11),
('Lollapalooza BMI Stage Day 3', '2021-07-31 11:30:00', 'Emerging talent showcase', 3, 14),
('Lollapalooza T-Mobile Day 4', '2021-08-01 12:00:00', 'Closing day headline acts', 3, 11),
('Lollapalooza Bud Light Day 4', '2021-08-01 12:30:00', 'Final day alternative performances', 3, 12),

-- Fuji Rock 2022 (festival_id = 4)
('Fuji Rock Green Stage Day 1', '2022-07-29 11:00:00', 'Opening performances on the main stage', 4, 15),
('Fuji Rock White Stage Day 1', '2022-07-29 11:30:00', 'Alternative and rock performances', 4, 16),
('Fuji Rock Green Stage Day 2', '2022-07-30 11:00:00', 'Second day headline acts', 4, 15),
('Fuji Rock Field of Heaven Day 2', '2022-07-30 12:00:00', 'Eco-friendly stage performances', 4, 17),
('Fuji Rock Green Stage Day 3', '2022-07-31 11:00:00', 'Closing day performances', 4, 15),
('Fuji Rock White Stage Day 3', '2022-07-31 11:30:00', 'Final day rock showcase', 4, 16),

-- Primavera Sound 2022 (festival_id = 5)
('Primavera Main Stage Day 1', '2022-06-02 16:00:00', 'Opening day headline performances', 5, 18),
('Primavera Ray-Ban Stage Day 1', '2022-06-02 15:00:00', 'Indie rock showcase', 5, 19),
('Primavera Main Stage Day 2', '2022-06-03 16:00:00', 'Second day main performances', 5, 18),
('Primavera Pitchfork Stage Day 2', '2022-06-03 15:30:00', 'Critically acclaimed artists', 5, 20),
('Primavera Main Stage Day 3', '2022-06-04 16:00:00', 'Closing day performances', 5, 18),
('Primavera Ray-Ban Stage Day 3', '2022-06-04 15:00:00', 'Final day indie showcase', 5, 19),

-- Rock am Ring 2023 (festival_id = 6)
('Rock am Ring Centerfeld Day 1', '2023-06-02 14:00:00', 'Opening day rock performances', 6, 21),
('Rock am Ring Mandora Stage Day 1', '2023-06-02 13:00:00', 'Heavy metal showcase', 6, 22),
('Rock am Ring Centerfeld Day 2', '2023-06-03 14:00:00', 'Second day headline acts', 6, 21),
('Rock am Ring Mandora Stage Day 2', '2023-06-03 13:00:00', 'Hard rock performances', 6, 22),
('Rock am Ring Centerfeld Day 3', '2023-06-04 14:00:00', 'Closing day performances', 6, 21),
('Rock am Ring Mandora Stage Day 3', '2023-06-04 13:00:00', 'Final day metal showcase', 6, 22),

-- Woodstock Revival 2023 (festival_id = 7)
('Woodstock Peace Garden Day 1', '2023-08-03 15:00:00', 'Opening day performances', 7, 23),
('Woodstock Freedom Stage Day 1', '2023-08-03 14:00:00', 'Alternative rock showcase', 7, 24),
('Woodstock Peace Garden Day 2', '2023-08-04 15:00:00', 'Second day headline acts', 7, 23),
('Woodstock Freedom Stage Day 2', '2023-08-04 14:00:00', 'Folk and acoustic performances', 7, 24),
('Woodstock Peace Garden Day 3', '2023-08-05 15:00:00', 'Third day main performances', 7, 23),
('Woodstock Freedom Stage Day 3', '2023-08-05 14:00:00', 'Indie rock showcase', 7, 24),
('Woodstock Peace Garden Day 4', '2023-08-06 15:00:00', 'Closing day performances', 7, 23),
('Woodstock Freedom Stage Day 4', '2023-08-06 14:00:00', 'Final day showcase', 7, 24),

-- Boom Festival 2024 (festival_id = 8)
('Boom Dance Temple Day 1', '2024-07-18 16:00:00', 'Opening electronic music showcase', 8, 25),
('Boom Sacred Fire Day 1', '2024-07-18 15:00:00', 'World music performances', 8, 26),
('Boom Dance Temple Day 2', '2024-07-19 16:00:00', 'Second day electronic showcase', 8, 25),
('Boom Sacred Fire Day 2', '2024-07-19 15:00:00', 'Spiritual music performances', 8, 26),
('Boom Dance Temple Day 3', '2024-07-20 16:00:00', 'Third day electronic showcase', 8, 25),
('Boom Sacred Fire Day 3', '2024-07-20 15:00:00', 'Global fusion performances', 8, 26),
('Boom Dance Temple Day 4', '2024-07-21 16:00:00', 'Closing day electronic showcase', 8, 25),
('Boom Sacred Fire Day 4', '2024-07-21 15:00:00', 'Final day world music', 8, 26),

-- Ultra Music Festival 2025 (festival_id = 9)
('Ultra Main Stage Day 1', '2025-05-28 16:00:00', 'Opening day EDM performances', 9, 27),
('Ultra Resistance Stage Day 1', '2025-05-28 15:00:00', 'Underground electronic showcase', 9, 28),
('Ultra Main Stage Day 2', '2025-05-29 16:00:00', 'Second day headline DJs', 9, 27),
('Ultra Resistance Stage Day 2', '2025-05-29 15:00:00', 'Techno and house showcase', 9, 28),
('Ultra Main Stage Day 3', '2025-05-30 16:00:00', 'Closing day performances', 9, 27),
('Ultra Resistance Stage Day 3', '2025-05-30 15:00:00', 'Final day underground showcase', 9, 28),

-- Creamfields 2025 (festival_id = 10)
('Creamfields Steel Yard Day 1', '2025-08-22 16:00:00', 'Opening day electronic showcase', 10, 29),
('Creamfields Arc Stage Day 1', '2025-08-22 15:00:00', 'Main stage EDM performances', 10, 30),
('Creamfields Steel Yard Day 2', '2025-08-23 16:00:00', 'Second day electronic showcase', 10, 29),
('Creamfields Arc Stage Day 2', '2025-08-23 15:00:00', 'Main stage headline DJs', 10, 30),
('Creamfields Steel Yard Day 3', '2025-08-24 16:00:00', 'Closing day electronic showcase', 10, 29),
('Creamfields Arc Stage Day 3', '2025-08-24 15:00:00', 'Final day main stage performances', 10, 30);

-- Εισαγωγή εμφανίσεων (PERFORMANCE)
INSERT INTO PERFORMANCE (type, start_time, end_time, performer_id, event_id) VALUES
-- Coachella 2020 (event_id 1-6)
('headline', '2020-04-10 21:00:00', '2020-04-10 23:00:00', 3, 1), -- Beyoncé at Coachella Main Stage Day 1
('special guest', '2020-04-10 19:00:00', '2020-04-10 20:30:00', 9, 1), -- Taylor Swift at Coachella Main Stage Day 1
('warm up', '2020-04-10 17:00:00', '2020-04-10 18:30:00', 16, 1), -- Harry Styles at Coachella Main Stage Day 1
('headline', '2020-04-10 20:00:00', '2020-04-10 22:00:00', 21, 2), -- Daft Punk at Coachella Day 1 Sahara
('warm up', '2020-04-10 18:00:00', '2020-04-10 19:30:00', 25, 2), -- Calvin Harris at Coachella Day 1 Sahara
('headline', '2020-04-11 21:00:00', '2020-04-11 23:00:00', 26, 3), -- Coldplay at Coachella Day 2 Main Stage
('special guest', '2020-04-11 19:00:00', '2020-04-11 20:30:00', 10, 3), -- Bruno Mars at Coachella Day 2 Main Stage
('warm up', '2020-04-11 17:00:00', '2020-04-11 18:30:00', 17, 3), -- Lizzo at Coachella Day 2 Main Stage
('headline', '2020-04-11 20:00:00', '2020-04-11 22:00:00', 31, 4), -- Arctic Monkeys at Coachella Day 2 Mojave
('warm up', '2020-04-11 18:00:00', '2020-04-11 19:30:00', 41, 4), -- The Strokes at Coachella Day 2 Mojave
('headline', '2020-04-12 21:00:00', '2020-04-12 23:00:00', 4, 5), -- The Weeknd at Coachella Day 3 Main Stage
('special guest', '2020-04-12 19:00:00', '2020-04-12 20:30:00', 11, 5), -- Ariana Grande at Coachella Day 3 Main Stage
('warm up', '2020-04-12 17:00:00', '2020-04-12 18:30:00', 18, 5), -- Bad Bunny at Coachella Day 3 Main Stage
('headline', '2020-04-12 20:00:00', '2020-04-12 22:00:00', 22, 6), -- David Guetta at Coachella Day 3 Outdoor Theatre
('warm up', '2020-04-12 18:00:00', '2020-04-12 19:30:00', 47, 6), -- Vampire Weekend at Coachella Day 3 Outdoor Theatre

-- Glastonbury 2021 (event_id 7-16)
('headline', '2021-06-23 20:00:00', '2021-06-23 22:00:00', 1, 7), -- Adele at Glastonbury Pyramid Stage Day 1
('special guest', '2021-06-23 18:00:00', '2021-06-23 19:30:00', 13, 7), -- Lady Gaga at Glastonbury Pyramid Stage Day 1
('warm up', '2021-06-23 16:00:00', '2021-06-23 17:30:00', 19, 7), -- Lorde at Glastonbury Pyramid Stage Day 1
('headline', '2021-06-23 19:30:00', '2021-06-23 21:30:00', 35, 8), -- Radiohead at Glastonbury Other Stage Day 1
('warm up', '2021-06-23 17:30:00', '2021-06-23 19:00:00', 43, 8), -- Florence + The Machine at Glastonbury Other Stage Day 1
('headline', '2021-06-24 20:00:00', '2021-06-24 22:00:00', 2, 9), -- Ed Sheeran at Glastonbury Pyramid Stage Day 2
('special guest', '2021-06-24 18:00:00', '2021-06-24 19:30:00', 14, 9), -- Justin Bieber at Glastonbury Pyramid Stage Day 2
('warm up', '2021-06-24 16:00:00', '2021-06-24 17:30:00', 20, 9), -- Frank Ocean at Glastonbury Pyramid Stage Day 2
('headline', '2021-06-24 19:30:00', '2021-06-24 21:30:00', 33, 10), -- Red Hot Chili Peppers at Glastonbury West Holts Day 2
('warm up', '2021-06-24 17:30:00', '2021-06-24 19:00:00', 44, 10), -- Arcade Fire at Glastonbury West Holts Day 2
('headline', '2021-06-25 20:00:00', '2021-06-25 22:00:00', 5, 11), -- Dua Lipa at Glastonbury Pyramid Stage Day 3
('special guest', '2021-06-25 18:00:00', '2021-06-25 19:30:00', 15, 11), -- Rihanna at Glastonbury Pyramid Stage Day 3
('warm up', '2021-06-25 16:00:00', '2021-06-25 17:30:00', 20, 11), -- Frank Ocean at Glastonbury Pyramid Stage Day 3
('headline', '2021-06-25 19:30:00', '2021-06-25 21:30:00', 36, 12), -- The Killers at Glastonbury Park Stage Day 3
('warm up', '2021-06-25 17:30:00', '2021-06-25 19:00:00', 45, 12), -- The Black Keys at Glastonbury Park Stage Day 3
('headline', '2021-06-26 20:00:00', '2021-06-26 22:00:00', 6, 13), -- Kendrick Lamar at Glastonbury Pyramid Stage Day 4
('special guest', '2021-06-26 18:00:00', '2021-06-26 19:30:00', 12, 13), -- Drake at Glastonbury Pyramid Stage Day 4
('warm up', '2021-06-26 16:00:00', '2021-06-26 17:30:00', 28, 13), -- Maroon 5 at Glastonbury Pyramid Stage Day 4
('headline', '2021-06-26 19:00:00', '2021-06-26 21:00:00', 7, 14), -- Billie Eilish at Glastonbury Acoustic Stage Day 4
('warm up', '2021-06-26 17:00:00', '2021-06-26 18:30:00', 20, 14), -- Frank Ocean at Glastonbury Acoustic Stage Day 4
('headline', '2021-06-27 20:00:00', '2021-06-27 22:00:00', 8, 15), -- Post Malone at Glastonbury Pyramid Stage Day 5
('special guest', '2021-06-27 18:00:00', '2021-06-27 19:30:00', 16, 15), -- Harry Styles at Glastonbury Pyramid Stage Day 5
('warm up', '2021-06-27 16:00:00', '2021-06-27 17:30:00', 30, 15), -- The 1975 at Glastonbury Pyramid Stage Day 5
('headline', '2021-06-27 19:30:00', '2021-06-27 21:30:00', 37, 16), -- Muse at Glastonbury Other Stage Day 5
('warm up', '2021-06-27 17:30:00', '2021-06-27 19:00:00', 22, 16), -- David Guetta at Glastonbury Other Stage Day 5

-- Lollapalooza 2021 (event_id 17-24)
('headline', '2021-07-29 20:00:00', '2021-07-29 22:00:00', 9, 17), -- Taylor Swift at Lollapalooza T-Mobile Day 1
('special guest', '2021-07-29 18:00:00', '2021-07-29 19:30:00', 17, 17), -- Lizzo at Lollapalooza T-Mobile Day 1
('warm up', '2021-07-29 16:00:00', '2021-07-29 17:30:00', 31, 17), -- Arctic Monkeys at Lollapalooza T-Mobile Day 1
('headline', '2021-07-29 19:30:00', '2021-07-29 21:30:00', 38, 18), -- Linkin Park at Lollapalooza Bud Light Day 1
('warm up', '2021-07-29 17:30:00', '2021-07-29 19:00:00', 47, 18), -- Vampire Weekend at Lollapalooza Bud Light Day 1
('headline', '2021-07-30 20:00:00', '2021-07-30 22:00:00', 10, 19), -- Bruno Mars at Lollapalooza T-Mobile Day 2
('special guest', '2021-07-30 18:00:00', '2021-07-30 19:30:00', 18, 19), -- Bad Bunny at Lollapalooza T-Mobile Day 2
('warm up', '2021-07-30 16:00:00', '2021-07-30 17:30:00', 32, 19), -- Foo Fighters at Lollapalooza T-Mobile Day 2
('headline', '2021-07-30 19:30:00', '2021-07-30 21:30:00', 22, 20), -- David Guetta at Lollapalooza Perry's Day 2
('warm up', '2021-07-30 17:30:00', '2021-07-30 19:00:00', 23, 20), -- Skrillex at Lollapalooza Perry's Day 2
('headline', '2021-07-31 20:00:00', '2021-07-31 22:00:00', 11, 21), -- Ariana Grande at Lollapalooza T-Mobile Day 3
('special guest', '2021-07-31 18:00:00', '2021-07-31 19:30:00', 19, 21), -- Lorde at Lollapalooza T-Mobile Day 3
('warm up', '2021-07-31 16:00:00', '2021-07-31 17:30:00', 39, 21), -- Green Day at Lollapalooza T-Mobile Day 3
('headline', '2021-07-31 19:00:00', '2021-07-31 21:00:00', 48, 22), -- The xx at Lollapalooza BMI Stage Day 3
('warm up', '2021-07-31 17:00:00', '2021-07-31 18:30:00', 49, 22), -- MGMT at Lollapalooza BMI Stage Day 3
('headline', '2021-08-01 20:00:00', '2021-08-01 22:00:00', 12, 23), -- Drake at Lollapalooza T-Mobile Day 4
('special guest', '2021-08-01 18:00:00', '2021-08-01 19:30:00', 20, 23), -- Frank Ocean at Lollapalooza T-Mobile Day 4
('warm up', '2021-08-01 16:00:00', '2021-08-01 17:30:00', 40, 23), -- Tame Impala at Lollapalooza T-Mobile Day 4
('headline', '2021-08-01 19:30:00', '2021-08-01 21:30:00', 50, 24), -- Paramore at Lollapalooza Bud Light Day 4
('warm up', '2021-08-01 17:30:00', '2021-08-01 19:00:00', 41, 24), -- The Strokes at Lollapalooza Bud Light Day 4

-- Fuji Rock 2022 (event_id 25-30)
('headline', '2022-07-29 19:00:00', '2022-07-29 21:00:00', 26, 25), -- Coldplay at Fuji Rock Green Stage Day 1
('special guest', '2022-07-29 17:00:00', '2022-07-29 18:30:00', 34, 25), -- Metallica at Fuji Rock Green Stage Day 1
('warm up', '2022-07-29 15:00:00', '2022-07-29 16:30:00', 42, 25), -- Gorillaz at Fuji Rock Green Stage Day 1
('headline', '2022-07-29 18:30:00', '2022-07-29 20:30:00', 35, 26), -- Radiohead at Fuji Rock White Stage Day 1
('warm up', '2022-07-29 16:30:00', '2022-07-29 18:00:00', 43, 26), -- Florence + The Machine at Fuji Rock White Stage Day 1
('headline', '2022-07-30 19:00:00', '2022-07-30 21:00:00', 27, 27), -- Imagine Dragons at Fuji Rock Green Stage Day 2
('special guest', '2022-07-30 17:00:00', '2022-07-30 18:30:00', 5, 27), -- Dua Lipa at Fuji Rock Green Stage Day 2
('warm up', '2022-07-30 15:00:00', '2022-07-30 16:30:00', 13, 27), -- Lady Gaga at Fuji Rock Green Stage Day 2
('headline', '2022-07-30 18:30:00', '2022-07-30 20:30:00', 36, 28), -- The Killers at Fuji Rock Field of Heaven Day 2
('warm up', '2022-07-30 16:30:00', '2022-07-30 18:00:00', 44, 28), -- Arcade Fire at Fuji Rock Field of Heaven Day 2
('headline', '2022-07-31 19:00:00', '2022-07-31 21:00:00', 28, 29), -- Maroon 5 at Fuji Rock Green Stage Day 3
('special guest', '2022-07-31 17:00:00', '2022-07-31 18:30:00', 6, 29), -- Kendrick Lamar at Fuji Rock Green Stage Day 3
('warm up', '2022-07-31 15:00:00', '2022-07-31 16:30:00', 14, 29), -- Justin Bieber at Fuji Rock Green Stage Day 3
('headline', '2022-07-31 18:30:00', '2022-07-31 20:30:00', 37, 30), -- Muse at Fuji Rock White Stage Day 3
('warm up', '2022-07-31 16:30:00', '2022-07-31 18:00:00', 45, 30), -- The Black Keys at Fuji Rock White Stage Day 3

-- Primavera Sound 2022 (event_id 31-36)
('headline', '2022-06-02 21:00:00', '2022-06-02 23:00:00', 29, 31), -- Twenty One Pilots at Primavera Main Stage Day 1
('special guest', '2022-06-02 19:00:00', '2022-06-02 20:30:00', 7, 31), -- Billie Eilish at Primavera Main Stage Day 1
('warm up', '2022-06-02 17:00:00', '2022-06-02 18:30:00', 15, 31), -- Rihanna at Primavera Main Stage Day 1
('headline', '2022-06-02 20:30:00', '2022-06-02 22:30:00', 38, 32), -- Linkin Park at Primavera Ray-Ban Stage Day 1
('warm up', '2022-06-02 18:30:00', '2022-06-02 20:00:00', 46, 32), -- Kings of Leon at Primavera Ray-Ban Stage Day 1
('headline', '2022-06-03 21:00:00', '2022-06-03 23:00:00', 30, 33), -- The 1975 at Primavera Main Stage Day 2
('special guest', '2022-06-03 19:00:00', '2022-06-03 20:30:00', 8, 33), -- Post Malone at Primavera Main Stage Day 2
('warm up', '2022-06-03 17:00:00', '2022-06-03 18:30:00', 16, 33), -- Harry Styles at Primavera Main Stage Day 2
('headline', '2022-06-03 20:30:00', '2022-06-03 22:30:00', 39, 34), -- Green Day at Primavera Pitchfork Stage Day 2
('warm up', '2022-06-03 18:30:00', '2022-06-03 20:00:00', 47, 34), -- Vampire Weekend at Primavera Pitchfork Stage Day 2
('headline', '2022-06-04 21:00:00', '2022-06-04 23:00:00', 31, 35), -- Arctic Monkeys at Primavera Main Stage Day 3
('special guest', '2022-06-04 19:00:00', '2022-06-04 20:30:00', 9, 35), -- Taylor Swift at Primavera Main Stage Day 3
('warm up', '2022-06-04 17:00:00', '2022-06-04 18:30:00', 17, 35), -- Lizzo at Primavera Main Stage Day 3
('headline', '2022-06-04 20:30:00', '2022-06-04 22:30:00', 40, 36), -- Tame Impala at Primavera Ray-Ban Stage Day 3
('warm up', '2022-06-04 18:30:00', '2022-06-04 20:00:00', 48, 36), -- The xx at Primavera Ray-Ban Stage Day 3

-- Rock am Ring 2023 (event_id 37-42)
('headline', '2023-06-02 20:00:00', '2023-06-02 22:00:00', 32, 37), -- Foo Fighters at Rock am Ring Centerfeld Day 1
('special guest', '2023-06-02 18:00:00', '2023-06-02 19:30:00', 34, 37), -- Metallica at Rock am Ring Centerfeld Day 1
('warm up', '2023-06-02 16:00:00', '2023-06-02 17:30:00', 38, 37), -- Linkin Park at Rock am Ring Centerfeld Day 1
('headline', '2023-06-02 19:30:00', '2023-06-02 21:30:00', 39, 38), -- Green Day at Rock am Ring Mandora Stage Day 1
('warm up', '2023-06-02 17:30:00', '2023-06-02 19:00:00', 50, 38), -- Paramore at Rock am Ring Mandora Stage Day 1
('headline', '2023-06-03 20:00:00', '2023-06-03 22:00:00', 33, 39), -- Red Hot Chili Peppers at Rock am Ring Centerfeld Day 2
('special guest', '2023-06-03 18:00:00', '2023-06-03 19:30:00', 35, 39), -- Radiohead at Rock am Ring Centerfeld Day 2
('warm up', '2023-06-03 16:00:00', '2023-06-03 17:30:00', 41, 39), -- The Strokes at Rock am Ring Centerfeld Day 2
('headline', '2023-06-03 19:30:00', '2023-06-03 21:30:00', 52, 40), -- Jonny Buckland at Rock am Ring Mandora Stage Day 2
('warm up', '2023-06-03 17:30:00', '2023-06-03 19:00:00', 49, 40), -- MGMT at Rock am Ring Mandora Stage Day 2
('headline', '2023-06-04 20:00:00', '2023-06-04 22:00:00', 37, 41), -- Muse at Rock am Ring Centerfeld Day 3
('special guest', '2023-06-04 18:00:00', '2023-06-04 19:30:00', 36, 41), -- The Killers at Rock am Ring Centerfeld Day 3
('warm up', '2023-06-04 16:00:00', '2023-06-04 17:30:00', 42, 41), -- Gorillaz at Rock am Ring Centerfeld Day 3
('headline', '2023-06-04 19:30:00', '2023-06-04 21:30:00', 46, 42), -- Kings of Leon at Rock am Ring Mandora Stage Day 3
('warm up', '2023-06-04 17:30:00', '2023-06-04 19:00:00', 48, 42), -- The xx at Rock am Ring Mandora Stage Day 3

-- Woodstock Revival 2023 (event_id 43-50)
('headline', '2023-08-03 20:00:00', '2023-08-03 22:00:00', 1, 43), -- Adele at Woodstock Peace Garden Day 1
('special guest', '2023-08-03 18:00:00', '2023-08-03 19:30:00', 10, 43), -- Bruno Mars at Woodstock Peace Garden Day 1
('warm up', '2023-08-03 16:00:00', '2023-08-03 17:30:00', 19, 43), -- Lorde at Woodstock Peace Garden Day 1
('headline', '2023-08-03 19:30:00', '2023-08-03 21:30:00', 28, 44), -- Maroon 5 at Woodstock Freedom Stage Day 1
('warm up', '2023-08-03 17:30:00', '2023-08-03 19:00:00', 43, 44), -- Florence + The Machine at Woodstock Freedom Stage Day 1
('headline', '2023-08-04 20:00:00', '2023-08-04 22:00:00', 2, 45), -- Ed Sheeran at Woodstock Peace Garden Day 2
('special guest', '2023-08-04 18:00:00', '2023-08-04 19:30:00', 11, 45), -- Ariana Grande at Woodstock Peace Garden Day 2
('warm up', '2023-08-04 16:00:00', '2023-08-04 17:30:00', 20, 45), -- Frank Ocean at Woodstock Peace Garden Day 2
('headline', '2023-08-04 19:30:00', '2023-08-04 21:30:00', 29, 46), -- Twenty One Pilots at Woodstock Freedom Stage Day 2
('warm up', '2023-08-04 17:30:00', '2023-08-04 19:00:00', 44, 46), -- Arcade Fire at Woodstock Freedom Stage Day 2
('headline', '2023-08-05 20:00:00', '2023-08-05 22:00:00', 3, 47), -- Beyoncé at Woodstock Peace Garden Day 3
('special guest', '2023-08-05 18:00:00', '2023-08-05 19:30:00', 12, 47), -- Drake at Woodstock Peace Garden Day 3
('warm up', '2023-08-05 16:00:00', '2023-08-05 17:30:00', 21, 47), -- Daft Punk at Woodstock Peace Garden Day 3
('headline', '2023-08-05 19:30:00', '2023-08-05 21:30:00', 30, 48), -- The 1975 at Woodstock Freedom Stage Day 3
('warm up', '2023-08-05 17:30:00', '2023-08-05 19:00:00', 45, 48), -- The Black Keys at Woodstock Freedom Stage Day 3
('headline', '2023-08-06 20:00:00', '2023-08-06 22:00:00', 4, 49), -- The Weeknd at Woodstock Peace Garden Day 4
('special guest', '2023-08-06 18:00:00', '2023-08-06 19:30:00', 13, 49), -- Lady Gaga at Woodstock Peace Garden Day 4
('warm up', '2023-08-06 16:00:00', '2023-08-06 17:30:00', 22, 49), -- David Guetta at Woodstock Peace Garden Day 4
('headline', '2023-08-06 19:30:00', '2023-08-06 21:30:00', 3, 50), -- Beyoncé at Woodstock Freedom Stage Day 4
('warm up', '2023-08-06 17:30:00', '2023-08-06 19:00:00', 46, 50), -- Kings of Leon at Woodstock Freedom Stage Day 4

-- Boom Festival 2024 (event_id 51-58)
('headline', '2024-07-18 21:00:00', '2024-07-18 23:00:00', 21, 51), -- Daft Punk at Boom Dance Temple Day 1
('special guest', '2024-07-18 19:00:00', '2024-07-18 20:30:00', 22, 51), -- David Guetta at Boom Dance Temple Day 1
('warm up', '2024-07-18 17:00:00', '2024-07-18 18:30:00', 23, 51), -- Skrillex at Boom Dance Temple Day 1
('headline', '2024-07-18 20:30:00', '2024-07-18 22:30:00', 42, 52), -- Gorillaz at Boom Sacred Fire Day 1
('warm up', '2024-07-18 18:30:00', '2024-07-18 20:00:00', 47, 52), -- Vampire Weekend at Boom Sacred Fire Day 1
('headline', '2024-07-19 21:00:00', '2024-07-19 23:00:00', 24, 53), -- Deadmau5 at Boom Dance Temple Day 2
('special guest', '2024-07-19 19:00:00', '2024-07-19 20:30:00', 25, 53), -- Calvin Harris at Boom Dance Temple Day 2
('warm up', '2024-07-19 17:00:00', '2024-07-19 18:30:00', 5, 53), -- Dua Lipa at Boom Dance Temple Day 2
('headline', '2024-07-19 20:30:00', '2024-07-19 22:30:00', 1, 54), -- Adele at The Machine at Boom Sacred Fire Day 2
('warm up', '2024-07-19 18:30:00', '2024-07-19 20:00:00', 19, 54), -- Lorde at Boom Sacred Fire Day 2
('headline', '2024-07-20 21:00:00', '2024-07-20 23:00:00', 21, 55), -- Daft Punk at Boom Dance Temple Day 3
('special guest', '2024-07-20 19:00:00', '2024-07-20 20:30:00', 22, 55), -- David Guetta at Boom Dance Temple Day 3
('warm up', '2024-07-20 17:00:00', '2024-07-20 18:30:00', 23, 55), -- Skrillex at Boom Dance Temple Day 3
('headline', '2024-07-20 20:30:00', '2024-07-20 22:30:00', 33, 56), -- Red Hot Chili Peppers at Boom Sacred Fire Day 3
('warm up', '2024-07-20 18:30:00', '2024-07-20 20:00:00', 49, 56), -- MGMT at Boom Sacred Fire Day 3
('headline', '2024-07-21 21:00:00', '2024-07-21 23:00:00', 24, 57), -- Deadmau5 at Boom Dance Temple Day 4
('special guest', '2024-07-21 19:00:00', '2024-07-21 20:30:00', 25, 57), -- Calvin Harris at Boom Dance Temple Day 4
('warm up', '2024-07-21 17:00:00', '2024-07-21 18:30:00', 5, 57), -- Dua Lipa at Boom Dance Temple Day 4
('headline', '2024-07-21 20:30:00', '2024-07-21 22:30:00', 15, 58), --  Rihanna at Boom Sacred Fire Day 4
('warm up', '2024-07-21 18:30:00', '2024-07-21 20:00:00', 50, 58), -- Paramore at Boom Sacred Fire Day 4

-- Ultra Music Festival 2025 (event_id 59-64)
('headline', '2025-05-28 21:00:00', '2025-05-28 23:00:00', 22, 59), -- David Guetta at Ultra Main Stage Day 1
('special guest', '2025-05-28 19:00:00', '2025-05-28 20:30:00', 23, 59), -- Skrillex at Ultra Main Stage Day 1
('warm up', '2025-05-28 17:00:00', '2025-05-28 18:30:00', 24, 59), -- Deadmau5 at Ultra Main Stage Day 1
('headline', '2025-05-28 20:30:00', '2025-05-28 22:30:00', 25, 60), -- Calvin Harris at Ultra Resistance Stage Day 1
('warm up', '2025-05-28 18:30:00', '2025-05-28 20:00:00', 21, 60), -- Daft Punk at Ultra Resistance Stage Day 1
('headline', '2025-05-29 21:00:00', '2025-05-29 23:00:00', 23, 61), -- Skrillex at Ultra Main Stage Day 2
('special guest', '2025-05-29 19:00:00', '2025-05-29 20:30:00', 24, 61), -- Deadmau5 at Ultra Main Stage Day 2
('warm up', '2025-05-29 17:00:00', '2025-05-29 18:30:00', 25, 61), -- Calvin Harris at Ultra Main Stage Day 2
('headline', '2025-05-29 20:30:00', '2025-05-29 22:30:00', 21, 62), -- Daft Punk at Ultra Resistance Stage Day 2
('warm up', '2025-05-29 18:30:00', '2025-05-29 20:00:00', 22, 62), -- David Guetta at Ultra Resistance Stage Day 2
('headline', '2025-05-30 21:00:00', '2025-05-30 23:00:00', 24, 63), -- Deadmau5 at Ultra Main Stage Day 3
('special guest', '2025-05-30 19:00:00', '2025-05-30 20:30:00', 25, 63), -- Calvin Harris at Ultra Main Stage Day 3
('warm up', '2025-05-30 17:00:00', '2025-05-30 18:30:00', 21, 63), -- Daft Punk at Ultra Main Stage Day 3
('headline', '2025-05-30 20:30:00', '2025-05-30 22:30:00', 22, 64), -- David Guetta at Ultra Resistance Stage Day 3
('warm up', '2025-05-30 18:30:00', '2025-05-30 20:00:00', 23, 64), -- Skrillex at Ultra Resistance Stage Day 3

-- Creamfields 2025 (event_id 65-70)
('headline', '2025-08-22 21:00:00', '2025-08-22 23:00:00', 25, 65), -- Calvin Harris at Creamfields Steel Yard Day 1
('special guest', '2025-08-22 19:00:00', '2025-08-22 20:30:00', 21, 65), -- Daft Punk at Creamfields Steel Yard Day 1
('warm up', '2025-08-22 17:00:00', '2025-08-22 18:30:00', 22, 65), -- David Guetta at Creamfields Steel Yard Day 1
('headline', '2025-08-22 20:30:00', '2025-08-22 22:30:00', 23, 66), -- Skrillex at Creamfields Arc Stage Day 1
('warm up', '2025-08-22 18:30:00', '2025-08-22 20:00:00', 24, 66), -- Deadmau5 at Creamfields Arc Stage Day 1
('headline', '2025-08-23 21:00:00', '2025-08-23 23:00:00', 21, 67), -- Daft Punk at Creamfields Steel Yard Day 2
('special guest', '2025-08-23 19:00:00', '2025-08-23 20:30:00', 22, 67), -- David Guetta at Creamfields Steel Yard Day 2
('warm up', '2025-08-23 17:00:00', '2025-08-23 18:30:00', 23, 67), -- Skrillex at Creamfields Steel Yard Day 2
('headline', '2025-08-23 20:30:00', '2025-08-23 22:30:00', 24, 68), -- Deadmau5 at Creamfields Arc Stage Day 2
('warm up', '2025-08-23 18:30:00', '2025-08-23 20:00:00', 25, 68), -- Calvin Harris at Creamfields Arc Stage Day 2
('headline', '2025-08-24 21:00:00', '2025-08-24 23:00:00', 22, 69), -- David Guetta at Creamfields Steel Yard Day 3
('special guest', '2025-08-24 19:00:00', '2025-08-24 20:30:00', 23, 69), -- Skrillex at Creamfields Steel Yard Day 3
('warm up', '2025-08-24 17:00:00', '2025-08-24 18:30:00', 24, 69), -- Deadmau5 at Creamfields Steel Yard Day 3
('headline', '2025-08-24 20:30:00', '2025-08-24 22:30:00', 25, 70), -- Calvin Harris at Creamfields Arc Stage Day 3
('warm up', '2025-08-24 18:30:00', '2025-08-24 20:00:00', 21, 70); -- Daft Punk at Creamfields Arc Stage Day 3

-- Populating EVENT_STAFF table for all 70 events
-- For each event, we need technical staff, security staff (5% of venue capacity), and auxiliary staff (2% of venue capacity)

-- Event 1: Coachella Day 1 Main Stage (venue_id = 1, capacity = 400)
-- Security needed: 20 staff (5% of 400), Auxiliary needed: 8 staff (2% of 400)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), -- Technical staff
(1, 31), (1, 32), (1, 33), (1, 34), (1, 35), (1, 36), (1, 37), (1, 38), (1, 39), (1, 40), 
(1, 41), (1, 42), (1, 43), (1, 44), (1, 45), (1, 46), (1, 47), (1, 48), (1, 49), (1, 50), -- Security staff
(1, 86), (1, 87), (1, 88), (1, 89), (1, 90), (1, 91), (1, 92), (1, 93); -- Auxiliary staff

-- Event 2: Coachella Day 1 Sahara (venue_id = 2, capacity = 500)
-- Security needed: 25 staff (5% of 500), Auxiliary needed: 10 staff (2% of 500)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(2, 6), (2, 7), (2, 8), (2, 9), (2, 10), -- Technical staff
(2, 51), (2, 52), (2, 53), (2, 54), (2, 55), (2, 56), (2, 57), (2, 58), (2, 59), (2, 60),
(2, 61), (2, 62), (2, 63), (2, 64), (2, 65), (2, 66), (2, 67), (2, 68), (2, 69), (2, 70),
(2, 71), (2, 72), (2, 73), (2, 74), (2, 75), -- Security staff
(2, 94), (2, 95), (2, 96), (2, 97), (2, 98), (2, 99), (2, 100), (2, 101), (2, 102), (2, 103); -- Auxiliary staff

-- Event 3: Coachella Day 2 Main Stage (venue_id = 1, capacity = 400)
-- Security needed: 20 staff (5% of 400), Auxiliary needed: 8 staff (2% of 400)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(3, 1), (3, 2), (3, 3), (3, 4), (3, 5), -- Technical staff
(3, 31), (3, 32), (3, 33), (3, 34), (3, 35), (3, 36), (3, 37), (3, 38), (3, 39), (3, 40),
(3, 41), (3, 42), (3, 43), (3, 44), (3, 45), (3, 46), (3, 47), (3, 48), (3, 49), (3, 50), -- Security staff
(3, 86), (3, 87), (3, 88), (3, 89), (3, 90), (3, 91), (3, 92), (3, 93); -- Auxiliary staff

-- Event 4: Coachella Day 2 Mojave (venue_id = 3, capacity = 350)
-- Security needed: 18 staff (5% of 350), Auxiliary needed: 7 staff (2% of 350)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(4, 6), (4, 7), (4, 8), (4, 9), (4, 10), -- Technical staff
(4, 51), (4, 52), (4, 53), (4, 54), (4, 55), (4, 56), (4, 57), (4, 58), (4, 59), (4, 60),
(4, 61), (4, 62), (4, 63), (4, 64), (4, 65), (4, 66), (4, 67), (4, 68), -- Security staff
(4, 94), (4, 95), (4, 96), (4, 97), (4, 98), (4, 99), (4, 100); -- Auxiliary staff

-- Event 5: Coachella Day 3 Main Stage (venue_id = 1, capacity = 400)
-- Security needed: 20 staff (5% of 400), Auxiliary needed: 8 staff (2% of 400)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(5, 1), (5, 2), (5, 3), (5, 4), (5, 5), -- Technical staff
(5, 31), (5, 32), (5, 33), (5, 34), (5, 35), (5, 36), (5, 37), (5, 38), (5, 39), (5, 40),
(5, 41), (5, 42), (5, 43), (5, 44), (5, 45), (5, 46), (5, 47), (5, 48), (5, 49), (5, 50), -- Security staff
(5, 86), (5, 87), (5, 88), (5, 89), (5, 90), (5, 91), (5, 92), (5, 93);  -- Auxiliary staff

-- Event 6: Coachella Day 3 Outdoor Theatre (venue_id = 5, capacity = 380)
-- Security needed: 19 staff (5% of 380), Auxiliary needed: 8 staff (2% of 380)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(6, 6), (6, 7), (6, 8), (6, 9), (6, 10), -- Technical staff
(6, 51), (6, 52), (6, 53), (6, 54), (6, 55), (6, 56), (6, 57), (6, 58), (6, 59), (6, 60),
(6, 61), (6, 62), (6, 63), (6, 64), (6, 65), (6, 66), (6, 67), (6, 68), (6, 69), -- Security staff
(6, 94), (6, 95), (6, 96), (6, 97), (6, 98), (6, 99), (6, 100), (6, 101);-- Auxiliary staff

-- Event 7: Glastonbury Pyramid Stage Day 1 (venue_id = 6, capacity = 550)
-- Security needed: 28 staff (5% of 550), Auxiliary needed: 11 staff (2% of 550)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(7, 11), (7, 12), (7, 13), (7, 14), (7, 15), (7, 16), (7, 17), -- Technical staff
(7, 31), (7, 32), (7, 33), (7, 34), (7, 35), (7, 36), (7, 37), (7, 38), (7, 39), (7, 40),
(7, 41), (7, 42), (7, 43), (7, 44), (7, 45), (7, 46), (7, 47), (7, 48), (7, 49), (7, 50),
(7, 51), (7, 52), (7, 53), (7, 54), (7, 55), (7, 56), (7, 57), (7, 58), -- Security staff
(7, 86), (7, 87), (7, 88), (7, 89), (7, 90), (7, 91), (7, 92), (7, 93), (7, 94), (7, 95), (7, 96); -- Auxiliary staff

-- Event 8: Glastonbury Other Stage Day 1 (venue_id = 7, capacity = 440)
-- Security needed: 22 staff (5% of 440), Auxiliary needed: 9 staff (2% of 440)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(8, 18), (8, 19), (8, 20), (8, 21), (8, 22), -- Technical staff
(8, 59), (8, 60), (8, 61), (8, 62), (8, 63), (8, 64), (8, 65), (8, 66), (8, 67), (8, 68),
(8, 69), (8, 70), (8, 71), (8, 72), (8, 73), (8, 74), (8, 75), (8, 76), (8, 77), (8, 78),
(8, 79), (8, 80), -- Security staff
(8, 97), (8, 98), (8, 99), (8, 100), (8, 101), (8, 102), (8, 103), (8, 104), (8, 105); -- Auxiliary staff

-- Event 9: Glastonbury Pyramid Stage Day 2 (venue_id = 6, capacity = 550)
-- Security needed: 28 staff (5% of 550), Auxiliary needed: 11 staff (2% of 550)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(9, 11), (9, 12), (9, 13), (9, 14), (9, 15), (9, 16), (9, 17), -- Technical staff
(9, 31), (9, 32), (9, 33), (9, 34), (9, 35), (9, 36), (9, 37), (9, 38), (9, 39), (9, 40),
(9, 41), (9, 42), (9, 43), (9, 44), (9, 45), (9, 46), (9, 47), (9, 48), (9, 49), (9, 50),
(9, 51), (9, 52), (9, 53), (9, 54), (9, 55), (9, 56), (9, 57), (9, 58), -- Security staff
(9, 86), (9, 87), (9, 88), (9, 89), (9, 90), (9, 91), (9, 92), (9, 93), (9, 94), (9, 95), (9, 96); -- Auxiliary staff

-- Event 10: Glastonbury West Holts Day 2 (venue_id = 8, capacity = 350)
-- Security needed: 18 staff (5% of 350), Auxiliary needed: 7 staff (2% of 350)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(10, 18), (10, 19), (10, 20), (10, 21), (10, 22), -- Technical staff
(10, 59), (10, 60), (10, 61), (10, 62), (10, 63), (10, 64), (10, 65), (10, 66), (10, 67), (10, 68),
(10, 69), (10, 70), (10, 71), (10, 72), (10, 73), (10, 74), (10, 75), (10, 76), -- Security staff
(10, 97), (10, 98), (10, 99), (10, 100), (10, 101), (10, 102), (10, 103); -- Auxiliary staff

-- Event 11: Glastonbury Pyramid Stage Day 3 (venue_id = 6, capacity = 550)
-- Security needed: 28 staff (5% of 550), Auxiliary needed: 11 staff (2% of 550)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(11, 11), (11, 12), (11, 13), (11, 14), (11, 15), (11, 16), (11, 17), -- Technical staff
(11, 31), (11, 32), (11, 33), (11, 34), (11, 35), (11, 36), (11, 37), (11, 38), (11, 39), (11, 40),
(11, 41), (11, 42), (11, 43), (11, 44), (11, 45), (11, 46), (11, 47), (11, 48), (11, 49), (11, 50),
(11, 51), (11, 52), (11, 53), (11, 54), (11, 55), (11, 56), (11, 57), (11, 58), -- Security staff
(11, 86), (11, 87), (11, 88), (11, 89), (11, 90), (11, 91), (11, 92), (11, 93), (11, 94), (11, 95), (11, 96); -- Auxiliary staff

-- Event 12: Glastonbury Park Stage Day 3 (venue_id = 9, capacity = 300)
-- Security needed: 15 staff (5% of 300), Auxiliary needed: 6 staff (2% of 300)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(12, 18), (12, 19), (12, 20), (12, 21), (12, 22), -- Technical staff
(12, 59), (12, 60), (12, 61), (12, 62), (12, 63), (12, 64), (12, 65), (12, 66), (12, 67), (12, 68),
(12, 69), (12, 70), (12, 71), (12, 72), (12, 73), -- Security staff
(12, 97), (12, 98), (12, 99), (12, 100), (12, 101), (12, 102); -- Auxiliary staff

-- Event 13: Glastonbury Pyramid Stage Day 4 (venue_id = 6, capacity = 550)
-- Security needed: 28 staff (5% of 550), Auxiliary needed: 11 staff (2% of 550)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(13, 11), (13, 12), (13, 13), (13, 14), (13, 15), (13, 16), (13, 17), -- Technical staff
(13, 31), (13, 32), (13, 33), (13, 34), (13, 35), (13, 36), (13, 37), (13, 38), (13, 39), (13, 40),
(13, 41), (13, 42), (13, 43), (13, 44), (13, 45), (13, 46), (13, 47), (13, 48), (13, 49), (13, 50),
(13, 51), (13, 52), (13, 53), (13, 54), (13, 55), (13, 56), (13, 57), (13, 58), -- Security staff
(13, 86), (13, 87), (13, 88), (13, 89), (13, 90), (13, 91), (13, 92), (13, 93), (13, 94), (13, 95), (13, 96);-- Auxiliary staff

-- Event 14: Glastonbury Acoustic Stage Day 4 (venue_id = 10, capacity = 280)
-- Security needed: 14 staff (5% of 280), Auxiliary needed: 6 staff (2% of 280)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(14, 18), (14, 19), (14, 20), (14, 21), (14, 22), -- Technical staff
(14, 59), (14, 60), (14, 61), (14, 62), (14, 63), (14, 64), (14, 65), (14, 66), (14, 67), (14, 68),
(14, 69), (14, 70), (14, 71), (14, 72), -- Security staff
(14, 97), (14, 98), (14, 99), (14, 100), (14, 101); -- Auxiliary staff

-- Event 15: Glastonbury Pyramid Stage Day 5 (venue_id = 6, capacity = 550)
-- Security needed: 28 staff (5% of 550), Auxiliary needed: 11 staff (2% of 550)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(15, 11), (15, 12), (15, 13), (15, 14), (15, 15), (15, 16), (15, 17), -- Technical staff
(15, 31), (15, 32), (15, 33), (15, 34), (15, 35), (15, 36), (15, 37), (15, 38), (15, 39), (15, 40),
(15, 41), (15, 42), (15, 43), (15, 44), (15, 45), (15, 46), (15, 47), (15, 48), (15, 49), (15, 50),
(15, 51), (15, 52), (15, 53), (15, 54), (15, 55), (15, 56), (15, 57), (15, 58), -- Security staff
(15, 86), (15, 87), (15, 88), (15, 89), (15, 90), (15, 91), (15, 92), (15, 93), (15, 94), (15, 95), (15, 96); -- Auxiliary staff

-- Event 16: Glastonbury Other Stage Day 5 (venue_id = 7, capacity = 440)
-- Security needed: 22 staff (5% of 440), Auxiliary needed: 9 staff (2% of 440)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(16, 18), (16, 19), (16, 20), (16, 21), (16, 22), -- Technical staff
(16, 59), (16, 60), (16, 61), (16, 62), (16, 63), (16, 64), (16, 65), (16, 66), (16, 67), (16, 68),
(16, 69), (16, 70), (16, 71), (16, 72), (16, 73), (16, 74), (16, 75), (16, 76), (16, 77), (16, 78),
(16, 79), (16, 80), -- Security staff
(16, 97), (16, 98), (16, 99), (16, 100), (16, 101),(16, 102), (16, 103);  -- Auxiliary staff

-- Event 17: Lollapalooza T-Mobile Day 1 (venue_id = 11, capacity = 430)
-- Security needed: 22 staff (5% of 430), Auxiliary needed: 9 staff (2% of 430)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(17, 23), (17, 24), (17, 25), (17, 26), -- Technical staff
(17, 31), (17, 32), (17, 33), (17, 34), (17, 35), (17, 36), (17, 37), (17, 38), (17, 39), (17, 40),
(17, 41), (17, 42), (17, 43), (17, 44), (17, 45), (17, 46), (17, 47), (17, 48), (17, 49), (17, 50),
(17, 51), (17, 52), -- Security staff
(17, 86), (17, 87), (17, 88), (17, 89), (17, 90), (17, 91), (17, 92), (17, 93), (17, 94); -- Auxiliary staff

-- Event 18: Lollapalooza Bud Light Day 1 (venue_id = 12, capacity = 400)
-- Security needed: 20 staff (5% of 400), Auxiliary needed: 8 staff (2% of 400)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(18, 27), (18, 28), (18, 29), (18, 30), -- Technical staff
(18, 53), (18, 54), (18, 55), (18, 56), (18, 57), (18, 58), (18, 59), (18, 60), (18, 61), (18, 62),
(18, 63), (18, 64), (18, 65), (18, 66), (18, 67), (18, 68), (18, 69), (18, 70), (18, 71), (18, 72),-- Security staff
(18, 95), (18, 96), (18, 97), (18, 98), (18, 99), (18, 100), (18, 101), (18, 102); -- Auxiliary staff

-- Event 19: Lollapalooza T-Mobile Day 2 (venue_id = 11, capacity = 430)
-- Security needed: 22 staff (5% of 430), Auxiliary needed: 9 staff (2% of 430)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(19, 23), (19, 24), (19, 25), (19, 26), -- Technical staff
(19, 31), (19, 32), (19, 33), (19, 34), (19, 35), (19, 36), (19, 37), (19, 38), (19, 39), (19, 40),
(19, 41), (19, 42), (19, 43), (19, 44), (19, 45), (19, 46), (19, 47), (19, 48), (19, 49), (19, 50),
(19, 51), (19, 52), -- Security staff
(19, 86), (19, 87), (19, 88), (19, 89), (19, 90), (19, 91), (19, 92), (19, 93), (19, 94); -- Auxiliary staff

-- Event 20: Lollapalooza Perrys Day 2 (venue_id = 13, capacity = 390)
-- Security needed: 20 staff (5% of 390), Auxiliary needed: 8 staff (2% of 390)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(20, 27), (20, 28), (20, 29), (20, 30),  -- Technical staff
(20, 53), (20, 54), (20, 55), (20, 56), (20, 57), (20, 58), (20, 59), (20, 60), (20, 61), (20, 62),
(20, 63), (20, 64), (20, 65), (20, 66), (20, 67), (20, 68), (20, 69), (20, 70), (20, 71), (20, 72), -- Security staff
(20, 95), (20, 96), (20, 97), (20, 98), (20, 99), (20, 100), (20, 101), (20, 102); -- Auxiliary staff

-- Event 21: Lollapalooza T-Mobile Day 3 (venue_id = 11, capacity = 430)
-- Security needed: 22 staff (5% of 430), Auxiliary needed: 9 staff (2% of 430)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(21, 23), (21, 24), (21, 25), (21, 26),  -- Technical staff
(21, 31), (21, 32), (21, 33), (21, 34), (21, 35), (21, 36), (21, 37), (21, 38), (21, 39), (21, 40),
(21, 41), (21, 42), (21, 43), (21, 44), (21, 45), (21, 46), (21, 47), (21, 48), (21, 49), (21, 50),
(21, 51), (21, 52), -- Security staff
(21, 86), (21, 87), (21, 88), (21, 89), (21, 90), (21, 91), (21, 92), (21, 93), (21, 94);  -- Auxiliary staff

-- Event 22: Lollapalooza BMI Stage Day 3 (venue_id = 14, capacity = 250)
-- Security needed: 13 staff (5% of 250), Auxiliary needed: 5 staff (2% of 250)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(22, 27), (22, 28), (22, 29), (22, 30),  -- Technical staff
(22, 53), (22, 54), (22, 55), (22, 56), (22, 57), (22, 58), (22, 59), (22, 60), (22, 61), (22, 62),
(22, 63), (22, 64), (22, 65), -- Security staff
(22, 95), (22, 96), (22, 97), (22, 98), (22, 99); -- Auxiliary staff

-- Event 23: Lollapalooza T-Mobile Day 4 (venue_id = 11, capacity = 430)
-- Security needed: 22 staff (5% of 430), Auxiliary needed: 9 staff (2% of 430)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(23, 23), (23, 24), (23, 25), (23, 26),  -- Technical staff
(23, 31), (23, 32), (23, 33), (23, 34), (23, 35), (23, 36), (23, 37), (23, 38), (23, 39), (23, 40),
(23, 41), (23, 42), (23, 43), (23, 44), (23, 45), (23, 46), (23, 47), (23, 48), (23, 49), (23, 50),
(23, 51), (23, 52), -- Security staff
(23, 86), (23, 87), (23, 88), (23, 89), (23, 90), (23, 91), (23, 92), (23, 93), (23, 94); -- Auxiliary staff

-- Event 24: Lollapalooza Bud Light Day 4 (venue_id = 12, capacity = 400)
-- Security needed: 20 staff (5% of 400), Auxiliary needed: 8 staff (2% of 400)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(24, 27), (24, 28), (24, 29), (24, 30),  -- Technical staff
(24, 53), (24, 54), (24, 55), (24, 56), (24, 57), (24, 58), (24, 59), (24, 60), (24, 61), (24, 62),
(24, 63), (24, 64), (24, 65), (24, 66), (24, 67), (24, 68), (24, 69), (24, 70), (24, 71), (24, 72),-- Security staff
(24, 95), (24, 96), (24, 97), (24, 98), (24, 99), (24, 100), (24, 101), (24, 102); -- Auxiliary staff

-- Event 25: Fuji Rock Green Stage Day 1 (venue_id = 15, capacity = 350)
-- Security needed: 18 staff (5% of 350), Auxiliary needed: 7 staff (2% of 350)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(25, 1), (25, 3), (25, 5), (25, 7), (25, 9), -- Technical staff
(25, 31), (25, 32), (25, 33), (25, 34), (25, 35), (25, 36), (25, 37), (25, 38), (25, 39), (25, 40),
(25, 41), (25, 42), (25, 43), (25, 44), (25, 45), (25, 46), (25, 47), (25, 48), -- Security staff
(25, 86), (25, 87), (25, 88), (25, 89), (25, 90), (25, 91), (25, 92); -- Auxiliary staff

-- Event 26: Fuji Rock White Stage Day 1 (venue_id = 16, capacity = 330)
-- Security needed: 17 staff (5% of 330), Auxiliary needed: 7 staff (2% of 330)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(26, 11), (26, 13), (26, 15), (26, 17), (26, 19), -- Technical staff
(26, 49), (26, 50), (26, 51), (26, 52), (26, 53), (26, 54), (26, 55), (26, 56), (26, 57), (26, 58),
(26, 59), (26, 60), (26, 61), (26, 62), (26, 63), (26, 64), (26, 65), -- Security staff
(26, 93), (26, 94), (26, 95), (26, 96), (26, 97), (26, 98), (26, 99); -- Auxiliary staff

-- Event 27: Fuji Rock Green Stage Day 2 (venue_id = 15, capacity = 350)
-- Security needed: 18 staff (5% of 350), Auxiliary needed: 7 staff (2% of 350)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(27, 1), (27, 3), (27, 5), (27, 7), (27, 9), -- Technical staff
(27, 31), (27, 32), (27, 33), (27, 34), (27, 35), (27, 36), (27, 37), (27, 38), (27, 39), (27, 40),
(27, 41), (27, 42), (27, 43), (27, 44), (27, 45), (27, 46), (27, 47), (27, 48), -- Security staff
(27, 86), (27, 87), (27, 88), (27, 89), (27, 90), (27, 91), (27, 92); -- Auxiliary staff

-- Event 28: Fuji Rock Field of Heaven Day 2 (venue_id = 17, capacity = 290)
-- Security needed: 15 staff (5% of 290), Auxiliary needed: 6 staff (2% of 290)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(28, 11), (28, 13), (28, 15), (28, 17), (28, 19), -- Technical staff
(28, 49), (28, 50), (28, 51), (28, 52), (28, 53), (28, 54), (28, 55), (28, 56), (28, 57), (28, 58),
(28, 59), (28, 60), (28, 61), (28, 62), (28, 63), -- Security staff
(28, 93), (28, 94), (28, 95), (28, 96), (28, 97), (28, 98); -- Auxiliary staff

-- Event 29: Fuji Rock Green Stage Day 3 (venue_id = 15, capacity = 350)
-- Security needed: 18 staff (5% of 350), Auxiliary needed: 7 staff (2% of 350)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(29, 1), (29, 3), (29, 5), (29, 7), (29, 9), -- Technical staff
(29, 31), (29, 32), (29, 33), (29, 34), (29, 35), (29, 36), (29, 37), (29, 38), (29, 39), (29, 40),
(29, 41), (29, 42), (29, 43), (29, 44), (29, 45), (29, 46), (29, 47), (29, 48), -- Security staff
(29, 86), (29, 87), (29, 88), (29, 89), (29, 90), (29, 91), (29, 92); -- Auxiliary staff

-- Event 30: Fuji Rock White Stage Day 3 (venue_id = 16, capacity = 330)
-- Security needed: 17 staff (5% of 330), Auxiliary needed: 7 staff (2% of 330)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(30, 11), (30, 13), (30, 15), (30, 17), (30, 19), -- Technical staff
(30, 49), (30, 50), (30, 51), (30, 52), (30, 53), (30, 54), (30, 55), (30, 56), (30, 57), (30, 58),
(30, 59), (30, 60), (30, 61), (30, 62), (30, 63), (30, 64), (30, 65), -- Security staff
(30, 93), (30, 94), (30, 95), (30, 96), (30, 97), (30, 98), (30, 99); -- Auxiliary staff

-- Event 31: Primavera Main Stage Day 1 (venue_id = 18, capacity = 400)
-- Security needed: 20 staff (5% of 400), Auxiliary needed: 8 staff (2% of 400)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(31, 2), (31, 4), (31, 6), (31, 8), (31, 10), -- Technical staff
(31, 31), (31, 32), (31, 33), (31, 34), (31, 35), (31, 36), (31, 37), (31, 38), (31, 39), (31, 40),
(31, 41), (31, 42), (31, 43), (31, 44), (31, 45), (31, 46), (31, 47), (31, 48), (31, 49), (31, 50), -- Security staff
(31, 86), (31, 87), (31, 88), (31, 89), (31, 90), (31, 91), (31, 92),(31, 93);  -- Auxiliary staff

-- Event 32: Primavera Ray-Ban Stage Day 1 (venue_id = 19, capacity = 370)
-- Security needed: 19 staff (5% of 370), Auxiliary needed: 8 staff (2% of 370, rounded up)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(32, 12), (32, 14), (32, 16), (32, 18), (32, 20), -- Technical staff
(32, 51), (32, 52), (32, 53), (32, 54), (32, 55), (32, 56), (32, 57), (32, 58), (32, 59), (32, 60),
(32, 61), (32, 62), (32, 63), (32, 64), (32, 65), (32, 66), (32, 67), (32, 68), (32, 69), -- Security staff
(32, 94), (32, 95), (32, 96), (32, 97), (32, 98), (32, 99), (32, 100), (32, 101); -- Auxiliary staff

-- Event 33: Primavera Main Stage Day 2 (venue_id = 18, capacity = 400)
-- Security needed: 20 staff (5% of 400), Auxiliary needed: 8 staff (2% of 400)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(33, 2), (33, 4), (33, 6), (33, 8), (33, 10), -- Technical staff
(33, 31), (33, 32), (33, 33), (33, 34), (33, 35), (33, 36), (33, 37), (33, 38), (33, 39), (33, 40),
(33, 41), (33, 42), (33, 43), (33, 44), (33, 45), (33, 46), (33, 47), (33, 48), (33, 49), (33, 50), -- Security staff
(33, 86), (33, 87), (33, 88), (33, 89), (33, 90), (33, 91), (33, 92),(33, 93); -- Auxiliary staff

-- Event 34: Primavera Pitchfork Stage Day 2 (venue_id = 20, capacity = 320)
-- Security needed: 16 staff (5% of 320), Auxiliary needed: 7 staff (2% of 320, rounded up)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(34, 12), (34, 14), (34, 16), (34, 18), (34, 20), -- Technical staff
(34, 51), (34, 52), (34, 53), (34, 54), (34, 55), (34, 56), (34, 57), (34, 58), (34, 59), (34, 60),
(34, 61), (34, 62), (34, 63), (34, 64), (34, 65), (34, 66), -- Security staff
(34, 94), (34, 95), (34, 96), (34, 97), (34, 98), (34, 99), (34, 100); -- Auxiliary staff

-- Event 35: Primavera Main Stage Day 3 (venue_id = 18, capacity = 400)
-- Security needed: 20 staff (5% of 400), Auxiliary needed: 8 staff (2% of 400)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(35, 2), (35, 4), (35, 6), (35, 8), (35, 10), -- Technical staff
(35, 31), (35, 32), (35, 33), (35, 34), (35, 35), (35, 36), (35, 37), (35, 38), (35, 39), (35, 40),
(35, 41), (35, 42), (35, 43), (35, 44), (35, 45), (35, 46), (35, 47), (35, 48), (35, 49), (35, 50), -- Security staff
(35, 86), (35, 87), (35, 88), (35, 89), (35, 90), (35, 91), (35, 92), (35, 93); -- Auxiliary staff

-- Event 36: Primavera Ray-Ban Stage Day 3 (venue_id = 19, capacity = 370)
-- Security needed: 19 staff (5% of 370), Auxiliary needed: 8 staff (2% of 370, rounded up)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(36, 12), (36, 14), (36, 16), (36, 18), (36, 20), -- Technical staff
(36, 51), (36, 52), (36, 53), (36, 54), (36, 55), (36, 56), (36, 57), (36, 58), (36, 59), (36, 60),
(36, 61), (36, 62), (36, 63), (36, 64), (36, 65), (36, 66), (36, 67), (36, 68), (36, 69), -- Security staff
(36, 94), (36, 95), (36, 96), (36, 97), (36, 98), (36, 99), (36, 100), (36, 101);-- Auxiliary staff

-- Event 37: Rock am Ring Centerfeld Day 1 (venue_id = 21, capacity = 480)
-- Security needed: 24 staff (5% of 480), Auxiliary needed: 10 staff (2% of 480)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(37, 6), (37, 7), (37, 8), (37, 9), (37, 10), -- Technical staff
(37, 31), (37, 32), (37, 33), (37, 34), (37, 35), (37, 36), (37, 37), (37, 38), (37, 39), (37, 40),
(37, 41), (37, 42), (37, 43), (37, 44), (37, 45), (37, 46), (37, 47), (37, 48), (37, 49), (37, 50),
(37, 51), (37, 52), (37, 53), (37, 54), -- Security staff
(37, 86), (37, 87), (37, 88), (37, 89), (37, 90), (37, 91), (37, 92), (37, 93), (37, 94), (37, 95); -- Auxiliary staff

-- Event 38: Rock am Ring Mandora Stage Day 1 (venue_id = 22, capacity = 440)
-- Security needed: 22 staff (5% of 440), Auxiliary needed: 9 staff (2% of 440)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(38, 21), (38, 22), (38, 23), (38, 24), (38, 25), -- Technical staff
(38, 55), (38, 56), (38, 57), (38, 58), (38, 59), (38, 60), (38, 61), (38, 62), (38, 63), (38, 64), 
(38, 65), (38, 66), (38, 67), (38, 68), (38, 69), (38, 70), (38, 71), (38, 72), (38, 73), (38, 74), 
(38, 75), (38, 76), -- Security staff
(38, 96), (38, 97), (38, 98), (38, 99), (38, 100), (38, 101), (38, 102), (38, 103), (38, 104); -- Auxiliary staff

-- Event 39: Rock am Ring Centerfeld Day 2 (venue_id = 21, capacity = 480)
-- Security needed: 24 staff (5% of 480), Auxiliary needed: 10 staff (2% of 480)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(39, 6), (39, 7), (39, 8), (39, 9), (39, 10), -- Technical staff
(39, 31), (39, 32), (39, 33), (39, 34), (39, 35), (39, 36), (39, 37), (39, 38), (39, 39), (39, 40),
(39, 41), (39, 42), (39, 43), (39, 44), (39, 45), (39, 46), (39, 47), (39, 48), (39, 49), (39, 50),
(39, 51), (39, 52), (39, 53), (39, 54), -- Security staff
(39, 86), (39, 87), (39, 88), (39, 89), (39, 90), (39, 91), (39, 92), (39, 93), (39, 94), (39, 95); -- Auxiliary staff

-- Event 40: Rock am Ring Mandora Stage Day 2 (venue_id = 22, capacity = 440)
-- Security needed: 22 staff (5% of 440), Auxiliary needed: 9 staff (2% of 440)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(40, 21), (40, 22), (40, 23), (40, 24), (40, 25), -- Technical staff
(40, 59), (40, 60), (40, 61), (40, 62), (40, 63), (40, 64), (40, 65), (40, 66), (40, 67), (40, 68),
(40, 69), (40, 70), (40, 71), (40, 72), (40, 73), (40, 74), (40, 75), (40, 76), (40, 77), (40, 78),
(40, 79), (40, 80), -- Security staff
(40, 96), (40, 97), (40, 98), (40, 99), (40, 100), (40, 101), (40, 102), (40, 103), (40,104); -- Auxiliary staff

-- Event 41: Rock am Ring Centerfeld Day 3 (venue_id = 21, capacity = 480)
-- Security needed: 24 staff (5% of 480), Auxiliary needed: 10 staff (2% of 480)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(41, 6), (41, 7), (41, 8), (41, 9), (41, 10), -- Technical staff
(41, 31), (41, 32), (41, 33), (41, 34), (41, 35), (41, 36), (41, 37), (41, 38), (41, 39), (41, 40),
(41, 41), (41, 42), (41, 43), (41, 44), (41, 45), (41, 46), (41, 47), (41, 48), (41, 49), (41, 50),
(41, 51), (41, 52), (41, 53), (41, 54), -- Security staff
(41, 86), (41, 87), (41, 88), (41, 89), (41, 90), (41, 91), (41, 92), (41, 93), (41, 94), (41, 95); -- Auxiliary staff

-- Event 42: Rock am Ring Mandora Stage Day 3 (venue_id = 22, capacity = 440)
-- Security needed: 22 staff (5% of 440), Auxiliary needed: 9 staff (2% of 440)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(42, 21), (42, 22), (42, 23), (42, 24), (42, 25), -- Technical staff
(42, 59), (42, 60), (42, 61), (42, 62), (42, 63), (42, 64), (42, 65), (42, 66), (42, 67), (42, 68),
(42, 69), (42, 70), (42, 71), (42, 72), (42, 73), (42, 74), (42, 75), (42, 76), (42, 77), (42, 78),
(42, 79), (42, 80), -- Security staff
(42, 96), (42, 97), (42, 98), (42, 99), (42, 100), (42, 101), (42, 102), (42, 103), (42,104); -- Auxiliary staff

-- Event 43: Woodstock Peace Garden Day 1 (venue_id = 23, capacity = 410)
-- Security needed: 21 staff (5% of 410), Auxiliary needed: 9 staff (2% of 410, rounded up)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(43, 1), (43, 2), (43, 3), (43, 4), (43, 5), -- Technical staff
(43, 31), (43, 32), (43, 33), (43, 34), (43, 35), (43, 36), (43, 37), (43, 38), (43, 39), (43, 40),
(43, 41), (43, 42), (43, 43), (43, 44), (43, 45), (43, 46), (43, 47), (43, 48), (43, 49), (43, 50),
(43, 51), -- Security staff
(43, 86), (43, 87), (43, 88), (43, 89), (43, 90), (43, 91), (43, 92), (43, 93), (43, 94); -- Auxiliary staff

-- Event 44: Woodstock Freedom Stage Day 1 (venue_id = 24, capacity = 400)
-- Security needed: 20 staff (5% of 400), Auxiliary needed: 8 staff (2% of 400)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(44, 26), (44, 27), (44, 28), (44, 29), (44, 30), -- Technical staff
(44, 53), (44, 54), (44, 55), (44, 56), (44, 57), (44, 58), (44, 59), (44, 60), (44, 61), (44, 62), 
(44, 63), (44, 64), (44, 65), (44, 66), (44, 67), (44, 68), (44, 69), (44, 70), (44, 71), (44, 72), -- Security staff
(44, 95), (44, 96), (44, 97), (44, 98), (44, 99), (44, 100), (44, 101), (44, 102); -- Auxiliary staff

-- Event 45: Woodstock Peace Garden Day 2 (venue_id = 23, capacity = 410)
-- Security needed: 21 staff (5% of 410), Auxiliary needed: 9 staff (2% of 410, rounded up)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(45, 1), (45, 2), (45, 3), (45, 4), (45, 5), -- Technical staff
(45, 31), (45, 32), (45, 33), (45, 34), (45, 35), (45, 36), (45, 37), (45, 38), (45, 39), (45, 40),
(45, 41), (45, 42), (45, 43), (45, 44), (45, 45), (45, 46), (45, 47), (45, 48), (45, 49), (45, 50),
(45, 51), -- Security staff
(45, 86), (45, 87), (45, 88), (45, 89), (45, 90), (45, 91), (45, 92), (45, 93), (45, 94); -- Auxiliary staff

-- Event 46: Woodstock Freedom Stage Day 2 (venue_id = 24, capacity = 400)
-- Security needed: 20 staff (5% of 400), Auxiliary needed: 8 staff (2% of 400)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(46, 26), (46, 27), (46, 28), (46, 29), (46, 30), -- Technical staff
(46, 52), (46, 53), (46, 54), (46, 55), (46, 56), (46, 57), (46, 58), (46, 59), (46, 60), (46, 61), 
(46, 62), (46, 63), (46, 64), (46, 65), (46, 66), (46, 67), (46, 68), (46, 69), (46, 70), (46, 71), -- Security staff
(46, 95), (46, 96), (46, 97), (46, 98), (46, 99), (46, 100), (46, 101), (46, 102); -- Auxiliary staff

-- Event 47: Woodstock Peace Garden Day 3 (venue_id = 23, capacity = 410)
-- Security needed: 21 staff (5% of 410), Auxiliary needed: 9 staff (2% of 410, rounded up)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(47, 1), (47, 2), (47, 3), (47, 4), (47, 5), -- Technical staff
(47, 31), (47, 32), (47, 33), (47, 34), (47, 35), (47, 36), (47, 37), (47, 38), (47, 39), (47, 40),
(47, 41), (47, 42), (47, 43), (47, 44), (47, 45), (47, 46), (47, 47), (47, 48), (47, 49), (47, 50),
(47, 51), -- Security staff
(47, 86), (47, 87), (47, 88), (47, 89), (47, 90), (47, 91), (47, 92), (47, 93), (47, 94); -- Auxiliary staff

-- Event 48: Woodstock Freedom Stage Day 3 (venue_id = 24, capacity = 400)
-- Security needed: 20 staff (5% of 400), Auxiliary needed: 8 staff (2% of 400)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(48, 26), (48, 27), (48, 28), (48, 29), (48, 30), -- Technical staff
(48, 52), (48, 53), (48, 54), (48, 55), (48, 56), (48, 57), (48, 58), (48, 59), (48, 60), (48, 61), 
(48, 62), (48, 63), (48, 64), (48, 65), (48, 66), (48, 67), (48, 68), (48, 69), (48, 70), (48, 71), -- Security staff
(48, 95), (48, 96), (48, 97), (48, 98), (48, 99), (48, 100), (48, 101), (48, 102); -- Auxiliary staff

-- Event 49: Woodstock Peace Garden Day 4 (venue_id = 23, capacity = 410)
-- Security needed: 21 staff (5% of 410), Auxiliary needed: 9 staff (2% of 410, rounded up)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(49, 1), (49, 2), (49, 3), (49, 4), (49, 5), -- Technical staff
(49, 31), (49, 32), (49, 33), (49, 34), (49, 35), (49, 36), (49, 37), (49, 38), (49, 39), (49, 40),
(49, 41), (49, 42), (49, 43), (49, 44), (49, 45), (49, 46), (49, 47), (49, 48), (49, 49), (49, 50),
(49, 51), -- Security staff
(49, 86), (49, 87), (49, 88), (49, 89), (49, 90), (49, 91), (49, 92), (49, 93), (49, 94); -- Auxiliary staff

-- Event 50: Woodstock Freedom Stage Day 4 (venue_id = 24, capacity = 400)
-- Security needed: 20 staff (5% of 400), Auxiliary needed: 8 staff (2% of 400)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(50, 26), (50, 27), (50, 28), (50, 29), (50, 30), -- Technical staff
(50, 52), (50, 53), (50, 54), (50, 55), (50, 56), (50, 57), (50, 58), (50, 59), (50, 60), (50, 61), 
(50, 62), (50, 63), (50, 64), (50, 65), (50, 66), (50, 67), (50, 68), (50, 69), (50, 70), (50, 71), -- Security staff
(50, 95), (50, 96), (50, 97), (50, 98), (50, 99), (50, 100), (50, 101), (50, 102); -- Auxiliary staff

-- Event 51: Boom Dance Temple Day 1 (venue_id = 25, capacity = 470)
-- Security needed: 24 staff (5% of 470, rounded up), Auxiliary needed: 10 staff (2% of 470, rounded up)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(51, 1), (51, 2), (51, 3), (51, 6), (51, 7), -- Technical staff
(51, 31), (51, 32), (51, 33), (51, 34), (51, 35), (51, 36), (51, 37), (51, 38), (51, 39), (51, 40),
(51, 41), (51, 42), (51, 43), (51, 44), (51, 45), (51, 46), (51, 47), (51, 48), (51, 49), (51, 50),
(51, 51), (51, 52), (51, 53), (51, 54), -- Security staff
(51, 86), (51, 87), (51, 88), (51, 89), (51, 90), (51, 91), (51, 92), (51, 93), (51, 94), (51, 95); -- Auxiliary staff

-- Event 52: Boom Sacred Fire Day 1 (venue_id = 26, capacity = 420)
-- Security needed: 21 staff (5% of 420), Auxiliary needed: 9 staff (2% of 420, rounded up)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(52, 13), (52, 14), (52, 15), (52, 16), (52, 17), -- Technical staff
(52, 55), (52, 56), (52, 57), (52, 58), (52, 59), (52, 60), (52, 61), (52, 62), (52, 63), (52, 64), 
(52, 65), (52, 66), (52, 67), (52, 68), (52, 69), (52, 70), (52, 71), (52, 72), (52, 73), (52, 74), 
(52, 75), -- Security staff
(52, 96), (52, 97), (52, 98), (52, 99), (52, 100), (52, 101), (52, 102), (52, 103), (52, 104); -- Auxiliary staff

-- Event 53: Boom Dance Temple Day 2 (venue_id = 25, capacity = 470)
-- Security needed: 24 staff (5% of 470, rounded up), Auxiliary needed: 10 staff (2% of 470, rounded up)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(53, 1), (53, 2), (53, 3), (53, 6), (53, 7), -- Technical staff
(53, 31), (53, 32), (53, 33), (53, 34), (53, 35), (53, 36), (53, 37), (53, 38), (53, 39), (53, 40),
(53, 41), (53, 42), (53, 43), (53, 44), (53, 45), (53, 46), (53, 47), (53, 48), (53, 49), (53, 50),
(53, 51), (53, 52), (53, 53), (53, 54), -- Security staff
(53, 86), (53, 87), (53, 88), (53, 89), (53, 90), (53, 91), (53, 92), (53, 93), (53, 94), (53, 95); -- Auxiliary staff

-- Event 54: Boom Sacred Fire Day 2 (venue_id = 26, capacity = 420)
-- Security needed: 21 staff (5% of 420), Auxiliary needed: 9 staff (2% of 420, rounded up)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(54, 13), (54, 14), (54, 15), (54, 16), (54, 17), -- Technical staff
(54, 55), (54, 56), (54, 57), (54, 58), (54, 59), (54, 60), (54, 61), (54, 62), (54, 63), (54, 64), 
(54, 65), (54, 66), (54, 67), (54, 68), (54, 69), (54, 70), (54, 71), (54, 72), (54, 73), (54, 74), 
(54, 75), -- Security staff
(54, 96), (54, 97), (54, 98), (54, 99), (54, 100), (54, 101), (54, 102), (54, 103), (54, 104); -- Auxiliary staff

-- Event 55: Boom Dance Temple Day 3 (venue_id = 25, capacity = 470)
-- Security needed: 24 staff (5% of 470, rounded up), Auxiliary needed: 10 staff (2% of 470, rounded up)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(55, 1), (55, 2), (55, 3), (55, 6), (55, 7), -- Technical staff
(55, 31), (55, 32), (55, 33), (55, 34), (55, 35), (55, 36), (55, 37), (55, 38), (55, 39), (55, 40),
(55, 41), (55, 42), (55, 43), (55, 44), (55, 45), (55, 46), (55, 47), (55, 48), (55, 49), (55, 50),
(55, 51), (55, 52), (55, 53), (55, 54), -- Security staff
(55, 86), (55, 87), (55, 88), (55, 89), (55, 90), (55, 91), (55, 92), (55, 93), (55, 94), (55, 95); -- Auxiliary staff

-- Event 56: Boom Sacred Fire Day 3 (venue_id = 26, capacity = 420)
-- Security needed: 21 staff (5% of 420), Auxiliary needed: 9 staff (2% of 420, rounded up)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(56, 13), (56, 14), (56, 15), (56, 16), (56, 17), -- Technical staff
(56, 55), (56, 56), (56, 57), (56, 58), (56, 59), (56, 60), (56, 61), (56, 62), (56, 63), (56, 64), 
(56, 65), (56, 66), (56, 67), (56, 68), (56, 69), (56, 70), (56, 71), (56, 72), (56, 73), (56, 74), 
(56, 75), -- Security staff
(56, 96), (56, 97), (56, 98), (56, 99), (56, 100), (56, 101), (56, 102), (56, 103), (56, 104); -- Auxiliary staff

-- Event 57: Boom Dance Temple Day 4 (venue_id = 25, capacity = 470)
-- Security needed: 24 staff (5% of 470, rounded up), Auxiliary needed: 10 staff (2% of 470, rounded up)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(57, 1), (57, 2), (57, 3), (57, 6), (57, 7), -- Technical staff
(57, 31), (57, 32), (57, 33), (57, 34), (57, 35), (57, 36), (57, 37), (57, 38), (57, 39), (57, 40),
(57, 41), (57, 42), (57, 43), (57, 44), (57, 45), (57, 46), (57, 47), (57, 48), (57, 49), (57, 50),
(57, 51), (57, 52), (57, 53), (57, 54), -- Security staff
(57, 86), (57, 87), (57, 88), (57, 89), (57, 90), (57, 91), (57, 92), (57, 93), (57, 94), (57, 95); -- Auxiliary staff

-- Event 58: Boom Sacred Fire Day 4 (venue_id = 26, capacity = 420)
-- Security needed: 21 staff (5% of 420), Auxiliary needed: 9 staff (2% of 420, rounded up)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(58, 13), (58, 14), (58, 15), (58, 16), (58, 17), -- Technical staff
(58, 55), (58, 56), (58, 57), (58, 58), (58, 59), (58, 60), (58, 61), (58, 62), (58, 63), (58, 64), 
(58, 65), (58, 66), (58, 67), (58, 68), (58, 69), (58, 70), (58, 71), (58, 72), (58, 73), (58, 74), 
(58, 75), -- Security staff
(58, 96), (58, 97), (58, 98), (58, 99), (58, 100), (58, 101), (58, 102), (58, 103), (58, 104); -- Auxiliary staff

-- Event 59: Ultra Main Stage Day 1 (venue_id = 27, capacity = 460)
-- Security needed: 23 staff (5% of 460), Auxiliary needed: 10 staff (2% of 460, rounded up)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(59, 2), (59, 4), (59, 6), (59, 8), (59, 10), -- Technical staff
(59, 31), (59, 32), (59, 33), (59, 34), (59, 35), (59, 36), (59, 37), (59, 38), (59, 39), (59, 40),
(59, 41), (59, 42), (59, 43), (59, 44), (59, 45), (59, 46), (59, 47), (59, 48), (59, 49), (59, 50),
(59, 51), (59, 52), (59, 53), -- Security staff
(59, 86), (59, 87), (59, 88), (59, 89), (59, 90), (59, 91), (59, 92), (59, 93), (59, 94), (59, 95); -- Auxiliary staff

-- Event 60: Ultra Resistance Stage Day 1 (venue_id = 28, capacity = 430)
-- Security needed: 22 staff (5% of 430), Auxiliary needed: 9 staff (2% of 430)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(60, 20), (60, 21), (60, 22), (60, 23), (60, 24), -- Technical staff
(60, 54), (60, 55), (60, 56), (60, 57), (60, 58), (60, 59), (60, 60), (60, 61), (60, 62), (60, 63), 
(60, 64), (60, 65), (60, 66), (60, 67), (60, 68), (60, 69), (60, 70), (60, 71), (60, 72), (60, 73), 
(60, 74), (60, 75), -- Security staff
(60, 99), (60, 100), (60, 101), (60, 102), (60, 103), (60, 104), (60, 105), (60, 106), (60, 107); -- Auxiliary staff

-- Event 61: Ultra Main Stage Day 2 (venue_id = 27, capacity = 460)
-- Security needed: 23 staff (5% of 460), Auxiliary needed: 10 staff (2% of 460, rounded up)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(61, 2), (61, 4), (61, 6), (61, 8), (61, 10), -- Technical staff
(61, 31), (61, 32), (61, 33), (61, 34), (61, 35), (61, 36), (61, 37), (61, 38), (61, 39), (61, 40),
(61, 41), (61, 42), (61, 43), (61, 44), (61, 45), (61, 46), (61, 47), (61, 48), (61, 49), (61, 50),
(61, 51), (61, 52), (61, 53), -- Security staff
(61, 86), (61, 87), (61, 88), (61, 89), (61, 90), (61, 91), (61, 92), (61, 93), (61, 94), (61, 95); -- Auxiliary staff

-- Event 62: Ultra Resistance Stage Day 2 (venue_id = 28, capacity = 430)
-- Security needed: 22 staff (5% of 430), Auxiliary needed: 9 staff (2% of 430)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(62, 20), (62, 21), (62, 22), (62, 23), (62, 24), -- Technical staff
(62, 54), (62, 55), (62, 56), (62, 57), (62, 58), (62, 59), (62, 60), (62, 61), (62, 62), (62, 63), 
(62, 64), (62, 65), (62, 66), (62, 67), (62, 68), (62, 69), (62, 70), (62, 71), (62, 72), (62, 73), 
(62, 74), (62, 75), -- Security staff
(62, 99), (62, 100), (62, 101), (62, 102), (62, 103), (62, 104), (62, 105), (62, 109), (62, 110); -- Auxiliary staff

-- Event 63: Ultra Main Stage Day 3 (venue_id = 27, capacity = 460)
-- Security needed: 23 staff (5% of 460), Auxiliary needed: 10 staff (2% of 460, rounded up)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(63, 2), (63, 4), (63, 6), (63, 8), (63, 10), -- Technical staff
(63, 31), (63, 32), (63, 33), (63, 34), (63, 35), (63, 36), (63, 37), (63, 38), (63, 39), (63, 40),
(63, 41), (63, 42), (63, 43), (63, 44), (63, 45), (63, 46), (63, 47), (63, 48), (63, 49), (63, 50),
(63, 51), (63, 52), (63, 53), -- Security staff
(63, 86), (63, 87), (63, 88), (63, 89), (63, 90), (63, 91), (63, 92), (63, 93), (63, 94), (63, 95); -- Auxiliary staff

-- Event 64: Ultra Resistance Stage Day 3 (venue_id = 28, capacity = 430)
-- Security needed: 22 staff (5% of 430), Auxiliary needed: 9 staff (2% of 430)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(64, 20), (64, 21), (64, 22), (64, 23), (64, 24), -- Technical staff
(64, 54), (64, 55), (64, 56), (64, 57), (64, 58), (64, 59), (64, 60), (64, 61), (64, 62), (64, 63), 
(64, 64), (64, 65), (64, 66), (64, 67), (64, 68), (64, 69), (64, 70), (64, 71), (64, 72), (64, 73), 
(64, 74), (64, 75), -- Security staff
(64, 99), (64, 100), (64, 101), (64, 102), (64, 103), (64, 104), (64, 105), (64, 108), (64, 112); -- Auxiliary staff

-- Event 65: Creamfields Steel Yard Day 1 (venue_id = 29, capacity = 380)
-- Security needed: 19 staff (5% of 380), Auxiliary needed: 8 staff (2% of 380)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(65, 3), (65, 6), (65, 9), (65, 12), (65, 15), -- Technical staff
(65, 31), (65, 32), (65, 33), (65, 34), (65, 35), (65, 36), (65, 37), (65, 38), (65, 39), (65, 40),
(65, 41), (65, 42), (65, 43), (65, 44), (65, 45), (65, 46), (65, 47), (65, 48), (65, 49), -- Security staff
(65, 86), (65, 87), (65, 88), (65, 89), (65, 90), (65, 91), (65, 92), (65, 93); -- Auxiliary staff

-- Event 66: Creamfields Arc Stage Day 1 (venue_id = 30, capacity = 460)
-- Security needed: 23 staff (5% of 460), Auxiliary needed: 10 staff (2% of 460, rounded up)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(66, 4), (66, 8), (66, 16), (66, 20), (66, 24), -- Technical staff
(66, 50), (66, 51), (66, 52), (66, 53), (66, 54), (66, 55), (66, 56), (66, 57), (66, 58), (66, 59),
(66, 60), (66, 61), (66, 62), (66, 63), (66, 64), (66, 65), (66, 66), (66, 67), (66, 68), (66, 69),
(66, 70), (66, 71), (66, 72), -- Security staff
(66, 94), (66, 95), (66, 96), (66, 97), (66, 98), (66, 99), (66, 100), (66, 101), (66, 102), (66, 103); -- Auxiliary staff

-- Event 67: Creamfields Steel Yard Day 2 (venue_id = 29, capacity = 380)
-- Security needed: 19 staff (5% of 380), Auxiliary needed: 8 staff (2% of 380)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(67, 3), (67, 6), (67, 9), (67, 12), (67, 15), -- Technical staff
(67, 31), (67, 32), (67, 33), (67, 34), (67, 35), (67, 36), (67, 37), (67, 38), (67, 39), (67, 40),
(67, 41), (67, 42), (67, 43), (67, 44), (67, 45), (67, 46), (67, 47), (67, 48), (67, 49), -- Security staff
(67, 86), (67, 87), (67, 88), (67, 89), (67, 90), (67, 91), (67, 92), (67, 93); -- Auxiliary staff

-- Event 68: Creamfields Arc Stage Day 2 (venue_id = 30, capacity = 460)
-- Security needed: 23 staff (5% of 460), Auxiliary needed: 10 staff (2% of 460, rounded up)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(68, 4), (68, 8), (68, 16), (68, 20), (68, 24), -- Technical staff
(68, 50), (68, 51), (68, 52), (68, 53), (68, 54), (68, 55), (68, 56), (68, 57), (68, 58), (68, 59),
(68, 60), (68, 61), (68, 62), (68, 63), (68, 64), (68, 65), (68, 66), (68, 67), (68, 68), (68, 69),
(68, 70), (68, 71), (68, 72), -- Security staff
(68, 94), (68, 95), (68, 96), (68, 97), (68, 98), (68, 99), (68, 100), (68, 101), (68, 102), (68, 103); -- Auxiliary staff

-- Event 69: Creamfields Steel Yard Day 3 (venue_id = 29, capacity = 380)
-- Security needed: 19 staff (5% of 380), Auxiliary needed: 8 staff (2% of 380)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(69, 3), (69, 6), (69, 9), (69, 12), (69, 15), -- Technical staff
(69, 31), (69, 32), (69, 33), (69, 34), (69, 35), (69, 36), (69, 37), (69, 38), (69, 39), (69, 40),
(69, 41), (69, 42), (69, 43), (69, 44), (69, 45), (69, 46), (69, 47), (69, 48), (69, 49), -- Security staff
(69, 86), (69, 87), (69, 88), (69, 89), (69, 90), (69, 91), (69, 92), (69, 93); -- Auxiliary staff

-- Event 70: Creamfields Arc Stage Day 3 (venue_id = 30, capacity = 460)
-- Security needed: 23 staff (5% of 460), Auxiliary needed: 10 staff (2% of 460, rounded up)
INSERT INTO EVENT_STAFF (event_id, staff_id) VALUES
(70, 4), (70, 8), (70, 16), (70, 20), (70, 24), -- Technical staff
(70, 50), (70, 51), (70, 52), (70, 53), (70, 54), (70, 55), (70, 56), (70, 57), (70, 58), (70, 59),
(70, 60), (70, 61), (70, 62), (70, 63), (70, 64), (70, 65), (70, 66), (70, 67), (70, 68), (70, 69),
(70, 70), (70, 71), (70, 72),  -- Security staff
(70, 94), (70, 95), (70, 96), (70, 97), (70, 98), (70, 99), (70, 100), (70, 101), (70, 102), (70, 103);  -- Auxiliary staff

-- Εισαγωγή επισκεπτών (VISITOR) 150 in total
INSERT INTO VISITOR (first_name, last_name, email, phone, age) VALUES
('James', 'Wilson', 'james.wilson@example.com', '+1-555-123-4567', 33),
('Emma', 'Johnson', 'emma.johnson@example.com', '+1-555-234-5678', 35),
('Michael', 'Brown', 'michael.brown@example.com', '+1-555-345-6789', 28),
('Olivia', 'Davis', 'olivia.davis@example.com', '+1-555-456-7890', 31),
('William', 'Miller', 'william.miller@example.com', '+1-555-567-8901', 38),
('Sophia', 'Wilson', 'sophia.wilson@example.com', '+1-555-678-9012', 30),
('Alexander', 'Moore', 'alexander.moore@example.com', '+1-555-789-0123', 36),
('Charlotte', 'Taylor', 'charlotte.taylor@example.com', '+1-555-890-1234', 32),
('Daniel', 'Anderson', 'daniel.anderson@example.com', '+1-555-901-2345', 34),
('Amelia', 'Thomas', 'amelia.thomas@example.com', '+1-555-012-3456', 29),
('Matthew', 'Jackson', 'matthew.jackson@example.com', '+1-555-123-4568', 37),
('Emily', 'White', 'emily.white@example.com', '+1-555-234-5679', 33),
('Christopher', 'Harris', 'christopher.harris@example.com', '+1-555-345-6780', 35),
('Abigail', 'Martin', 'abigail.martin@example.com', '+1-555-456-7891', 30),
('Andrew', 'Thompson', 'andrew.thompson@example.com', '+1-555-567-8902', 32),
('Elizabeth', 'Garcia', 'elizabeth.garcia@example.com', '+1-555-678-9013', 36),
('Joshua', 'Martinez', 'joshua.martinez@example.com', '+1-555-789-0124', 28),
('Mia', 'Robinson', 'mia.robinson@example.com', '+1-555-890-1235', 34),
('David', 'Clark', 'david.clark@example.com', '+1-555-901-2346', 31),
('Sofia', 'Rodriguez', 'sofia.rodriguez@example.com', '+1-555-012-3457', 37),
('Joseph', 'Lewis', 'joseph.lewis@example.com', '+1-555-123-4569', 29),
('Ella', 'Lee', 'ella.lee@example.com', '+1-555-234-5680', 33),
('John', 'Walker', 'john.walker@example.com', '+1-555-345-6781', 35),
('Grace', 'Hall', 'grace.hall@example.com', '+1-555-456-7892', 30),
('Samuel', 'Allen', 'samuel.allen@example.com', '+1-555-567-8903', 38),
('Chloe', 'Young', 'chloe.young@example.com', '+1-555-678-9014', 32),
('Benjamin', 'Hernandez', 'benjamin.hernandez@example.com', '+1-555-789-0125', 36),
('Lily', 'King', 'lily.king@example.com', '+1-555-890-1236', 28),
('Henry', 'Wright', 'henry.wright@example.com', '+1-555-901-2347', 34),
('Zoe', 'Lopez', 'zoe.lopez@example.com', '+1-555-012-3458', 31),
('Sebastian', 'Hill', 'sebastian.hill@example.com', '+1-555-123-4570', 37),
('Layla', 'Scott', 'layla.scott@example.com', '+1-555-234-5681', 29),
('Jack', 'Green', 'jack.green@example.com', '+1-555-345-6782', 33),
('Nora', 'Adams', 'nora.adams@example.com', '+1-555-456-7893', 35),
('Ryan', 'Baker', 'ryan.baker@example.com', '+1-555-567-8904', 30),
('Scarlett', 'Gonzalez', 'scarlett.gonzalez@example.com', '+1-555-678-9015', 38),
('Nathan', 'Nelson', 'nathan.nelson@example.com', '+1-555-789-0126', 32),
('Audrey', 'Carter', 'audrey.carter@example.com', '+1-555-890-1237', 36),
('Isaac', 'Mitchell', 'isaac.mitchell@example.com', '+1-555-901-2348', 28),
('Hannah', 'Perez', 'hannah.perez@example.com', '+1-555-012-3459', 34),
('Luke', 'Roberts', 'luke.roberts@example.com', '+1-555-123-4571', 31),
('Leah', 'Turner', 'leah.turner@example.com', '+1-555-234-5682', 37),
('Owen', 'Phillips', 'owen.phillips@example.com', '+1-555-345-6783', 29),
('Stella', 'Campbell', 'stella.campbell@example.com', '+1-555-456-7894', 33),
('Gabriel', 'Parker', 'gabriel.parker@example.com', '+1-555-567-8905', 35),
('Aria', 'Evans', 'aria.evans@example.com', '+1-555-678-9016', 30),
('Carter', 'Edwards', 'carter.edwards@example.com', '+1-555-789-0127', 38),
('Ellie', 'Collins', 'ellie.collins@example.com', '+1-555-890-1238', 32),
('Wyatt', 'Stewart', 'wyatt.stewart@example.com', '+1-555-901-2349', 36),
('Aubrey', 'Sanchez', 'aubrey.sanchez@example.com', '+1-555-012-3460', 28),
('Julian', 'Morris', 'julian.morris@example.com', '+1-555-123-4572', 34),
('Bella', 'Rogers', 'bella.rogers@example.com', '+1-555-234-5683', 31),
('Charles', 'Reed', 'charles.reed@example.com', '+1-555-345-6784', 37),
('Lucy', 'Cook', 'lucy.cook@example.com', '+1-555-456-7895', 29),
('Thomas', 'Morgan', 'thomas.morgan@example.com', '+1-555-567-8906', 33),
('Paisley', 'Bell', 'paisley.bell@example.com', '+1-555-678-9017', 35),
('Aaron', 'Murphy', 'aaron.murphy@example.com', '+1-555-789-0128', 30),
('Savannah', 'Bailey', 'savannah.bailey@example.com', '+1-555-890-1239', 38),
('Eli', 'Rivera', 'eli.rivera@example.com', '+1-555-901-2350', 32),
('Madelyn', 'Cooper', 'madelyn.cooper@example.com', '+1-555-012-3461', 36),
('Levi', 'Richardson', 'levi.richardson@example.com', '+1-555-123-4573', 28),
('Skylar', 'Cox', 'skylar.cox@example.com', '+1-555-234-5684', 34),
('Dylan', 'Howard', 'dylan.howard@example.com', '+1-555-345-6785', 31),
('Evelyn', 'Ward', 'evelyn.ward@example.com', '+1-555-456-7896', 37),
('Caleb', 'Torres', 'caleb.torres@example.com', '+1-555-567-8907', 29),
('Anna', 'Peterson', 'anna.peterson@example.com', '+1-555-678-9018', 33),
('Lincoln', 'Gray', 'lincoln.gray@example.com', '+1-555-789-0129', 35),
('Penelope', 'Ramirez', 'penelope.ramirez@example.com', '+1-555-890-1240', 30),
('Josiah', 'James', 'josiah.james@example.com', '+1-555-901-2351', 38),
('Maya', 'Watson', 'maya.watson@example.com', '+1-555-012-3462', 32),
('Hudson', 'Brooks', 'hudson.brooks@example.com', '+1-555-123-4574', 36),
('Lillian', 'Kelly', 'lillian.kelly@example.com', '+1-555-234-5685', 28),
('Asher', 'Sanders', 'asher.sanders@example.com', '+1-555-345-6786', 34),
('Camila', 'Price', 'camila.price@example.com', '+1-555-456-7897', 31),
('Leo', 'Bennett', 'leo.bennett@example.com', '+1-555-567-8908', 37),
('Violet', 'Wood', 'violet.wood@example.com', '+1-555-678-9019', 29),
('Ezra', 'Barnes', 'ezra.barnes@example.com', '+1-555-789-0130', 33),
('Avery', 'Ross', 'avery.ross@example.com', '+1-555-890-1241', 35),
('Kayden', 'Henderson', 'kayden.henderson@example.com', '+1-555-901-2352', 30),
('Hazel', 'Coleman', 'hazel.coleman@example.com', '+1-555-012-3463', 38),
('Nolan', 'Jenkins', 'nolan.jenkins@example.com', '+1-555-123-4575', 32),
('Aurora', 'Perry', 'aurora.perry@example.com', '+1-555-234-5686', 36),
('Elias', 'Powell', 'elias.powell@example.com', '+1-555-345-6787', 28),
('Nova', 'Long', 'nova.long@example.com', '+1-555-456-7898', 34),
('Grayson', 'Patterson', 'grayson.patterson@example.com', '+1-555-567-8909', 31),
('Emilia', 'Hughes', 'emilia.hughes@example.com', '+1-555-678-9020', 37),
('Isaiah', 'Flores', 'isaiah.flores@example.com', '+1-555-789-0131', 29),
('Naomi', 'Washington', 'naomi.washington@example.com', '+1-555-890-1242', 33),
('Jaxon', 'Butler', 'jaxon.butler@example.com', '+1-555-901-2353', 35),
('Ruby', 'Simmons', 'ruby.simmons@example.com', '+1-555-012-3464', 30),
('Mateo', 'Foster', 'mateo.foster@example.com', '+1-555-123-4576', 38),
('Willow', 'Gonzales', 'willow.gonzales@example.com', '+1-555-234-5687', 32),
('Ethan', 'Bryant', 'ethan.bryant@example.com', '+1-555-345-6788', 36),
('Ivy', 'Alexander', 'ivy.alexander@example.com', '+1-555-456-7899', 28),
('Logan', 'Russell', 'logan.russell@example.com', '+1-555-567-8910', 34),
('Aaliyah', 'Griffin', 'aaliyah.griffin@example.com', '+1-555-678-9021', 31),
('Aiden', 'Diaz', 'aiden.diaz@example.com', '+1-555-789-0132', 37),
('Piper', 'Hayes', 'piper.hayes@example.com', '+1-555-890-1243', 29),
('Noah', 'Sullivan', 'noah.sullivan@example.com', '+1-555-123-5001', 35),
('Isabella', 'Myers', 'isabella.myers@example.com', '+1-555-123-5002', 31),
('Mason', 'Ford', 'mason.ford@example.com', '+1-555-123-5003', 38),
('Ava', 'Hamilton', 'ava.hamilton@example.com', '+1-555-123-5004', 30),
('Jacob', 'Graham', 'jacob.graham@example.com', '+1-555-123-5005', 33),
('Madison', 'Wallace', 'madison.wallace@example.com', '+1-555-123-5006', 36),
('Ethan', 'Woods', 'ethan.woods@example.com', '+1-555-123-5007', 29),
('Mila', 'Cole', 'mila.cole@example.com', '+1-555-123-5008', 34),
('Liam', 'West', 'liam.west@example.com', '+1-555-123-5009', 37),
('Riley', 'Jordan', 'riley.jordan@example.com', '+1-555-123-5010', 28),
('Lucas', 'Owens', 'lucas.owens@example.com', '+1-555-123-5011', 32),
('Zara', 'Reynolds', 'zara.reynolds@example.com', '+1-555-123-5012', 35),
('Jackson', 'Fisher', 'jackson.fisher@example.com', '+1-555-123-5013', 30),
('Victoria', 'Ellis', 'victoria.ellis@example.com', '+1-555-123-5014', 33),
('Aiden', 'Harrison', 'aiden.harrison@example.com', '+1-555-123-5015', 36),
('Gabriella', 'Gibson', 'gabriella.gibson@example.com', '+1-555-123-5016', 29),
('Connor', 'McDonald', 'connor.mcdonald@example.com', '+1-555-123-5017', 34),
('Natalie', 'Dixon', 'natalie.dixon@example.com', '+1-555-123-5018', 37),
('Elijah', 'Warren', 'elijah.warren@example.com', '+1-555-123-5019', 28),
('Samantha', 'Ferguson', 'samantha.ferguson@example.com', '+1-555-123-5020', 32),
('Christian', 'Murray', 'christian.murray@example.com', '+1-555-123-5021', 35),
('Addison', 'Gardner', 'addison.gardner@example.com', '+1-555-123-5022', 30),
('Landon', 'Stephens', 'landon.stephens@example.com', '+1-555-123-5023', 33),
('Brooklyn', 'Payne', 'brooklyn.payne@example.com', '+1-555-123-5024', 36),
('Adrian', 'Pierce', 'adrian.pierce@example.com', '+1-555-123-5025', 29),
('Kennedy', 'Knight', 'kennedy.knight@example.com', '+1-555-123-5026', 34),
('Colton', 'Wells', 'colton.wells@example.com', '+1-555-123-5027', 37),
('Sadie', 'Meyer', 'sadie.meyer@example.com', '+1-555-123-5028', 28),
('Brayden', 'Wagner', 'brayden.wagner@example.com', '+1-555-123-5029', 32),
('Autumn', 'Stone', 'autumn.stone@example.com', '+1-555-123-5030', 35),
('Dominic', 'Hawkins', 'dominic.hawkins@example.com', '+1-555-123-5031', 30),
('Peyton', 'Fox', 'peyton.fox@example.com', '+1-555-123-5032', 33),
('Parker', 'Cunningham', 'parker.cunningham@example.com', '+1-555-123-5033', 36),
('Melanie', 'Burns', 'melanie.burns@example.com', '+1-555-123-5034', 29),
('Chase', 'Gordon', 'chase.gordon@example.com', '+1-555-123-5035', 34),
('Lydia', 'Shaw', 'lydia.shaw@example.com', '+1-555-123-5036', 37),
('Xavier', 'Holmes', 'xavier.holmes@example.com', '+1-555-123-5037', 28),
('Claire', 'Rice', 'claire.rice@example.com', '+1-555-123-5038', 32),
('Sawyer', 'Robertson', 'sawyer.robertson@example.com', '+1-555-123-5039', 35),
('Gianna', 'Hunt', 'gianna.hunt@example.com', '+1-555-123-5040', 30),
('Silas', 'Black', 'silas.black@example.com', '+1-555-123-5041', 33),
('Isabelle', 'Daniels', 'isabelle.daniels@example.com', '+1-555-123-5042', 36),
('Jace', 'Palmer', 'jace.palmer@example.com', '+1-555-123-5043', 29),
('Valeria', 'Mills', 'valeria.mills@example.com', '+1-555-123-5044', 34),
('Declan', 'Nichols', 'declan.nichols@example.com', '+1-555-123-5045', 37),
('Arianna', 'Grant', 'arianna.grant@example.com', '+1-555-123-5046', 28),
('Weston', 'Knight', 'weston.knight@example.com', '+1-555-123-5047', 32),
('Eliana', 'Ferguson', 'eliana.ferguson@example.com', '+1-555-123-5048', 35),
('Axel', 'Rose', 'axel.rose@example.com', '+1-555-123-5049', 30),
('Gabrielle', 'Stone', 'gabrielle.stone@example.com', '+1-555-123-5050', 33),
('Roman', 'Hawkins', 'roman.hawkins@example.com', '+1-555-123-5051', 36),
('Serenity', 'Fox', 'serenity.fox@example.com', '+1-555-123-5052', 29),
('Rowan', 'Cunningham', 'rowan.cunningham@example.com', '+1-555-123-5053', 34);

-- Inserting 200 tickets (20 for each festival)

-- Coachella 2020 (festival_id = 1, events 1-6)
INSERT INTO TICKET (EAN_code, category, purchased_date, price, payment_method, is_activated, visitor_id, event_id, resale_buyer_queue_id, resale_seller_queue_id) VALUES
('EAN-2020-1-001', 'VIP', '2020-01-15 10:23:45', 450.00, 'Credit Card', 1, 1, 1, NULL, NULL),
('EAN-2020-1-002', 'General Admission', '2020-01-20 14:35:12', 350.00, 'Debit Card', 1, 2, 1, NULL, NULL),
('EAN-2020-1-003', 'Early Bird', '2019-12-05 09:12:33', 299.99, 'Credit Card', 1, 3, 2, NULL, NULL),
('EAN-2020-1-004', 'Premium', '2020-02-10 16:45:22', 399.99, 'Bank Transfer', 1, 4, 2, NULL, NULL),
('EAN-2020-1-005', 'General Admission', '2020-02-15 11:30:45', 350.00, 'Credit Card', 1, 5, 3, NULL, NULL),
('EAN-2020-1-006', 'VIP', '2020-01-25 13:22:18', 450.00, 'Debit Card', 1, 6, 3, NULL, NULL),
('EAN-2020-1-007', 'Early Bird', '2019-12-10 08:45:30', 299.99, 'Credit Card', 1, 7, 4, NULL, NULL),
('EAN-2020-1-008', 'General Admission', '2020-02-20 15:15:40', 350.00, 'Bank Transfer', 1, 8, 4, NULL, NULL),
('EAN-2020-1-009', 'Premium', '2020-01-30 12:10:55', 399.99, 'Credit Card', 1, 9, 5, NULL, NULL),
('EAN-2020-1-010', 'VIP', '2020-02-05 17:05:23', 450.00, 'Debit Card', 1, 45, 5, NULL, NULL),
('EAN-2020-1-011', 'General Admission', '2020-02-12 10:33:42', 350.00, 'Credit Card', 1, 11, 6, NULL, NULL),
('EAN-2020-1-012', 'Early Bird', '2019-12-15 09:25:18', 299.99, 'Bank Transfer', 1, 12, 6, NULL, NULL),
('EAN-2020-1-013', 'Premium', '2020-01-18 14:40:33', 399.99, 'Credit Card', 1, 11, 1, NULL, NULL),
('EAN-2020-1-014', 'General Admission', '2020-02-22 16:20:15', 350.00, 'Debit Card', 1, 11, 2, NULL, NULL),
('EAN-2020-1-015', 'VIP', '2020-01-28 11:15:50', 450.00, 'Credit Card', 1, 11, 3, NULL, NULL),
('EAN-2020-1-016', 'Early Bird', '2019-12-20 08:55:25', 299.99, 'Bank Transfer', 1, 18, 4, NULL, NULL),
('EAN-2020-1-017', 'General Admission', '2020-02-25 15:30:10', 350.00, 'Credit Card', 1, 18, 5, NULL, NULL),
('EAN-2020-1-018', 'Premium', '2020-01-22 13:45:38', 399.99, 'Debit Card', 1, 18, 6, NULL, NULL),
('EAN-2020-1-019', 'VIP', '2020-02-08 17:25:12', 450.00, 'Credit Card', 1, 18, 1, NULL, NULL),
('EAN-2020-1-020', 'General Admission', '2020-02-18 12:50:30', 350.00, 'Bank Transfer', 1, 20, 2, NULL, NULL);

-- Glastonbury 2021 (festival_id = 2, events 7-16)
INSERT INTO TICKET (EAN_code, category, purchased_date, price, payment_method, is_activated, visitor_id, event_id, resale_buyer_queue_id, resale_seller_queue_id) VALUES
('EAN-2021-2-001', 'VIP', '2021-02-10 09:15:30', 500.00, 'Credit Card', 1, 21, 7, NULL, NULL),
('EAN-2021-2-002', 'General Admission', '2021-02-15 13:40:22', 375.00, 'Debit Card', 1, 22, 8, NULL, NULL),
('EAN-2021-2-003', 'Early Bird', '2020-12-05 08:30:15', 325.00, 'Credit Card', 1, 23, 9, NULL, NULL),
('EAN-2021-2-004', 'Premium', '2021-03-01 15:20:45', 425.00, 'Bank Transfer', 1, 24, 10, NULL, NULL),
('EAN-2021-2-005', 'General Admission', '2021-03-05 11:10:33', 375.00, 'Credit Card', 1, 25, 11, NULL, NULL),
('EAN-2021-2-006', 'VIP', '2021-02-20 14:25:18', 500.00, 'Debit Card', 1, 26, 12, NULL, NULL),
('EAN-2021-2-007', 'Early Bird', '2020-12-10 09:45:20', 325.00, 'Credit Card', 1, 27, 13, NULL, NULL),
('EAN-2021-2-008', 'General Admission', '2021-03-10 16:30:42', 375.00, 'Bank Transfer', 1, 28, 14, NULL, NULL),
('EAN-2021-2-009', 'Premium', '2021-02-25 12:15:55', 425.00, 'Credit Card', 1, 29, 15, NULL, NULL),
('EAN-2021-2-010', 'VIP', '2021-03-15 17:35:28', 500.00, 'Debit Card', 1, 30, 16, NULL, NULL),
('EAN-2021-2-011', 'General Admission', '2021-03-20 10:50:15', 375.00, 'Credit Card', 1, 31, 7, NULL, NULL),
('EAN-2021-2-012', 'Early Bird', '2020-12-15 08:40:30', 325.00, 'Bank Transfer', 1, 31, 8, NULL, NULL),
('EAN-2021-2-013', 'Premium', '2021-02-18 13:55:22', 425.00, 'Credit Card', 1, 31, 9, NULL, NULL),
('EAN-2021-2-014', 'General Admission', '2021-03-25 15:45:10', 375.00, 'Debit Card', 1, 31, 10, NULL, NULL),
('EAN-2021-2-015', 'VIP', '2021-02-28 11:25:40', 500.00, 'Credit Card', 1, 31, 11, NULL, NULL),
('EAN-2021-2-016', 'Early Bird', '2020-12-20 09:20:15', 325.00, 'Bank Transfer', 1, 35, 12, NULL, NULL),
('EAN-2021-2-017', 'General Admission', '2021-04-01 16:10:33', 375.00, 'Credit Card', 1, 35, 13, NULL, NULL),
('EAN-2021-2-018', 'Premium', '2021-03-05 12:35:45', 425.00, 'Debit Card', 1, 35, 14, NULL, NULL),
('EAN-2021-2-019', 'VIP', '2021-03-18 17:50:20', 500.00, 'Credit Card', 1, 35, 15, NULL, NULL),
('EAN-2021-2-020', 'General Admission', '2021-03-28 11:05:38', 375.00, 'Bank Transfer', 1, 40, 16, NULL, NULL);

-- Lollapalooza 2021 (festival_id = 3, events 17-24)
INSERT INTO TICKET (EAN_code, category, purchased_date, price, payment_method, is_activated, visitor_id, event_id, resale_buyer_queue_id, resale_seller_queue_id) VALUES
('EAN-2021-3-001', 'VIP', '2021-04-10 10:15:30', 475.00, 'Credit Card', 1, 41, 17, NULL, NULL),
('EAN-2021-3-002', 'General Admission', '2021-04-15 14:25:22', 365.00, 'Debit Card', 1, 42, 18, NULL, NULL),
('EAN-2021-3-003', 'Early Bird', '2021-02-05 09:30:15', 315.00, 'Credit Card', 1, 43, 19, NULL, NULL),
('EAN-2021-3-004', 'Premium', '2021-05-01 16:20:45', 415.00, 'Bank Transfer', 1, 44, 20, NULL, NULL),
('EAN-2021-3-005', 'General Admission', '2021-05-05 12:10:33', 365.00, 'Credit Card', 1, 45, 21, NULL, NULL),
('EAN-2021-3-006', 'VIP', '2021-04-20 15:25:18', 475.00, 'Debit Card', 1, 46, 22, NULL, NULL),
('EAN-2021-3-007', 'Early Bird', '2021-02-10 08:45:20', 315.00, 'Credit Card', 1, 47, 23, NULL, NULL),
('EAN-2021-3-008', 'General Admission', '2021-05-10 17:30:42', 365.00, 'Bank Transfer', 1, 48, 24, NULL, NULL),
('EAN-2021-3-009', 'Premium', '2021-04-25 13:15:55', 415.00, 'Credit Card', 1, 49, 17, NULL, NULL),
('EAN-2021-3-010', 'VIP', '2021-05-15 18:35:28', 475.00, 'Debit Card', 1, 50, 18, NULL, NULL),
('EAN-2021-3-011', 'General Admission', '2021-05-20 11:50:15', 365.00, 'Credit Card', 1, 35, 19, NULL, NULL),
('EAN-2021-3-012', 'Early Bird', '2021-02-15 09:40:30', 315.00, 'Bank Transfer', 1, 52, 20, NULL, NULL),
('EAN-2021-3-013', 'Premium', '2021-04-18 14:55:22', 415.00, 'Credit Card', 1, 53, 21, NULL, NULL),
('EAN-2021-3-014', 'General Admission', '2021-05-25 16:45:10', 365.00, 'Debit Card', 1, 54, 22, NULL, NULL),
('EAN-2021-3-015', 'VIP', '2021-04-28 12:25:40', 475.00, 'Credit Card', 1, 55, 23, NULL, NULL),
('EAN-2021-3-016', 'Early Bird', '2021-02-20 08:20:15', 315.00, 'Bank Transfer', 1, 56, 24, NULL, NULL),
('EAN-2021-3-017', 'General Admission', '2021-06-01 17:10:33', 365.00, 'Credit Card', 1, 57, 17, NULL, NULL),
('EAN-2021-3-018', 'Premium', '2021-05-05 13:35:45', 415.00, 'Debit Card', 1, 58, 18, NULL, NULL),
('EAN-2021-3-019', 'VIP', '2021-05-18 18:50:20', 475.00, 'Credit Card', 1, 59, 19, NULL, NULL),
('EAN-2021-3-020', 'General Admission', '2021-05-28 12:05:38', 365.00, 'Bank Transfer', 1, 60, 20, NULL, NULL);

-- Fuji Rock 2022 (festival_id = 4, events 25-30)
INSERT INTO TICKET (EAN_code, category, purchased_date, price, payment_method, is_activated, visitor_id, event_id, resale_buyer_queue_id, resale_seller_queue_id) VALUES
('EAN-2022-4-001', 'VIP', '2022-03-10 09:15:30', 525.00, 'Credit Card', 1, 61, 25, NULL, NULL),
('EAN-2022-4-002', 'General Admission', '2022-03-15 13:25:22', 385.00, 'Debit Card', 1, 62, 26, NULL, NULL),
('EAN-2022-4-003', 'Early Bird', '2022-01-05 08:30:15', 335.00, 'Credit Card', 1, 63, 27, NULL, NULL),
('EAN-2022-4-004', 'Premium', '2022-04-01 15:20:45', 435.00, 'Bank Transfer', 1, 64, 28, NULL, NULL),
('EAN-2022-4-005', 'General Admission', '2022-04-05 11:10:33', 385.00, 'Credit Card', 1, 65, 29, NULL, NULL),
('EAN-2022-4-006', 'VIP', '2022-03-20 14:25:18', 525.00, 'Debit Card', 1, 66, 30, NULL, NULL),
('EAN-2022-4-007', 'Early Bird', '2022-01-10 09:45:20', 335.00, 'Credit Card', 1, 67, 25, NULL, NULL),
('EAN-2022-4-008', 'General Admission', '2022-04-10 16:30:42', 385.00, 'Bank Transfer', 1, 68, 26, NULL, NULL),
('EAN-2022-4-009', 'Premium', '2022-03-25 12:15:55', 435.00, 'Credit Card', 1, 69, 27, NULL, NULL),
('EAN-2022-4-010', 'VIP', '2022-04-15 17:35:28', 525.00, 'Debit Card', 1, 70, 28, NULL, NULL),
('EAN-2022-4-011', 'General Admission', '2022-04-20 10:50:15', 385.00, 'Credit Card', 1, 71, 29, NULL, NULL),
('EAN-2022-4-012', 'Early Bird', '2022-01-15 08:40:30', 335.00, 'Bank Transfer', 1, 72, 30, NULL, NULL),
('EAN-2022-4-013', 'Premium', '2022-03-18 13:55:22', 435.00, 'Credit Card', 1, 73, 25, NULL, NULL),
('EAN-2022-4-014', 'General Admission', '2022-04-25 15:45:10', 385.00, 'Debit Card', 1, 74, 26, NULL, NULL),
('EAN-2022-4-015', 'VIP', '2022-03-28 11:25:40', 525.00, 'Credit Card', 1, 75, 27, NULL, NULL),
('EAN-2022-4-016', 'Early Bird', '2022-01-20 09:20:15', 335.00, 'Bank Transfer', 1, 76, 28, NULL, NULL),
('EAN-2022-4-017', 'General Admission', '2022-05-01 16:10:33', 385.00, 'Credit Card', 1, 77, 29, NULL, NULL),
('EAN-2022-4-018', 'Premium', '2022-04-05 12:35:45', 435.00, 'Debit Card', 1, 78, 30, NULL, NULL),
('EAN-2022-4-019', 'VIP', '2022-04-18 17:50:20', 525.00, 'Credit Card', 1, 79, 25, NULL, NULL),
('EAN-2022-4-020', 'General Admission', '2022-04-28 11:05:38', 385.00, 'Bank Transfer', 1, 80, 26, NULL, NULL);

-- Primavera Sound 2022 (festival_id = 5, events 31-36)
INSERT INTO TICKET (EAN_code, category, purchased_date, price, payment_method, is_activated, visitor_id, event_id, resale_buyer_queue_id, resale_seller_queue_id) VALUES
('EAN-2022-5-001', 'VIP', '2022-02-10 10:15:30', 490.00, 'Credit Card', 1, 81, 31, NULL, NULL),
('EAN-2022-5-002', 'General Admission', '2022-02-15 14:25:22', 370.00, 'Debit Card', 1, 82, 32, NULL, NULL),
('EAN-2022-5-003', 'Early Bird', '2021-12-05 09:30:15', 320.00, 'Credit Card', 1, 83, 33, NULL, NULL),
('EAN-2022-5-004', 'Premium', '2022-03-01 16:20:45', 420.00, 'Bank Transfer', 1, 84, 34, NULL, NULL),
('EAN-2022-5-005', 'General Admission', '2022-03-05 12:10:33', 370.00, 'Credit Card', 1, 85, 35, NULL, NULL),
('EAN-2022-5-006', 'VIP', '2022-02-20 15:25:18', 490.00, 'Debit Card', 1, 86, 36, NULL, NULL),
('EAN-2022-5-007', 'Early Bird', '2021-12-10 08:45:20', 320.00, 'Credit Card', 1, 87, 31, NULL, NULL),
('EAN-2022-5-008', 'General Admission', '2022-03-10 17:30:42', 370.00, 'Bank Transfer', 1, 88, 32, NULL, NULL),
('EAN-2022-5-009', 'Premium', '2022-02-25 13:15:55', 420.00, 'Credit Card', 1, 89, 33, NULL, NULL),
('EAN-2022-5-010', 'VIP', '2022-03-15 18:35:28', 490.00, 'Debit Card', 1, 90, 34, NULL, NULL),
('EAN-2022-5-011', 'General Admission', '2022-03-20 11:50:15', 370.00, 'Credit Card', 1, 91, 35, NULL, NULL),
('EAN-2022-5-012', 'Early Bird', '2021-12-15 09:40:30', 320.00, 'Bank Transfer', 1, 91, 36, NULL, NULL),
('EAN-2022-5-013', 'Premium', '2022-02-18 14:55:22', 420.00, 'Credit Card', 1, 91, 31, NULL, NULL),
('EAN-2022-5-014', 'General Admission', '2022-03-25 16:45:10', 370.00, 'Debit Card', 1, 91, 32, NULL, NULL),
('EAN-2022-5-015', 'VIP', '2022-02-28 12:25:40', 490.00, 'Credit Card', 1, 95, 33, NULL, NULL),
('EAN-2022-5-016', 'Early Bird', '2021-12-20 08:20:15', 320.00, 'Bank Transfer', 1, 95, 34, NULL, NULL),
('EAN-2022-5-017', 'General Admission', '2022-04-01 17:10:33', 370.00, 'Credit Card', 1, 95, 35, NULL, NULL),
('EAN-2022-5-018', 'Premium', '2022-03-05 13:35:45', 420.00, 'Debit Card', 1, 95, 36, NULL, NULL),
('EAN-2022-5-019', 'VIP', '2022-03-18 18:50:20', 490.00, 'Credit Card', 1, 99, 31, NULL, NULL),
('EAN-2022-5-020', 'General Admission', '2022-03-28 12:05:38', 370.00, 'Bank Transfer', 1, 100, 32, NULL, NULL);

-- Rock am Ring 2023 (festival_id = 6, events 37-42)
INSERT INTO TICKET (EAN_code, category, purchased_date, price, payment_method, is_activated, visitor_id, event_id, resale_buyer_queue_id, resale_seller_queue_id) VALUES
('EAN-2023-6-001', 'VIP', '2023-02-10 09:15:30', 510.00, 'Credit Card', 1, 101, 37, NULL, NULL),
('EAN-2023-6-002', 'General Admission', '2023-02-15 13:25:22', 380.00, 'Debit Card', 1, 102, 38, NULL, NULL),
('EAN-2023-6-003', 'Early Bird', '2022-12-05 08:30:15', 330.00, 'Credit Card', 1, 103, 39, NULL, NULL),
('EAN-2023-6-004', 'Premium', '2023-03-01 15:20:45', 430.00, 'Bank Transfer', 1, 61, 40, NULL, NULL),
('EAN-2023-6-005', 'General Admission', '2023-03-05 11:10:33', 380.00, 'Credit Card', 1, 105, 41, NULL, NULL),
('EAN-2023-6-006', 'VIP', '2023-02-20 14:25:18', 510.00, 'Debit Card', 1, 106, 42, NULL, NULL),
('EAN-2023-6-007', 'Early Bird', '2022-12-10 09:45:20', 330.00, 'Credit Card', 1, 107, 37, NULL, NULL),
('EAN-2023-6-008', 'General Admission', '2023-03-10 16:30:42', 380.00, 'Bank Transfer', 1, 108, 38, NULL, NULL),
('EAN-2023-6-009', 'Premium', '2023-02-25 12:15:55', 430.00, 'Credit Card', 1, 109, 39, NULL, NULL),
('EAN-2023-6-010', 'VIP', '2023-03-15 17:35:28', 510.00, 'Debit Card', 1, 110, 40, NULL, NULL),
('EAN-2023-6-011', 'General Admission', '2023-03-20 10:50:15', 380.00, 'Credit Card', 1, 111, 41, NULL, NULL),
('EAN-2023-6-012', 'Early Bird', '2022-12-15 08:40:30', 330.00, 'Bank Transfer', 1, 112, 42, NULL, NULL),
('EAN-2023-6-013', 'Premium', '2023-02-18 13:55:22', 430.00, 'Credit Card', 1, 113, 37, NULL, NULL),
('EAN-2023-6-014', 'General Admission', '2023-03-25 15:45:10', 380.00, 'Debit Card', 1, 114, 38, NULL, NULL),
('EAN-2023-6-015', 'VIP', '2023-02-28 11:25:40', 510.00, 'Credit Card', 1, 115, 39, NULL, NULL),
('EAN-2023-6-016', 'Early Bird', '2022-12-20 09:20:15', 330.00, 'Bank Transfer', 1, 116, 40, NULL, NULL),
('EAN-2023-6-017', 'General Admission', '2023-04-01 16:10:33', 380.00, 'Credit Card', 1, 117, 41, NULL, NULL),
('EAN-2023-6-018', 'Premium', '2023-03-05 12:35:45', 430.00, 'Debit Card', 1, 118, 42, NULL, NULL),
('EAN-2023-6-019', 'VIP', '2023-03-18 17:50:20', 510.00, 'Credit Card', 1, 119, 37, NULL, NULL),
('EAN-2023-6-020', 'General Admission', '2023-03-28 11:05:38', 380.00, 'Bank Transfer', 1, 120, 38, NULL, NULL);

-- Woodstock Revival 2023 (festival_id = 7, events 43-50)
INSERT INTO TICKET (EAN_code, category, purchased_date, price, payment_method, is_activated, visitor_id, event_id, resale_buyer_queue_id, resale_seller_queue_id) VALUES
('EAN-2023-7-001', 'VIP', '2023-04-10 10:15:30', 480.00, 'Credit Card', 1, 121, 43, NULL, NULL),
('EAN-2023-7-002', 'General Admission', '2023-04-15 14:25:22', 360.00, 'Debit Card', 1, 122, 44, NULL, NULL),
('EAN-2023-7-003', 'Early Bird', '2023-02-05 09:30:15', 310.00, 'Credit Card', 1, 123, 45, NULL, NULL),
('EAN-2023-7-004', 'Premium', '2023-05-01 16:20:45', 410.00, 'Bank Transfer', 1, 124, 46, NULL, NULL),
('EAN-2023-7-005', 'General Admission', '2023-05-05 12:10:33', 360.00, 'Credit Card', 1, 1, 47, NULL, NULL),
('EAN-2023-7-006', 'VIP', '2023-04-20 15:25:18', 480.00, 'Debit Card', 1, 126, 48, NULL, NULL),
('EAN-2023-7-007', 'Early Bird', '2023-02-10 08:45:20', 310.00, 'Credit Card', 1, 127, 49, NULL, NULL),
('EAN-2023-7-008', 'General Admission', '2023-05-10 17:30:42', 360.00, 'Bank Transfer', 1, 128, 50, NULL, NULL),
('EAN-2023-7-009', 'Premium', '2023-04-25 13:15:55', 410.00, 'Credit Card', 1, 129, 43, NULL, NULL),
('EAN-2023-7-010', 'VIP', '2023-05-15 18:35:28', 480.00, 'Debit Card', 1, 130, 44, NULL, NULL),
('EAN-2023-7-011', 'General Admission', '2023-05-20 11:50:15', 360.00, 'Credit Card', 1, 131, 45, NULL, NULL),
('EAN-2023-7-012', 'Early Bird', '2023-02-15 09:40:30', 310.00, 'Bank Transfer', 1, 132, 46, NULL, NULL),
('EAN-2023-7-013', 'Premium', '2023-04-18 14:55:22', 410.00, 'Credit Card', 1, 133, 47, NULL, NULL),
('EAN-2023-7-014', 'General Admission', '2023-05-25 16:45:10', 360.00, 'Debit Card', 1, 134, 48, NULL, NULL),
('EAN-2023-7-015', 'VIP', '2023-04-28 12:25:40', 480.00, 'Credit Card', 1, 135, 49, NULL, NULL),
('EAN-2023-7-016', 'Early Bird', '2023-02-20 08:20:15', 310.00, 'Bank Transfer', 1, 136, 50, NULL, NULL),
('EAN-2023-7-017', 'General Admission', '2023-06-01 17:10:33', 360.00, 'Credit Card', 1, 137, 43, NULL, NULL),
('EAN-2023-7-018', 'Premium', '2023-05-05 13:35:45', 410.00, 'Debit Card', 1, 138, 44, NULL, NULL),
('EAN-2023-7-019', 'VIP', '2023-05-18 18:50:20', 480.00, 'Credit Card', 1, 139, 45, NULL, NULL),
('EAN-2023-7-020', 'General Admission', '2023-05-28 12:05:38', 360.00, 'Bank Transfer', 1, 140, 46, NULL, NULL);

-- Boom Festival 2024 (festival_id = 8, events 51-58)
INSERT INTO TICKET (EAN_code, category, purchased_date, price, payment_method, is_activated, visitor_id, event_id, resale_buyer_queue_id, resale_seller_queue_id) VALUES
('EAN-2024-8-001', 'VIP', '2024-03-10 09:15:30', 530.00, 'Credit Card', 1, 1, 51, NULL, NULL),
('EAN-2024-8-002', 'General Admission', '2024-03-15 13:25:22', 390.00, 'Debit Card', 1, 2, 52, NULL, NULL),
('EAN-2024-8-003', 'Early Bird', '2024-01-05 08:30:15', 340.00, 'Credit Card', 1, 3, 53, NULL, NULL),
('EAN-2024-8-004', 'Premium', '2024-04-01 15:20:45', 440.00, 'Bank Transfer', 1, 4, 54, NULL, NULL),
('EAN-2024-8-005', 'General Admission', '2024-04-05 11:10:33', 390.00, 'Credit Card', 1, 5, 55, NULL, NULL),
('EAN-2024-8-006', 'VIP', '2024-03-20 14:25:18', 530.00, 'Debit Card', 1, 6, 56, NULL, NULL),
('EAN-2024-8-007', 'Early Bird', '2024-01-10 09:45:20', 340.00, 'Credit Card', 1, 7, 57, NULL, NULL),
('EAN-2024-8-008', 'General Admission', '2024-04-10 16:30:42', 390.00, 'Bank Transfer', 1, 8, 58, NULL, NULL),
('EAN-2024-8-009', 'Premium', '2024-03-25 12:15:55', 440.00, 'Credit Card', 1, 9, 51, NULL, NULL),
('EAN-2024-8-010', 'VIP', '2024-04-15 17:35:28', 530.00, 'Debit Card', 1, 45, 52, NULL, NULL),
('EAN-2024-8-011', 'General Admission', '2024-04-20 10:50:15', 390.00, 'Credit Card', 1, 11, 53, NULL, NULL),
('EAN-2024-8-012', 'Early Bird', '2024-01-15 08:40:30', 340.00, 'Bank Transfer', 1, 12, 54, NULL, NULL),
('EAN-2024-8-013', 'Premium', '2024-03-18 13:55:22', 440.00, 'Credit Card', 1, 13, 55, NULL, NULL),
('EAN-2024-8-014', 'General Admission', '2024-04-25 15:45:10', 390.00, 'Debit Card', 1, 14, 56, NULL, NULL),
('EAN-2024-8-015', 'VIP', '2024-03-28 11:25:40', 530.00, 'Credit Card', 1, 15, 57, NULL, NULL),
('EAN-2024-8-016', 'Early Bird', '2024-01-20 09:20:15', 340.00, 'Bank Transfer', 1, 16, 58, NULL, NULL),
('EAN-2024-8-017', 'General Admission', '2024-05-01 16:10:33', 390.00, 'Credit Card', 1, 17, 51, NULL, NULL),
('EAN-2024-8-018', 'Premium', '2024-04-05 12:35:45', 440.00, 'Debit Card', 1, 18, 52, NULL, NULL),
('EAN-2024-8-019', 'VIP', '2024-04-18 17:50:20', 530.00, 'Credit Card', 1, 19, 53, NULL, NULL),
('EAN-2024-8-020', 'General Admission', '2024-04-28 11:05:38', 390.00, 'Bank Transfer', 1, 20, 54, NULL, NULL);

-- Ultra Music Festival 2025 (festival_id = 9, events 59-64)
INSERT INTO TICKET (EAN_code, category, purchased_date, price, payment_method, is_activated, visitor_id, event_id, resale_buyer_queue_id, resale_seller_queue_id) VALUES
('EAN-2025-9-001', 'VIP', '2025-02-10 10:15:30', 550.00, 'Credit Card', 0, 21, 59, NULL, NULL),
('EAN-2025-9-002', 'General Admission', '2025-02-15 14:25:22', 400.00, 'Debit Card', 0, 22, 60, NULL, NULL),
('EAN-2025-9-003', 'Early Bird', '2024-12-05 09:30:15', 350.00, 'Credit Card', 0, 23, 61, NULL, NULL),
('EAN-2025-9-004', 'Premium', '2025-03-01 16:20:45', 450.00, 'Bank Transfer', 0, 24, 62, NULL, NULL),
('EAN-2025-9-005', 'General Admission', '2025-03-05 12:10:33', 400.00, 'Credit Card', 0, 25, 63, NULL, NULL),
('EAN-2025-9-006', 'VIP', '2025-02-20 15:25:18', 550.00, 'Debit Card', 0, 26, 64, NULL, NULL),
('EAN-2025-9-007', 'Early Bird', '2024-12-10 08:45:20', 350.00, 'Credit Card', 0, 27, 59, NULL, NULL),
('EAN-2025-9-008', 'General Admission', '2025-03-10 17:30:42', 400.00, 'Bank Transfer', 0, 28, 60, NULL, NULL),
('EAN-2025-9-009', 'Premium', '2025-02-25 13:15:55', 450.00, 'Credit Card', 0, 29, 61, NULL, NULL),
('EAN-2025-9-010', 'VIP', '2025-03-15 18:35:28', 550.00, 'Debit Card', 0, 30, 62, NULL, NULL),
('EAN-2025-9-011', 'General Admission', '2025-03-20 11:50:15', 400.00, 'Credit Card', 0, 31, 63, NULL, NULL),
('EAN-2025-9-012', 'Early Bird', '2024-12-15 09:40:30', 350.00, 'Bank Transfer', 0, 32, 64, NULL, NULL),
('EAN-2025-9-013', 'Premium', '2025-02-18 14:55:22', 450.00, 'Credit Card', 0, 33, 59, NULL, NULL),
('EAN-2025-9-014', 'General Admission', '2025-03-25 16:45:10', 400.00, 'Debit Card', 0, 34, 60, NULL, NULL),
('EAN-2025-9-015', 'VIP', '2025-02-28 12:25:40', 550.00, 'Credit Card', 0, 35, 61, NULL, NULL),
('EAN-2025-9-016', 'Early Bird', '2024-12-20 08:20:15', 350.00, 'Bank Transfer', 0, 36, 62, NULL, NULL),
('EAN-2025-9-017', 'General Admission', '2025-04-01 17:10:33', 400.00, 'Credit Card', 0, 37, 63, NULL, NULL),
('EAN-2025-9-018', 'Premium', '2025-03-05 13:35:45', 450.00, 'Debit Card', 0, 38, 64, NULL, NULL),
('EAN-2025-9-019', 'VIP', '2025-03-18 18:50:20', 550.00, 'Credit Card', 0, 39, 59, NULL, NULL),
('EAN-2025-9-020', 'General Admission', '2025-03-28 12:05:38', 400.00, 'Bank Transfer', 0, 40, 60, NULL, NULL);

-- Creamfields 2025 (festival_id = 10, events 65-70)
INSERT INTO TICKET (EAN_code, category, purchased_date, price, payment_method, is_activated, visitor_id, event_id, resale_buyer_queue_id, resale_seller_queue_id) VALUES
('EAN-2025-10-001', 'VIP', '2025-04-10 09:15:30', 540.00, 'Credit Card', 0, 41, 65, NULL, NULL),
('EAN-2025-10-002', 'General Admission', '2025-04-15 13:25:22', 395.00, 'Debit Card', 0, 42, 66, NULL, NULL),
('EAN-2025-10-003', 'Early Bird', '2025-02-05 08:30:15', 345.00, 'Credit Card', 0, 43, 67, NULL, NULL),
('EAN-2025-10-004', 'Premium', '2025-05-01 15:20:45', 445.00, 'Bank Transfer', 0, 44, 68, NULL, NULL),
('EAN-2025-10-005', 'General Admission', '2025-05-05 11:10:33', 395.00, 'Credit Card', 0, 45, 69, NULL, NULL),
('EAN-2025-10-006', 'VIP', '2025-04-20 14:25:18', 540.00, 'Debit Card', 0, 46, 70, NULL, NULL),
('EAN-2025-10-007', 'Early Bird', '2025-02-10 09:45:20', 345.00, 'Credit Card', 0, 47, 70, NULL, NULL),
('EAN-2025-10-008', 'General Admission', '2025-05-10 16:30:42', 395.00, 'Bank Transfer', 0, 48, 65, NULL, NULL),
('EAN-2025-10-009', 'Premium', '2025-04-25 12:15:55', 445.00, 'Credit Card', 0, 49, 66, NULL, NULL),
('EAN-2025-10-010', 'VIP', '2025-05-15 17:35:28', 540.00, 'Debit Card', 0, 50, 67, NULL, NULL),
('EAN-2025-10-011', 'General Admission', '2025-05-20 10:50:15', 395.00, 'Credit Card', 0, 51, 68, NULL, NULL),
('EAN-2025-10-012', 'Early Bird', '2025-02-15 08:40:30', 345.00, 'Bank Transfer', 0, 52, 69, NULL, NULL),
('EAN-2025-10-013', 'Premium', '2025-04-18 13:55:22', 445.00, 'Credit Card', 0, 53, 70, NULL, NULL),
('EAN-2025-10-014', 'General Admission', '2025-05-25 15:45:10', 395.00, 'Debit Card', 0, 54, 70, NULL, NULL),
('EAN-2025-10-015', 'VIP', '2025-04-28 11:25:40', 540.00, 'Credit Card', 0, 55, 65, NULL, NULL),
('EAN-2025-10-016', 'Early Bird', '2025-02-20 09:20:15', 345.00, 'Bank Transfer', 0, 56, 66, NULL, NULL),
('EAN-2025-10-017', 'General Admission', '2025-06-01 16:10:33', 395.00, 'Credit Card', 0, 57, 67, NULL, NULL),
('EAN-2025-10-018', 'Premium', '2025-05-05 12:35:45', 445.00, 'Debit Card', 0, 58, 68, NULL, NULL),
('EAN-2025-10-019', 'VIP', '2025-05-18 17:50:20', 540.00, 'Credit Card', 0, 59, 69, NULL, NULL),
('EAN-2025-10-020', 'General Admission', '2025-05-28 11:05:38', 395.00, 'Bank Transfer', 0, 60, 70, NULL, NULL);

-- Inserting ratings for performances
-- Each rating includes scores (1-5) for artist interpretation, sound/lighting, stage presence, organization, and overall impression
-- Only visitors with activated tickets can rate performances they attended

-- Ratings for Coachella 2020 performances (festival_id = 1)
INSERT INTO RATING (artist_interpretation, sound_lighting, stage_presence, organization, overall_impression, rating_comment, rating_date, visitor_id, performance_id) VALUES
(5, 4, 5, 4, 5, 'Incredible performance! The energy was amazing.', '2020-04-15 14:23:45', 1, 1),
(4, 5, 4, 3, 4, 'Great sound quality, but the organization could have been better.', '2020-04-16 10:35:12', 2, 2),
(5, 5, 5, 5, 5, 'Best live performance I have ever seen!', '2020-04-15 22:12:33', 3, 4),
(3, 4, 4, 3, 4, 'Good performance overall, but the sound was a bit off at times.', '2020-04-16 16:45:22', 4, 5),
(4, 3, 5, 4, 4, 'Amazing stage presence, but lighting could have been better.', '2020-04-17 11:30:45', 5, 7),
(5, 4, 4, 5, 5, 'Fantastic show! Very well organized.', '2020-04-17 20:22:18', 6, 8),
(4, 4, 3, 4, 4, 'Solid performance, though I expected more stage presence.', '2020-04-18 08:45:30', 7, 9),
(3, 5, 4, 4, 4, 'Great lighting effects! The artist was good but not exceptional.', '2020-04-18 15:15:40', 8, 10),
(5, 5, 4, 3, 4, 'Incredible artist, but the venue was too crowded.', '2020-04-19 12:10:55', 9, 11),
(4, 5, 5, 4, 5, 'One of the best performances of the festival!', '2020-04-19 17:05:23', 45, 12);

-- Ratings for Glastonbury 2021 performances (festival_id = 2)
INSERT INTO RATING (artist_interpretation, sound_lighting, stage_presence, organization, overall_impression, rating_comment, rating_date, visitor_id, performance_id) VALUES
(5, 5, 5, 4, 5, 'Absolutely phenomenal! The artist exceeded all expectations.', '2021-06-28 09:15:30', 21, 16),
(4, 4, 5, 5, 5, 'Brilliant performance and excellent organization.', '2021-06-28 13:40:22', 22, 19),
(5, 3, 4, 4, 4, 'Great interpretation but the sound system had some issues.', '2021-06-29 08:30:15', 23, 21),
(3, 4, 3, 5, 4, 'Well organized event, but the performance was just average.', '2021-06-29 15:20:45', 24, 24),
(4, 5, 4, 3, 4, 'Amazing sound and lighting, but crowd management was poor.', '2021-06-30 11:10:33', 25, 26),
(5, 4, 5, 4, 5, 'Incredible energy from the artist! Truly memorable.', '2021-06-30 14:25:18', 26, 29),
(4, 3, 4, 4, 4, 'Good performance overall, though the lighting could be improved.', '2021-07-01 09:45:20', 27, 31),
(3, 5, 3, 5, 4, 'Excellent production value, but the artist seemed a bit off.', '2021-07-01 16:30:42', 28, 34),
(5, 4, 5, 3, 4, 'Fantastic performance marred only by poor venue organization.', '2021-07-02 12:15:55', 29, 36),
(4, 5, 4, 5, 5, 'One of the highlights of the festival! Everything was perfect.', '2021-07-02 17:35:28', 30, 39);

-- Ratings for Lollapalooza 2021 performances (festival_id = 3)
INSERT INTO RATING (artist_interpretation, sound_lighting, stage_presence, organization, overall_impression, rating_comment, rating_date, visitor_id, performance_id) VALUES
(4, 4, 5, 4, 4, 'Great energy and stage presence! Really enjoyed it.', '2021-08-01 10:15:30', 41, 41),
(5, 3, 4, 4, 4, 'The artist was amazing but the sound quality was inconsistent.', '2021-08-01 14:25:22', 42, 44),
(3, 5, 3, 5, 4, 'Spectacular light show! The performance itself was decent.', '2021-08-02 09:30:15', 43, 46),
(4, 4, 4, 3, 4, 'Solid performance overall, but the venue was too crowded.', '2021-08-02 16:20:45', 44, 49),
(5, 5, 5, 4, 5, 'Absolutely incredible! Best performance of the festival.', '2021-08-03 12:10:33', 45, 51),
(4, 5, 4, 5, 5, 'Excellent sound quality and very well organized.', '2021-08-03 15:25:18', 46, 54),
(3, 4, 5, 4, 4, 'Amazing stage presence, though the sound was a bit off.', '2021-08-04 08:45:20', 47, 56),
(5, 3, 4, 3, 4, 'The artist was brilliant but the lighting could have been better.', '2021-08-04 17:30:42', 48, 59),
(4, 4, 3, 5, 4, 'Very well organized, but the performance lacked energy at times.', '2021-08-05 13:15:55', 49, 42),
(5, 5, 4, 4, 5, 'Fantastic performance! Would definitely see them again.', '2021-08-05 18:35:28', 50, 45);

-- Ratings for Fuji Rock 2022 performances (festival_id = 4)
INSERT INTO RATING (artist_interpretation, sound_lighting, stage_presence, organization, overall_impression, rating_comment, rating_date, visitor_id, performance_id) VALUES
(4, 4, 5, 5, 5, 'Perfect in every way! The artist was incredible and the organization flawless.', '2022-07-30 09:15:30', 61, 61),
(4, 5, 4, 4, 4, 'Great sound and lighting effects. Very enjoyable performance.', '2022-07-30 13:25:22', 62, 64),
(3, 3, 4, 5, 4, 'Well organized event, but the performance was just average.', '2022-07-31 08:30:15', 63, 66),
(5, 4, 3, 4, 4, 'Excellent interpretation, though stage presence could be improved.', '2022-07-31 15:20:45', 64, 69),
(4, 5, 5, 3, 4, 'Amazing performance, but there were some organizational issues.', '2022-08-01 11:10:33', 65, 71),
(5, 5, 4, 5, 5, 'One of the best concerts Ive ever attended! Everything was perfect.', '2022-08-01 14:25:18', 66, 74),
(3, 4, 5, 4, 4, 'Great stage presence and energy, but sound quality was inconsistent.', '2022-08-02 09:45:20', 67, 62),
(4, 3, 4, 5, 4, 'Very well organized, but the lighting could have been better.', '2022-08-02 16:30:42', 68, 65),
(5, 5, 3, 4, 4, 'Brilliant sound and artist interpretation, though lacking in stage presence.', '2022-08-03 12:15:55', 69, 67),
(4, 4, 5, 5, 5, 'Fantastic all around! A truly memorable experience.', '2022-08-03 17:35:28', 70, 70);

-- Ratings for Primavera Sound 2022 performances (festival_id = 5)
INSERT INTO RATING (artist_interpretation, sound_lighting, stage_presence, organization, overall_impression, rating_comment, rating_date, visitor_id, performance_id) VALUES
(4, 5, 4, 4, 4, 'Great performance with excellent sound quality.', '2022-07-31 16:50:00', 81, 76),
(5, 4, 5, 3, 4, 'The artist was amazing but the organization was a bit chaotic.', '2022-06-03 14:25:22', 82, 79),
(3, 3, 4, 5, 4, 'Well organized but the performance was somewhat underwhelming.', '2022-06-04 09:30:15', 83, 81),
(4, 5, 3, 4, 4, 'Excellent sound and lighting, though stage presence was lacking.', '2022-06-04 16:20:45', 84, 84),
(5, 4, 5, 5, 5, 'Absolutely perfect! One of the highlights of the festival.', '2022-06-05 12:10:33', 85, 86),
(4, 3, 4, 4, 4, 'Good performance overall, but the sound system had some issues.', '2022-06-05 15:25:18', 86, 89),
(5, 5, 3, 3, 4, 'Amazing sound and artist interpretation, but poor organization.', '2022-06-06 08:45:20', 87, 77),
(3, 4, 5, 5, 4, 'Incredible stage presence and energy! Very well organized too.', '2022-06-06 17:30:42', 88, 80),
(4, 5, 4, 4, 4, 'Great sound quality and solid performance throughout.', '2022-06-07 13:15:55', 89, 82),
(5, 4, 5, 3, 4, 'Brilliant artist, though the venue management could be improved.', '2022-06-07 18:35:28', 90, 85);

-- Ratings for Rock am Ring 2023 performances (festival_id = 6)
INSERT INTO RATING (artist_interpretation, sound_lighting, stage_presence, organization, overall_impression, rating_comment, rating_date, visitor_id, performance_id) VALUES
(5, 5, 5, 4, 5, 'Absolutely phenomenal performance! The energy was electric.', '2023-06-04 09:15:30', 101, 91),
(4, 3, 4, 5, 4, 'Well organized event with a good performance, though sound was mediocre.', '2023-06-04 13:25:22', 102, 94),
(3, 4, 5, 4, 4, 'Amazing stage presence, but the artists interpretation was just okay.', '2023-06-05 08:30:15', 103, 96),
(3, 5, 3, 3, 4, 'Excellent sound and artist, but stage presence and organization were lacking.', '2023-06-05 15:20:45', 61, 99),
(4, 4, 4, 5, 4, 'Solid performance all around. Very well organized event.', '2023-06-06 11:10:33', 105, 101),
(5, 3, 5, 4, 4, 'Incredible artist and stage presence, but sound quality issues.', '2023-06-06 14:25:18', 106, 104),
(3, 5, 4, 5, 4, 'Excellent sound and lighting effects. Well organized but the artist was average.', '2023-06-07 09:45:20', 107, 92),
(4, 4, 3, 4, 4, 'Good performance overall, though lacking in stage presence.', '2023-06-07 16:30:42', 108, 95),
(5, 5, 5, 3, 5, 'One of the best performances Ive seen, despite organizational issues.', '2023-06-08 12:15:55', 109, 97),
(4, 5, 4, 5, 5, 'Fantastic experience! Great sound and very well organized.', '2023-06-08 17:35:28', 110, 100);

-- Ratings for Woodstock Revival 2023 performances (festival_id = 7)
INSERT INTO RATING (artist_interpretation, sound_lighting, stage_presence, organization, overall_impression, rating_comment, rating_date, visitor_id, performance_id) VALUES
(4, 4, 5, 4, 4, 'Great energy and stage presence! Really enjoyed the show.', '2023-08-20 10:15:30', 121, 106),
(5, 5, 4, 3, 4, 'Brilliant artist and sound, but the venue was too crowded.', '2023-08-20 14:25:22', 122, 109),
(3, 4, 3, 5, 4, 'Very well organized, but the performance was somewhat mediocre.', '2023-08-21 09:30:15', 123, 111),
(4, 3, 5, 4, 4, 'Amazing stage presence, though the sound quality could be better.', '2023-08-21 16:20:45', 124, 114),
(5, 5, 4, 5, 5, 'Perfect in every way! One of the highlights of the festival.', '2023-08-22 12:10:33', 1, 116),
(4, 4, 3, 4, 4, 'Solid performance, but I expected more stage presence.', '2023-08-22 15:25:18', 126, 119),
(3, 5, 5, 3, 4, 'Incredible stage presence and lighting, but poor organization.', '2023-08-23 08:45:20', 127, 121),
(5, 3, 4, 5, 4, 'The artist was amazing and the event was well organized, but sound issues.', '2023-08-23 17:30:42', 128, 124),
(4, 4, 5, 4, 4, 'Great performance with lots of energy and good organization.', '2023-08-24 13:15:55', 129, 107),
(5, 5, 3, 3, 4, 'Excellent artist and sound, but lacking in stage presence and organization.', '2023-08-24 18:35:28', 130, 110);

-- Ratings for Boom Festival 2024 performances (festival_id = 8)
INSERT INTO RATING (artist_interpretation, sound_lighting, stage_presence, organization, overall_impression, rating_comment, rating_date, visitor_id, performance_id) VALUES
(5, 4, 5, 5, 5, 'Absolutely incredible! The perfect festival experience.', '2024-07-25 09:15:30', 131, 112),
(4, 5, 4, 4, 4, 'Great sound and lighting with a solid performance.', '2024-07-25 13:25:22', 132, 114),
(3, 3, 5, 4, 4, 'Amazing stage presence, but the sound and interpretation were average.', '2024-07-26 08:30:15', 133, 118),
(5, 4, 3, 3, 4, 'Excellent artist, but stage presence and organization could be improved.', '2024-07-26 15:20:45', 134, 120),
(4, 5, 4, 5, 5, 'Fantastic experience! Great sound and very well organized.', '2024-07-27 11:10:33', 135, 122),
(5, 3, 5, 4, 4, 'Incredible artist and stage presence, though sound quality was inconsistent.', '2024-07-27 14:25:18', 136, 125),
(3, 4, 4, 5, 4, 'Well organized with good performance, but nothing exceptional.', '2024-07-28 09:45:20', 137, 108),
(4, 5, 3, 4, 4, 'Excellent sound and lighting, though lacking in stage presence.', '2024-07-28 16:30:42', 138, 109),
(5, 4, 5, 3, 4, 'Amazing artist and stage presence, but organizational issues.', '2024-07-29 12:15:55', 139, 113),
(4, 5, 4, 5, 5, 'One of the best performances of the festival! Everything was great.', '2024-07-29 17:35:28', 140, 115);




-- Inserting data into RESALE_BUYER_QUEUE table
-- Includes both cases: 
-- 1. Interest in a specific performance and ticket category
-- 2. Interest in a specific ticket that is available for sale

-- Case 1: Buyers interested in a specific performance and ticket category
-- Only for future festivals (Ultra Music Festival 2025 and Creamfields 2025)

INSERT INTO RESALE_BUYER_QUEUE (interest_date, ticket_category, event_id, ticket_id, visitor_id, is_processed) VALUES
-- Buyers interested in VIP tickets for specific performances
('2024-12-15 09:23:45', 'VIP', 64, NULL, 61, FALSE),
('2024-12-16 14:35:12', 'VIP', 64, NULL, 62, FALSE),
('2024-12-18 10:12:33', 'VIP', 61, NULL, 63, FALSE),
('2024-12-20 16:45:22', 'VIP', 62, NULL, 64, FALSE),
('2025-01-22 11:30:45', 'VIP', 62, NULL, 65, FALSE),

-- Buyers interested in General Admission tickets for specific performances
('2024-12-14 13:22:18', 'General Admission', 60, NULL, 66, FALSE),
('2024-12-17 08:45:30', 'General Admission', 66, NULL, 67, FALSE),
('2024-12-19 15:15:40', 'General Admission', 66, NULL, 68, FALSE),
('2025-01-21 12:10:55', 'General Admission', 67, NULL, 69, FALSE),
('2025-01-23 17:05:23', 'General Admission', 68, NULL, 70, FALSE),

-- Buyers interested in Premium tickets for specific performances
('2024-12-15 10:33:42', 'Premium', 59, NULL, 71, FALSE),
('2024-12-17 09:25:18', 'Premium', 62, NULL, 72, FALSE),
('2025-01-19 14:40:33', 'Premium', 62, NULL, 73, FALSE),
('2025-01-21 16:20:15', 'Premium', 70, NULL, 74, FALSE),
('2025-01-23 11:15:50', 'Premium', 62, NULL, 75, FALSE),

-- Buyers interested in Early Bird tickets for specific performances
('2024-12-14 08:55:25', 'Early Bird', 60, NULL, 76, FALSE),
('2024-12-16 15:30:10', 'Early Bird', 62, NULL, 77, FALSE),
('2024-12-18 13:45:38', 'Early Bird', 64, NULL, 78, FALSE),
('2025-01-20 17:25:12', 'Early Bird', 65, NULL, 79, FALSE),
('2025-01-22 12:50:30', 'Early Bird', 70, NULL, 80, FALSE);



-- Inserting data into RESALE_SELLER_QUEUE
-- These are visitors who want to sell their tickets for future festivals
-- Only non-activated tickets (is_activated = 0) can be resold


-- Sellers for Ultra Music Festival 2025 (festival_id = 9)
INSERT INTO RESALE_SELLER_QUEUE (listing_date, visitor_id, ticket_id, is_processed) VALUES
('2025-01-15 13:22:18', 21, 161, FALSE), -- Ticket for event_id 59, VIP
('2025-01-29 14:40:33', 28, 168, FALSE), -- Ticket for event_id 60, General Admission
('2025-01-19 15:15:40', 23, 163, FALSE), -- Ticket for event_id 61, Early Bird
('2025-01-21 12:10:55', 24, 164, FALSE), -- Ticket for event_id 62, Premium
('2025-01-23 17:05:23', 25, 165, FALSE), -- Ticket for event_id 63, General Admission
('2025-01-25 10:33:42', 26, 166, FALSE), -- Ticket for event_id 64, VIP
('2025-01-27 09:25:18', 27, 167, FALSE), -- Ticket for event_id 59, Early Bird
('2025-01-17 08:45:30', 22, 162, FALSE), -- Ticket for event_id 60, General Admission
('2025-01-31 16:20:15', 29, 169, FALSE), -- Ticket for event_id 61, Premium
('2025-02-02 11:15:50', 30, 170, FALSE); -- Ticket for event_id 62, VIP

-- Sellers for Creamfields 2025 (festival_id = 10)
INSERT INTO RESALE_SELLER_QUEUE (listing_date, visitor_id, ticket_id, is_processed) VALUES
('2025-04-05 10:33:42', 41, 181, FALSE), -- Ticket for event_id 65, VIP
('2025-04-07 09:25:18', 42, 182, FALSE), -- Ticket for event_id 66, General Admission
('2025-04-09 14:40:33', 43, 183, FALSE), -- Ticket for event_id 67, Early Bird
('2025-04-11 16:20:15', 44, 184, FALSE), -- Ticket for event_id 68, Premium
('2025-04-13 11:15:50', 45, 185, FALSE), -- Ticket for event_id 69, General Admission
('2025-04-15 09:20:15', 46, 186, FALSE), -- Ticket for event_id 70, VIP
('2025-04-17 16:10:33', 47, 187, FALSE), -- Ticket for event_id 70, Early Bird
('2025-04-19 12:35:45', 48, 188, FALSE), -- Ticket for event_id 65, General Admission
('2025-04-21 17:50:20', 49, 189, FALSE), -- Ticket for event_id 66, Premium
('2025-04-23 11:05:38', 50, 190, FALSE); -- Ticket for event_id 67, VIP



-- Case 2: Buyers interested in specific tickets that are available for resale
-- These tickets must already be in the resale queue (RESALE_SELLER_QUEUE)

INSERT INTO RESALE_BUYER_QUEUE (interest_date, ticket_category, event_id, ticket_id, visitor_id, is_processed) VALUES
-- Buyers interested in specific tickets for Ultra Music Festival 2025
('2025-01-10 14:25:18', NULL, NULL, 161, 81, FALSE), -- Interest in the specific VIP ticket for event_id 59
('2025-01-12 09:45:20', NULL, NULL, 163, 82, FALSE), -- Interest in the specific Early Bird ticket for event_id 61
('2025-01-14 16:30:42', NULL, NULL, 165, 83, FALSE), -- Interest in the specific General Admission ticket for event_id 63
('2025-01-16 12:15:55', NULL, NULL, 167, 84, FALSE), -- Interest in the specific Early Bird ticket for event_id 59
('2025-01-18 17:35:28', NULL, NULL, 169, 85, FALSE), -- Interest in the specific Premium ticket for event_id 61

-- Buyers interested in specific tickets for Creamfields 2025
('2025-03-05 10:50:15', NULL, NULL, 181, 86, FALSE), -- Interest in the specific VIP ticket for event_id 65
('2025-03-07 08:40:30', NULL, NULL, 183, 87, FALSE), -- Interest in the specific Early Bird ticket for event_id 67
('2025-03-09 13:55:22', NULL, NULL, 185, 88, FALSE), -- Interest in the specific General Admission ticket for event_id 69
('2025-03-11 15:45:10', NULL, NULL, 187, 89, FALSE), -- Interest in the specific Early Bird ticket for event_id 70
('2025-03-13 11:25:40', NULL, NULL, 189, 90, FALSE); -- Interest in the specific Premium ticket for event_id 66
 
-- DROP TABLE IF EXISTS vln2_assignment_groups_77.jobs_joboffer CASCADE;
-- DROP TABLE IF EXISTS vln2_assignment_groups_77.companies_company CASCADE;
-- DROP TABLE IF EXISTS vln2_assignment_groups_77.applications_application CASCADE;
-- DROP TABLE IF EXISTS vln2_assignment_groups_77.profiles_user CASCADE;



-- CREATE TABLE IF NOT EXISTS vln2_assignment_groups_77.companies_company (
--     ID SERIAL PRIMARY KEY,
--     name VARCHAR(255),
--     industry VARCHAR(255),
--     description TEXT,
--     website_url VARCHAR(255)
-- );

-- CREATE TABLE IF NOT EXISTS vln2_assignment_groups_77.jobs_joboffer (
--     ID SERIAL PRIMARY KEY,
--     title VARCHAR(255),
--     position VARCHAR(255),
--     description TEXT,
--     address VARCHAR(255),
--     salary DECIMAL(10,2),
--     company_id INT,
--     start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     due_date TIMESTAMP,
--     FOREIGN KEY (company_id) REFERENCES vln2_assignment_groups_77.companies_company(ID)
-- );


-- CREATE TABLE IF NOT EXISTS vln2_assignment_groups_77.users_customuser (
--     ID SERIAL PRIMARY KEY,
--     name VARCHAR(255),
--     email VARCHAR(255) UNIQUE,
--     password VARCHAR(255),
--     address VARCHAR(255),
--     phone_number VARCHAR(20),
--     gender VARCHAR(10),
--     primary_company_id INT,
--     FOREIGN KEY (primary_company_id) REFERENCES vln2_assignment_groups_77.companies_company(ID)
-- );


-- CREATE TABLE IF NOT EXISTS vln2_assignment_groups_77.applications_application (
--     ID SERIAL PRIMARY KEY,
--     applicant_id INT,
--     job_offer_id INT,
--     status VARCHAR(100),
--     timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     FOREIGN KEY (applicant_id) REFERENCES vln2_assignment_groups_77.profiles_user(ID),
--     FOREIGN KEY (job_offer_id) REFERENCES vln2_assignment_groups_77.jobs_joboffer(ID)
-- );




-- Companies

INSERT INTO vln2_assignment_groups_77.companies_company (name, industry, description, website_url) VALUES
('Tech Innovations Inc.', 'Technology', 'A leading technology company specializing in innovative consumer products.', 'http://www.techinnovationsinc.com'),
('Green Earth Solutions', 'Environmental Services', 'Provides eco-friendly solutions for modern environmental challenges.', 'http://www.greenearth.com'),
('Global Finance Ltd.', 'Finance', 'Offers a broad range of financial services globally.', 'http://www.globalfinance.com'),
('Pixel Perfect Designs', 'Design', 'Specializes in creating visually stunning designs for web and print media.', 'http://www.pixelperfectdesigns.com'),
('FutureTech Solutions LLC', 'Technology', 'Innovating the future with cutting-edge technology solutions for businesses worldwide.', 'http://www.futuretechsolutions.com'),
('Natures Bounty Organics', 'Health & Wellness', 'Offers organic and natural products for a healthier lifestyle.', 'http://www.naturesbountyorganics.com'),
('Infinity Events Management', 'Event Planning', 'Bringing creativity and precision to every event, making every moment unforgettable.', 'http://www.infinityeventsmanagement.com'),
('BlueSky Aviation Services', 'Aviation', 'Provides comprehensive aviation services including aircraft maintenance and leasing.', 'http://www.blueskyaviation.com'),
('Smart Solutions Consulting Group', 'Consulting', 'Delivering strategic consulting services to help businesses thrive in a rapidly evolving market.', 'http://www.smartsolutionsconsulting.com'),
('Golden Harvest Agriculture', 'Agriculture', 'Dedicated to sustainable farming practices and ensuring food security for future generations.', 'http://www.goldenharvestagriculture.com'),
('Peak Performance Fitness', 'Fitness', 'Empowering individuals to achieve their fitness goals through personalized training and nutrition programs.', 'http://www.peakperformancefitness.com'),
('Summit Software Solutions', 'Software Development', 'Developing custom software solutions tailored to meet the unique needs of businesses.', 'http://www.summitsoftwaresolutions.com'),
('Silver Lining Financial Planning', 'Finance', 'Providing comprehensive financial planning services to help individuals and businesses secure their financial future.', 'http://www.silverliningfinancialplanning.com'),
('Urban Oasis Real Estate', 'Real Estate', 'Specializing in urban properties, providing dream homes in vibrant city settings.', 'http://www.urbanoasisrealestate.com'),
('TechGenius Solutions', 'Technology', 'Your partner in technological advancement, offering innovative solutions for businesses of all sizes.', 'http://www.techgeniussolutions.com'),
('Green Thumb Gardening Services', 'Landscaping', 'Transforming outdoor spaces into lush green paradises with our expert gardening services.', 'http://www.greenthumbgardening.com'),
('Crystal Clear Water Purification', 'Environmental Services', 'Pioneering water purification technology to ensure clean and safe drinking water for all.', 'http://www.crystalclearwater.com'),
('Eagle Eye Security Solutions', 'Security', 'Protecting your assets with state-of-the-art security systems and surveillance solutions.', 'http://www.eagleeyesecuritysolutions.com'),
('Prime Logistics & Shipping', 'Logistics', 'Streamlining supply chain operations with efficient logistics and shipping solutions.', 'http://www.primelogistics.com'),
('Healthy Habits Nutrition', 'Health & Wellness', 'Promoting healthy living through education and access to nutritious foods and supplements.', 'http://www.healthyhabitsnutrition.com'),
('Creative Minds Advertising Agency', 'Advertising', 'Bringing brands to life through innovative advertising campaigns and strategies.', 'http://www.creativemindsadvertising.com'),
('Skyline Builders & Contractors', 'Construction', 'Building the future with quality construction services and sustainable building practices.', 'http://www.skylinebuilders.com'),
('Global Reach Language Services', 'Translation & Localization', 'Breaking down language barriers with accurate and culturally sensitive translation services.', 'http://www.globalreachlanguageservices.com'),
('TechNest Electronics', 'Electronics', 'Your one-stop shop for the latest gadgets and electronics, delivering cutting-edge technology to your doorstep.', 'http://www.technestelectronics.com'),
('Serenity Spa & Wellness Center', 'Spa & Wellness', 'Indulge in relaxation and rejuvenation at our luxurious spa retreat, where tranquility meets luxury.', 'http://www.serenityspawellness.com'),
('Golden Gate Travel Agency', 'Travel & Tourism', 'Your passport to unforgettable experiences, offering personalized travel packages worldwide.', 'http://www.goldengatetravelagency.com'),
('Bright Ideas Energy Solutions', 'Renewable Energy', 'Harnessing the power of renewable energy sources to create a brighter and more sustainable future.', 'http://www.brightideasenergy.com'),
('Apex Automotive Repair & Service', 'Automotive', 'Keeping you on the road with expert automotive repair and maintenance services.', 'http://www.apexautomotive.com'),
('Healthwise Pharmaceuticals', 'Pharmaceuticals', 'Dedicated to improving healthcare through innovative pharmaceutical products and solutions.', 'http://www.healthwisepharmaceuticals.com'),
('Green Horizon Solar', 'Solar Energy', 'Leading the charge towards a greener planet with affordable and efficient solar energy solutions.', 'http://www.greenhorizonsolar.com'),
('Pinnacle Performance Coaching', 'Personal Development', 'Unlock your full potential with personalized coaching and development programs designed for success.', 'http://www.pinnacleperformancecoaching.com'),
('Ocean Blue Marine Services', 'Maritime', 'Navigating the seas with excellence, offering a wide range of marine services and solutions.', 'http://www.oceanbluemarineservices.com'),
('TechSavvy Innovations', 'Technology', 'Empowering businesses with innovative technological solutions and digital transformations.', 'http://www.techsavvyinnovations.com'),
('GreenThumb Eco-Friendly Landscaping', 'Landscaping', 'Creating sustainable and beautiful outdoor spaces with eco-friendly landscaping practices.', 'http://www.greenthumblandscaping.com'),
('AlphaOmega Security Solutions', 'Security', 'Providing comprehensive security solutions with cutting-edge technology and expert personnel.', 'http://www.alphaomegasecurity.com'),
('FirstClass Event Management', 'Event Planning', 'Setting the standard for unforgettable events with meticulous planning and flawless execution.', 'http://www.firstclassevents.com'),
('HealthFirst Medical Supplies', 'Healthcare', 'Your trusted source for high-quality medical supplies and equipment, prioritizing health and safety.', 'http://www.healthfirstmedical.com'),
('TechTrends Software Development', 'Software Development', 'Staying ahead of the curve with innovative software solutions tailored to your business needs.', 'http://www.techtrendsoftware.com'),
('GreenLeaf Sustainable Solutions', 'Sustainability', 'Leading the way in sustainability practices, offering eco-friendly solutions for businesses and communities.', 'http://www.greenleafsustainability.com'),
('BlueRidge Financial Advisors', 'Finance', 'Guiding clients towards financial success with personalized financial planning and investment strategies.', 'http://www.blueridgefinancial.com'),
('SkyHigh Drone Services', 'Drone Technology', 'Taking your projects to new heights with professional drone services for aerial photography and mapping.', 'http://www.skyhighdroneservices.com'),
('GoldenGate Legal Consultants', 'Legal Services', 'Providing expert legal advice and representation with integrity and professionalism.', 'http://www.goldengatelegal.com'),
('SunnySide Solar Solutions', 'Renewable Energy', 'Harnessing the power of the sun to provide sustainable energy solutions for homes and businesses.', 'http://www.sunnysidesolar.com'),
('WellnessWorks Corporate Wellness', 'Corporate Wellness', 'Promoting employee health and productivity with comprehensive corporate wellness programs.', 'http://www.wellnessworkscorporate.com'),
('GlobalConnect Telecom', 'Telecommunications', 'Keeping the world connected with reliable telecommunications solutions and network infrastructure.', 'http://www.globalconnecttelecom.com'),
('AlphaTech Robotics', 'Robotics', 'Bringing automation to life with advanced robotics solutions for industries ranging from manufacturing to healthcare.', 'http://www.alphatechrobotics.com'),
('GreenLife Organic Market', 'Retail', 'Offering a wide selection of organic and sustainable products for conscious consumers.', 'http://www.greenlifeorganicmarket.com'),
('SmartDrive Automotive Solutions', 'Automotive', 'Driving innovation in the automotive industry with smart technology solutions for safer and more efficient vehicles.', 'http://www.smartdriveautomotive.com'),
('PinnaclePeak Adventure Tours', 'Travel & Tourism', 'Embark on unforgettable adventures with expertly guided tours to breathtaking destinations around the world.', 'http://www.pinnaclepeakadventures.com'),
('SunriseSenior Care Services', 'Elderly Care', 'Providing compassionate and personalized care services for seniors to enhance their quality of life.', 'http://www.sunriseseniorcare.com'),
('CrystalClear Cleaning Services', 'Cleaning', 'Delivering spotless results with professional cleaning services for residential and commercial properties.', 'http://www.crystalclearcleaning.com');



-- Job Offers

INSERT INTO vln2_assignment_groups_77.jobs_joboffer 
(title, position, description, address, salary, company_id, start_date, due_date) VALUES
('Software Developer', 'Full Time', 'Create innovative software solutions to enhance user experiences.', '234 Tech Park, San Jose, CA', 115000.00, 1, '2024-03-01', '2025-02-28'),
('Environmental Consultant', 'Full Time', 'Advise on projects to ensure environmental safety and sustainability.', '118 Eco Lane, San Diego, CA', 95000.00, 2, '2024-04-15', NULL),
('Investment Strategist', 'Full Time', 'Develop and manage strategic investment portfolios using quantum analytics.', '401 Finance St, New York, NY', 130000.00, 3, '2024-06-01', '2025-05-31'),
('AI Engineer', 'Full Time', 'Design and implement AI systems for robotics applications.', '889 Innovation Blvd, Pittsburgh, PA', 140000.00, 4, '2024-01-10', '2024-12-10'),
('Energy Analyst', 'Full Time', 'Analyze and improve energy production from sustainable resources.', '322 Green Way, Austin, TX', 87000.00, 5, '2024-02-20', '2024-11-20'),
('Blockchain Developer', 'Full Time', 'Develop decentralized applications to revolutionize financial transactions.', '508 Fintech Drive, Boston, MA', 120000.00, 6, '2024-03-15', NULL),
('Security Analyst', 'Full Time', 'Ensure the safety of information systems against cyber threats.', '733 Secure St, San Francisco, CA', 110000.00, 7, '2024-05-01', '2024-12-31'),
('Project Manager', 'Full Time', 'Lead environmental projects to promote ecological health and sustainability.', '450 Project Ave, Miami, FL', 102000.00, 8, '2024-07-15', '2025-01-15'),
('Finance Manager', 'Full Time', 'Manage financial operations to maximize investment returns.', '220 Dynamic Way, London, UK', 115000.00, 9, '2024-08-01', '2024-12-31'),
('Tech Support Specialist', 'Part Time', 'Provide technical support and troubleshoot software issues.', '180 Creative Ln, Seattle, WA', 65000.00, 10, '2024-04-01', NULL),
('Product Manager', 'Full Time', 'Lead product development teams from conception to launch.', '234 Tech Park, San Jose, CA', 125000.00, 1, '2024-09-01', '2025-08-31'),
('Ecology Scientist', 'Full Time', 'Research and develop methods to restore and conserve natural habitats.', '118 Eco Lane, San Diego, CA', 90000.00, 2, '2024-10-15', '2025-03-15'),
('Quant Analyst', 'Full Time', 'Apply quantitative techniques to improve investment models.', '401 Finance St, New York, NY', 135000.00, 3, '2024-11-01', '2025-10-31'),
('Robotics Technician', 'Full Time', 'Maintain and improve robotic systems for industrial applications.', '889 Innovation Blvd, Pittsburgh, PA', 96000.00, 4, '2024-12-10', '2025-11-10'),
('Renewable Energy Engineer', 'Full Time', 'Design and oversee the installation of renewable energy systems.', '322 Green Way, Austin, TX', 105000.00, 5, '2024-03-01', '2025-02-28'),
('FinTech Analyst', 'Full Time', 'Analyze market trends to forecast financial technology advancements.', '508 Fintech Drive, Boston, MA', 112000.00, 6, '2024-04-20', NULL),
('Network Security Engineer', 'Full Time', 'Design and enforce policies to protect network infrastructure.', '733 Secure St, San Francisco, CA', 118000.00, 7, '2024-05-05', '2024-12-05'),
('Environmental Engineer', 'Full Time', 'Develop systems and technology to reduce environmental impact.', '450 Project Ave, Miami, FL', 110000.00, 8, '2024-06-30', '2025-06-30'),
('Investment Advisor', 'Full Time', 'Provide expert advice to clients seeking to expand their financial portfolios.', '220 Dynamic Way, London, UK', 128000.00, 9, '2024-07-20', '2025-07-19'),
('Web Developer', 'Full Time', 'Build and maintain websites to ensure optimal functionality and user experience.', '180 Creative Ln, Seattle, WA', 95000.00, 10, '2024-08-15', '2025-08-14');
('Software Developer', 'Full Time', 'Join our team to develop innovative software solutions for various platforms.', '123 Tech Lane, Silicon Valley, CA', 120000.00, 1, '2024-06-01', '2024-12-31'),
('Environmental Engineer', 'Full Time', 'Work on eco-friendly solutions for environmental challenges in our dynamic team.', '456 Green Street, San Francisco, CA', 100000.00, 2, '2024-06-15', NULL),
('Senior Financial Advisor', 'Full Time', 'Provide expert financial advice and planning services to our global clients.', '789 Finance Blvd, New York, NY', 130000.00, 3, '2024-07-01', '2024-12-31'),
('Graphic Designer', 'Full Time', 'Use your creativity to design visually stunning graphics for web and print media.', '123 Design Avenue, Los Angeles, CA', 90000.00, 4, '2024-06-01', '2024-12-31'),
('Machine Learning Engineer', 'Full Time', 'Develop cutting-edge machine learning algorithms to enhance our technological solutions.', '456 Future Road, San Francisco, CA', 140000.00, 5, '2024-07-15', NULL),
('Wellness Coach', 'Full Time', 'Guide individuals towards healthier lifestyles through personalized coaching and support.', '789 Health Street, Miami, FL', 80000.00, 6, '2024-08-01', '2024-12-31'),
('Event Coordinator', 'Full Time', 'Plan and execute memorable events with creativity and attention to detail.', '123 Event Plaza, Chicago, IL', 75000.00, 7, '2024-06-01', '2024-12-31'),
('Aircraft Maintenance Technician', 'Full Time', 'Ensure the safety and reliability of our aircraft fleet through expert maintenance.', '456 Aviation Avenue, Dallas, TX', 90000.00, 8, '2024-06-15', NULL),
('Management Consultant', 'Full Time', 'Provide strategic guidance to businesses to optimize performance and growth.', '789 Consulting Lane, Boston, MA', 110000.00, 9, '2024-07-01', '2024-12-31'),
('Agricultural Scientist', 'Full Time', 'Conduct research and develop sustainable farming practices to improve agricultural efficiency.', '123 Farm Road, Seattle, WA', 100000.00, 10, '2024-08-01', '2024-12-31'),
('Personal Trainer', 'Full Time', 'Help clients achieve their fitness goals through customized training programs.', '456 Fitness Avenue, Denver, CO', 70000.00, 11, '2024-06-01', '2024-12-31'),
('Software Engineer', 'Full Time', 'Contribute to the development of software solutions that drive business success.', '789 Summit Street, Austin, TX', 130000.00, 12, '2024-06-15', NULL),
('Financial Planner', 'Full Time', 'Assist individuals and businesses in creating financial plans for a secure future.', '123 Finance Lane, Philadelphia, PA', 120000.00, 13, '2024-07-01', '2024-12-31'),
('Real Estate Agent', 'Full Time', 'Help clients find their dream homes in vibrant urban neighborhoods.', '456 Realty Road, Miami, FL', 100000.00, 14, '2024-08-01', NULL),
('IT Support Specialist', 'Full Time', 'Provide technical support and troubleshooting for our technology solutions.', '789 Tech Street, Seattle, WA', 80000.00, 15, '2024-06-01', '2024-12-31'),
('Landscape Architect', 'Full Time', 'Design outdoor spaces that harmonize with nature and enhance quality of life.', '123 Green Gardens, Portland, OR', 90000.00, 16, '2024-06-15', NULL),
('Water Quality Engineer', 'Full Time', 'Work on developing advanced water purification technologies for clean drinking water.', '456 Aqua Avenue, San Diego, CA', 110000.00, 17, '2024-07-01', '2024-12-31'),
('Security Analyst', 'Full Time', 'Ensure the security of our assets and data through proactive monitoring and analysis.', '789 Security Street, Atlanta, GA', 100000.00, 18, '2024-08-01', NULL),
('Logistics Coordinator', 'Full Time', 'Coordinate and optimize transportation and distribution processes for efficient logistics.', '123 Logistics Lane, Houston, TX', 90000.00, 19, '2024-06-01', '2024-12-31'),
('Nutritionist', 'Full Time', 'Provide expert guidance on nutrition and dietary habits to promote healthier lifestyles.', '456 Wellness Avenue, Chicago, IL', 80000.00, 20, '2024-06-15', NULL),
('Advertising Specialist', 'Full Time', 'Develop and execute creative advertising campaigns to enhance brand visibility.', '789 Ad Avenue, Los Angeles, CA', 110000.00, 21, '2024-07-01', '2024-12-31'),
('Construction Manager', 'Full Time', 'Oversee construction projects from inception to completion with efficiency and quality.', '123 Construction Road, New York, NY', 120000.00, 22, '2024-08-01', NULL),
('Translator', 'Full Time', 'Translate documents and content accurately and effectively to bridge language barriers.', '456 Translation Street, San Francisco, CA', 90000.00, 23, '2024-06-01', '2024-12-31'),
('Electronics Technician', 'Full Time', 'Provide technical support and repair services for electronic devices and systems.', '789 Electronics Avenue, Seattle, WA', 80000.00, 24, '2024-06-15', NULL),
('Spa Therapist', 'Full Time', 'Deliver rejuvenating spa treatments and therapies to promote relaxation and wellness.', '123 Spa Lane, Miami, FL', 75000.00, 25, '2024-07-01', '2024-12-31'),
('Travel Agent', 'Full Time', 'Plan and book travel arrangements for clients to create unforgettable travel experiences.', '456 Travel Street, New York, NY', 100000.00, 26, '2024-08-01', NULL),
('Energy Analyst', 'Full Time', 'Analyze energy usage and develop strategies for optimizing energy efficiency.', '789 Energy Lane, San Francisco, CA', 110000.00, 27, '2024-06-01', '2024-12-31'),
('Automotive Technician', 'Full Time', 'Diagnose and repair vehicle issues to ensure optimal performance and safety.', '123 Auto Avenue, Los Angeles, CA', 80000.00, 28, '2024-06-15', NULL),
('Pharmaceutical Research Scientist', 'Full Time', 'Conduct research to develop new pharmaceutical products and improve existing ones.', '456 Pharma Road, Boston, MA', 120000.00, 29, '2024-07-01', '2024-12-31'),
('Solar Engineer', 'Full Time', 'Design and implement solar energy systems for residential and commercial applications.', '789 Solar Street, San Diego, CA', 100000.00, 30, '2024-08-01', NULL),
('Personal Development Coach', 'Full Time', 'Guide individuals in achieving personal growth and self-improvement.', '123 Growth Lane, Chicago, IL', 90000.00, 31, '2024-06-01', '2024-12-31'),
('Marine Engineer', 'Full Time', 'Design and oversee the construction of marine vessels and structures.', '456 Maritime Avenue, Seattle, WA', 110000.00, 32, '2024-06-15', NULL),
('Full Stack Developer', 'Full Time', 'Develop and maintain web applications using the latest technologies and frameworks.', '789 Web Street, San Francisco, CA', 120000.00, 33, '2024-07-01', '2024-12-31'),
('Landscape Technician', 'Full Time', 'Assist in the implementation of landscape designs and maintenance activities.', '123 Green Gardens, Portland, OR', 70000.00, 34, '2024-08-01', NULL),
('Water Resource Engineer', 'Full Time', 'Design and implement solutions for managing and protecting water resources.', '456 Aqua Avenue, San Diego, CA', 100000.00, 35, '2024-06-01', '2024-12-31'),
('Cybersecurity Specialist', 'Full Time', 'Protect our systems and data from cyber threats through proactive security measures.', '789 Security Street, Atlanta, GA', 110000.00, 36, '2024-06-15', NULL),
('Supply Chain Analyst', 'Full Time', 'Analyze supply chain data to identify opportunities for optimization and cost savings.', '123 Supply Lane, Houston, TX', 90000.00, 37, '2024-07-01', '2024-12-31'),
('Dietitian', 'Full Time', 'Provide expert nutritional advice and counseling to promote health and wellness.', '456 Wellness Avenue, Chicago, IL', 80000.00, 38, '2024-08-01', NULL),
('Marketing Specialist', 'Full Time', 'Develop and implement marketing strategies to promote our products and services.', '789 Marketing Street, Los Angeles, CA', 100000.00, 39, '2024-06-01', '2024-12-31'),
('Construction Worker', 'Full Time', 'Assist in various construction tasks to ensure projects are completed on time and within budget.', '123 Construction Road, New York, NY', 70000.00, 40, '2024-06-15', NULL);
('Senior Software Engineer', 'Full Time', 'Develop cutting-edge software solutions for our product lines.', '123 Tech Lane, Silicon Valley, CA', 150000.00, 1, '2024-01-01', '2024-12-31'),
('Project Manager', 'Full Time', 'Manage projects and coordinate teams across our global offices.', '456 Business Park, London, UK', 80000.00, 2, '2024-02-15', NULL),
('Financial Analyst', 'Full Time', 'Analyze financial trends and provide investment advice.', '789 Finance Blvd, New York, NY', 90000.00, 3, '2024-03-01', '2024-11-30');


--Status

INSERT INTO vln2_assignment_groups_77.applications_application (applicant_id, job_offer_id, status) VALUES
(1, 2, 'accepted'),
(2, 1, 'rejected'),
(2, 3, 'pending'),
(3, 2, 'accepted'),
(3, 3, 'rejected'),
(4, 1, 'accepted'),
(4, 2, 'pending'),
(1, 3, 'rejected'),
(2, 2, 'accepted'),
(5, 4, 'pending'),
(6, 5, 'pending'),
(7, 6, 'pending'),
(8, 7, 'pending'),
(9, 8, 'pending'),
(10, 9, 'pending'),
(11, 10, 'pending'),
(12, 11, 'pending'),
(13, 12, 'pending'),
(14, 13, 'pending'),
(15, 14, 'pending'),
(16, 15, 'pending'),
(17, 16, 'pending'),
(18, 17, 'pending'),
(19, 18, 'pending'),
(20, 19, 'pending'),
(21, 20, 'pending'),
(22, 21, 'pending'),
(23, 22, 'pending'),
(24, 23, 'pending'),
(25, 24, 'pending'),
(26, 25, 'pending'),
(27, 26, 'pending'),
(28, 27, 'pending'),
(29, 28, 'pending'),
(30, 29, 'pending'),
(31, 30, 'pending'),
(32, 31, 'pending'),
(33, 32, 'pending'),
(34, 33, 'pending'),
(35, 34, 'pending'),
(36, 35, 'pending'),
(37, 36, 'pending'),
(38, 37, 'pending'),
(39, 38, 'pending'),
(40, 39, 'pending'),
(41, 40, 'pending');



-- Companies table with premium

INSERT INTO vln2_assignment_groups_77.companies_company 
(name, industry, description, premium, website_url) VALUES
('Innovative Web Solutions', 'Technology', 'Dedicated to crafting cutting-edge web applications and services.', FALSE, 'http://www.innovativewebsolutions.com'),
('EcoSystems Inc.', 'Environmental Services', 'Focused on sustainable living solutions and environmental impact reduction.', FALSE, 'http://www.ecosystemsinc.com'),
('Quantum Investments', 'Finance', 'Specializes in high-return investment strategies leveraging quantum computing.', FALSE, 'http://www.quantuminvestments.com'),
('NextGen Robotics', 'Technology', 'Pioneering the development of autonomous robotic systems for industry.', FALSE, 'http://www.nextgenrobotics.com'),
('BioGreen Energy', 'Environmental Services', 'Develops renewable energy solutions from bio-waste materials.', FALSE, 'http://www.biogreenenergy.com'),
('Fintech Solutions Ltd.', 'Finance', 'Provides innovative financial technology services to streamline banking and investments.', FALSE, 'http://www.fintechsolutionsltd.com'),
('CyberSecure Tech', 'Technology', 'Offers cybersecurity solutions to protect corporate data and systems.', FALSE, 'http://www.cybersecuretech.com'),
('Green Horizon Projects', 'Environmental Services', 'Works on large-scale environmental projects to improve ecosystem health.', FALSE, 'http://www.greenhorizonprojects.com'),
('Dynamic Capital', 'Finance', 'Focuses on dynamic investment opportunities with agile management tactics.', FALSE, 'http://www.dynamiccapital.com'),
('Creative Tech Innovations', 'Technology', 'Delivers creative technological solutions to enhance daily life and business operations.', FALSE, 'http://www.creativetechinnovations.com'),
('Marel', 'Technology', 'Fiskigómar', TRUE, 'http://www.marel.is');
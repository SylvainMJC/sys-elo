-- Insert 25 players
INSERT INTO users (username, email, password, elo, created_at, updated_at) VALUES 
('LiamAnderson', 'liam.anderson@example.com', 'password123', 1200, '2025-01-01', '2025-01-01'),
('OliviaBrown', 'olivia.brown@example.com', 'password123', 1350, '2025-01-01', '2025-01-01'),
('NoahJohnson', 'noah.johnson@example.com', 'password123', 1400, '2025-01-01', '2025-01-01'),
('EmmaJones', 'emma.jones@example.com', 'password123', 1250, '2025-01-01', '2025-01-01'),
('WilliamGarcia', 'william.garcia@example.com', 'password123', 1500, '2025-01-01', '2025-01-01'),
('SophiaMartinez', 'sophia.martinez@example.com', 'password123', 1100, '2025-01-01', '2025-01-01'),
('JamesLee', 'james.lee@example.com', 'password123', 1450, '2025-01-01', '2025-01-01'),
('AvaPerez', 'ava.perez@example.com', 'password123', 1300, '2025-01-01', '2025-01-01'),
('BenjaminHernandez', 'benjamin.hernandez@example.com', 'password123', 1200, '2025-01-01', '2025-01-01'),
('IsabellaMoore', 'isabella.moore@example.com', 'password123', 1250, '2025-01-01', '2025-01-01'),
('LucasWalker', 'lucas.walker@example.com', 'password123', 1500, '2025-01-01', '2025-01-01'),
('MiaWhite', 'mia.white@example.com', 'password123', 1100, '2025-01-01', '2025-01-01'),
('HenryTaylor', 'henry.taylor@example.com', 'password123', 1400, '2025-01-01', '2025-01-01'),
('AmeliaThomas', 'amelia.thomas@example.com', 'password123', 1300, '2025-01-01', '2025-01-01'),
('AlexanderThompson', 'alexander.thompson@example.com', 'password123', 1250, '2025-01-01', '2025-01-01'),
('CharlotteHarris', 'charlotte.harris@example.com', 'password123', 1350, '2025-01-01', '2025-01-01'),
('MichaelMartin', 'michael.martin@example.com', 'password123', 1450, '2025-01-01', '2025-01-01'),
('EvelynClark', 'evelyn.clark@example.com', 'password123', 1400, '2025-01-01', '2025-01-01'),
('EthanRodriguez', 'ethan.rodriguez@example.com', 'password123', 1200, '2025-01-01', '2025-01-01'),
('HarperLewis', 'harper.lewis@example.com', 'password123', 1100, '2025-01-01', '2025-01-01'),
('DanielYoung', 'daniel.young@example.com', 'password123', 1300, '2025-01-01', '2025-01-01'),
('LunaHall', 'luna.hall@example.com', 'password123', 1250, '2025-01-01', '2025-01-01'),
('MatthewAllen', 'matthew.allen@example.com', 'password123', 1450, '2025-01-01', '2025-01-01'),
('ElijahKing', 'elijah.king@example.com', 'password123', 1350, '2025-01-01', '2025-01-01'),
('ScarlettWright', 'scarlett.wright@example.com', 'password123', 1400, '2025-01-01', '2025-01-01');

-- Assign roles to players
INSERT INTO users_roles (id_user, id_role) VALUES 
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1),
(6, 1), (7, 1), (8, 1), (9, 1), (10, 1),
(11, 1), (12, 1), (13, 1), (14, 1), (15, 1),
(16, 1), (17, 1), (18, 1), (19, 1), (20, 1),
(21, 1), (22, 1), (23, 1), (24, 1), (25, 1);

-- Insert 50 viewers
DO $$
DECLARE i INT;
BEGIN
  FOR i IN 26..75 LOOP
    INSERT INTO users (username, email, password, created_at, updated_at) 
    VALUES (
      'Viewer' || i, 
      'viewer' || i || '@example.com', 
      'password123', 
      '2025-01-01', 
      '2025-01-01'
    );
    INSERT INTO users_roles (id_user, id_role) VALUES (i, 2);
  END LOOP;
END $$;

-- Insert 2 admins
INSERT INTO users (username, email, password, created_at, updated_at) VALUES 
('AdminOne', 'admin.one@example.com', 'password123', '2025-01-01', '2025-01-01'),
('AdminTwo', 'admin.two@example.com', 'password123', '2025-01-01', '2025-01-01');

-- Assign roles to admins
INSERT INTO users_roles (id_user, id_role) VALUES 
(76, 3),
(77, 3);

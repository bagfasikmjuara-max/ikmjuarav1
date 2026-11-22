-- Query SQL untuk memperbarui kolom enum role dan menambahkan akun Admin Dukungan default ke database IKM Juara
-- Username: dukungan
-- Password: dukungan123
-- Role: dukungan

ALTER TABLE users MODIFY COLUMN role ENUM('admin', 'superadmin', 'dukungan') DEFAULT 'admin';

INSERT INTO users (name, username, password, role, created_at, updated_at) 
VALUES (
    'Admin Dukungan', 
    'dukungan', 
    '$2y$10$Y1t5o0Vn6QJdGZ0h7R/5eej2E.y4D51S6gP1F91j0n6lF5J.eZ96y', -- Hash bcrypt dari 'dukungan123'
    'dukungan', 
    NOW(), 
    NOW()
);

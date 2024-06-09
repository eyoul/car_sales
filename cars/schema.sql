DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS car;
DROP TABLE IF EXISTS orders;

-- Create 'role' table
CREATE TABLE role (
    role_id INTEGER PRIMARY KEY AUTOINCREMENT,
    role_name TEXT NOT NULL
);
INSERT INTO role (role_name) VALUES ('admin');
INSERT INTO role (role_name) VALUES ('user');

-- Create 'user' table
CREATE TABLE user (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    role_id INTEGER,
    FOREIGN KEY (role_id) REFERENCES role(role_id)
);

-- Create 'car' table
CREATE TABLE car (
    car_id INTEGER PRIMARY KEY AUTOINCREMENT,
    car_type TEXT NOT NULL,
    name TEXT NOT NULL,
    model TEXT NOT NULL,
    year INTEGER NOT NULL,
    fuel_type TEXT NOT NULL,
    km INTEGER NOT NULL,
    transmission TEXT NOT NULL,
    color TEXT NOT NULL,
    price REAL NOT NULL,  
    pic TEXT NOT NULL,
    posted_by INTEGER NOT NULL,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (posted_by) REFERENCES user (id)
);

-- Create 'orders' table
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    car_id INTEGER,
    order_date TEXT NOT NULL,
    messages TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (car_id) REFERENCES car(car_id)
);

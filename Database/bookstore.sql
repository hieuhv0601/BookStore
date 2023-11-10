USE bookstore;

-- User Table
CREATE TABLE Users (
    user_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(255) UNIQUE NOT NULL,
    password NVARCHAR(255) NOT NULL,
    first_name NVARCHAR(255) NOT NULL,
    last_name NVARCHAR(255) NOT NULL,
    email NVARCHAR(255) UNIQUE NOT NULL,
    avatar NVARCHAR(255),
    telephone NVARCHAR(20) UNIQUE NOT NULL,
    created_at DATETIME NOT NULL,
    modified_at DATETIME NOT NULL,
	google_id INT,
    is_banned BIT DEFAULT 0
);

-- UserRole Table
CREATE TABLE UserRoles (
    role_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    [role] NVARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- UserAddress Table
CREATE TABLE UserAddress (
    address_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    street NVARCHAR(255) NOT NULL,
    address_line1 NVARCHAR(255) NOT NULL,
    address_line2 NVARCHAR(255) NOT NULL,
    city NVARCHAR(255) NOT NULL,
    postal_code NVARCHAR(10) NOT NULL,
    country NVARCHAR(255) NOT NULL,
    telephone NVARCHAR(20) NOT NULL,
    is_primary BIT DEFAULT 0,
    state NVARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Category Table
CREATE TABLE Categories (
    category_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    slug NVARCHAR(255) UNIQUE,
    created_at DATETIME NOT NULL,
    modified_at DATETIME NOT NULL,
    parent_category_id INT,
    FOREIGN KEY (parent_category_id) REFERENCES Categories(category_id)
);

-- Book Table
CREATE TABLE Books (
    book_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(255) NOT NULL,
    author NVARCHAR(255) NOT NULL,
    description TEXT,
    slug NVARCHAR(255) NOT NULL,
    isbn NVARCHAR(20) NOT NULL,
    price FLOAT NOT NULL,
    publish_date DATETIME NOT NULL,
    last_update_time DATETIME,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Warehouse Table
CREATE TABLE Warehouse (
    warehouse_id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    book_id INT NOT NULL,
    quantity_in_stock INT NOT NULL,
    quantity_sold INT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- BookImage Table
CREATE TABLE BookImages (
    image_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    book_id INT NOT NULL,
    book_img VARBINARY(MAX) NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Discount Table
CREATE TABLE Discounts (
    discount_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    book_id INT UNIQUE,
    discount_percentage FLOAT NOT NULL,
    active BIT NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    discount_code NVARCHAR(50),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Order Table
CREATE TABLE Orders (
    order_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    order_status NVARCHAR(50) NOT NULL,
    total_amount FLOAT NOT NULL, 
    shipping_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (shipping_id) REFERENCES Shipping(shipping_id) -- Reference to Shipping for shipping address
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    order_detail_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    discount_id INT,
    quantity INT NOT NULL,
    price FLOAT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (discount_id) REFERENCES Discounts(discount_id)
);

-- Review Table
CREATE TABLE Reviews (
    review_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    book_id INT NOT NULL,
    user_id INT NOT NULL,
    rating INT NOT NULL,
    headline NVARCHAR(255),
    [comment] TEXT,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    verified BIT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- ReviewImage Table
CREATE TABLE ReviewImages (
    image_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    review_id INT NOT NULL,
    review_img VARBINARY(MAX) NOT NULL,
    FOREIGN KEY (review_id) REFERENCES Reviews(review_id)
);

-- ShoppingCart Table
CREATE TABLE ShoppingCart (
    cart_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Shipping Table
CREATE TABLE Shipping (
    shipping_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    address_id INT NOT NULL,
    unit_id INT NOT NULL,
    start_date DATETIME NOT NULL,
    expected_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    delivery_status NVARCHAR(50) NOT NULL,
    tracking_number NVARCHAR(50) UNIQUE NOT NULL,
    FOREIGN KEY (address_id) REFERENCES UserAddress(address_id),
    FOREIGN KEY (unit_id) REFERENCES TransportUnit(unit_id)
);

-- TransportUnit Table
CREATE TABLE TransportUnit (
    unit_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    type NVARCHAR(50),
    price FLOAT NOT NULL,
    fast_shipping INT,
    slow_shipping INT,
    created_at DATETIME NOT NULL,
    modified_at DATETIME NOT NULL,
    tracking_number NVARCHAR(50) UNIQUE NOT NULL
);

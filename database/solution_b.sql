-- 1. Liệt kê các hóa đơn của khách hàng, thông tin hiển thị gồm: mã user, tên user, mã hóa đơn
SELECT users.user_id AS 'Mã user', users.user_name AS 'Tên user', orders.order_id AS 'Mã hóa đơn'
FROM users
INNER JOIN orders ON users.user_id = orders.user_id;

-- 2. Liệt kê số lượng các hóa đơn của khách hàng: mã user, tên user, số đơn hàng
SELECT users.user_id AS 'Mã user', users.user_name AS 'Tên user', COUNT(orders.order_id) AS 'Số đơn hàng'
FROM users
INNER JOIN orders ON users.user_id = orders.user_id
GROUP BY users.user_id, users.user_name;

-- 3. Liệt kê thông tin hóa đơn: mã đơn hàng, số sản phẩm
SELECT order_id AS 'Mã đơn hàng', COUNT(product_id) AS 'Số sản phẩm'
FROM order_details
GROUP BY order_id;

-- 4. Liệt kê thông tin mua hàng của người dùng: mã user, tên user, mã đơn hàng, tên sản phẩm. Gôm nhóm theo đơn hàng.
SELECT users.user_id AS 'Mã user', users.user_name AS 'Tên user', orders.order_id AS 'Mã đơn hàng', products.product_name AS 'Tên sản phẩm'
FROM users
INNER JOIN orders ON users.user_id = orders.user_id
INNER JOIN order_details ON orders.order_id = order_details.order_id
INNER JOIN products ON order_details.product_id = products.product_id
GROUP BY users.user_id, users.user_name, orders.order_id, products.product_name;

-- 5. Liệt kê 7 người dùng có số lượng đơn hàng nhiều nhất, thông tin hiển thị gồm: mã user, tên user, số lượng đơn hàng
SELECT users.user_id AS 'Mã user', users.user_name AS 'Tên user', COUNT(orders.order_id) AS 'Số lượng đơn hàng'
FROM users
INNER JOIN orders ON users.user_id = orders.user_id
GROUP BY users.user_id, users.user_name
ORDER BY COUNT(orders.order_id) DESC
LIMIT 7;

-- 6. Liệt kê 7 người dùng mua sản phẩm có tên: Samsung hoặc Apple trong tên sản phẩm, thông tin hiển thị gồm: mã user, tên user, mã đơn hàng, tên sản phẩm
SELECT users.user_id AS 'Mã user', users.user_name AS 'Tên user', orders.order_id AS 'Mã đơn hàng', products.product_name AS 'Tên sản phẩm'
FROM users
INNER JOIN orders ON users.user_id = orders.user_id
INNER JOIN order_details ON orders.order_id = order_details.order_id
INNER JOIN products ON order_details.product_id = products.product_id
WHERE products.product_name LIKE '%Samsung%' OR products.product_name LIKE '%Apple%'
LIMIT 7;

-- 7. Liệt kê danh sách mua hàng của user bao gồm giá tiền của mỗi đơn hàng, thông tin hiển thị gồm: mã user, tên user, mã đơn hàng, tổng tiền
SELECT users.user_id AS 'Mã user', users.user_name AS 'Tên user', orders.order_id AS 'Mã đơn hàng', SUM(products.product_price) AS 'Tổng tiền'
FROM users
INNER JOIN orders ON users.user_id = orders.user_id
INNER JOIN order_details ON orders.order_id = order_details.order_id
INNER JOIN products ON order_details.product_id = products.product_id
GROUP BY users.user_id, users.user_name, orders.order_id;


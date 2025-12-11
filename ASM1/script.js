// ================================================================
//                     DỮ LIỆU SẢN PHẨM GỐC
// ================================================================

// Các mảng sản phẩm theo danh mục
const best1 = [
    { id: 'b1-001', ten: "Áo sơ mi trắng", img: "./img/ao_so_mi (1).jpg", gia: 199000, desc: "Áo sơ mi trắng cơ bản, chất liệu cotton thoáng mát, phù hợp cho môi trường công sở hoặc đi chơi." },
    { id: 'b1-002', ten: "Áo polo xanh", img: "./img/ao (13).png", gia: 149000, desc: "Áo polo màu xanh navy, kiểu dáng trẻ trung, thấm hút mồ hôi tốt." },
    { id: 'b1-003', ten: "Áo thun đen", img: "./img/ao (8).png", gia: 99000, desc: "Áo thun cổ tròn, màu đen basic, dễ dàng phối đồ, chất liệu thun co giãn 4 chiều." },
    { id: 'b1-004', ten: "Sơ mi caro", img: "./img/ao_so_mi (2).webp", gia: 219000, desc: "Sơ mi caro đỏ-đen phong cách cá tính, vải dày dặn, thích hợp cho các buổi dã ngoại." }
];

const best2 = [
    { id: 'b2-001', ten: "Áo sơ mi xanh", img: "./img/ao_so_mi (30).webp", gia: 189000, desc: "Sơ mi xanh da trời lịch lãm, vải không nhăn, kiểu dáng slim fit tôn dáng." },
    { id: 'b2-002', ten: "Áo sơ mi hồng", img: "./img/ao_so_mi (31).webp", gia: 199000, desc: "Sơ mi hồng pastel nhẹ nhàng, tạo vẻ ngoài trẻ trung và tinh tế." },
    { id: 'b2-003', ten: "Áo sơ mi caro", img: "./img/ao_so_mi (32).webp", gia: 209000, desc: "Sơ mi họa tiết caro nhỏ, phong cách Hàn Quốc, chất liệu mềm mại." },
    { id: 'b2-004', ten: "Áo sơ mi đen", img: "./img/ao_so_mi (35).webp", gia: 219000, desc: "Sơ mi đen huyền bí, dễ phối với quần âu hoặc jeans, không bao giờ lỗi mốt." }
];

const best3 = [
    { id: 'b3-001', ten: "Quần tây xám", img: "./img/ao (10).png", gia: 99000, desc: "Quần tây màu xám ghi hiện đại, form đứng, chất liệu vải co giãn nhẹ." },
    { id: 'b3-002', ten: "Quần tây đen", img: "./img/ao (11).png", gia: 149000, desc: "Quần tây đen cổ điển, không nhăn, thích hợp cho mọi dịp trang trọng." },
    { id: 'b3-003', ten: "Quần tây nâu", img: "./img/ao (12).png", gia: 199000, desc: "Quần tây màu nâu đất thời trang, tạo sự khác biệt và ấm áp." },
    { id: 'b3-004', ten: "Quần tây xanh", img: "./img/ao (9).png", gia: 219000, desc: "Quần tây xanh navy lịch lãm, form slim fit, dễ dàng kết hợp với áo sơ mi." }
];

// Gộp tất cả sản phẩm
const ALL_PRODUCTS = [...best1, ...best2, ...best3];

// ================================================================
//                         HÀM HỖ TRỢ NÂNG CAO
// ================================================================

// Lấy sản phẩm theo ID (arrow function + promise)
const getProductById = (productId) => new Promise((resolve, reject) => {
    const product = ALL_PRODUCTS.find(p => p.id === productId);
    product ? resolve(product) : reject(`Không tìm thấy sản phẩm với ID: ${productId}`);
});

// Lấy giỏ hàng từ Local Storage
const getCart = () => JSON.parse(localStorage.getItem('shoppingCart') ?? '[]');

// Lưu giỏ hàng vào Local Storage
const saveCart = cart => localStorage.setItem('shoppingCart', JSON.stringify(cart));

// Lấy size đang chọn
const getSelectedSize = () => document.querySelector('.size-btn.active')?.textContent.trim() ?? null;

// Cập nhật icon giỏ hàng
const updateCartIconQuantity = () => {
    const totalItems = getCart().reduce((sum, { quantity }) => sum + quantity, 0);
    const cartCountElement = document.getElementById('cart-count');
    if (cartCountElement) {
        cartCountElement.textContent = totalItems;
        cartCountElement.style.display = totalItems > 0 ? 'block' : 'none';
    }
};

// ================================================================
//                      GIỎ HÀNG (CÁC HÀM CHÍNH)
// ================================================================

// Thêm sản phẩm vào giỏ hàng, redirectUrl là trang chuyển hướng (callback)
const addToCartHandler = async (redirectUrl = null) => {
    const productId = new URLSearchParams(window.location.search).get('id');
    const productSize = getSelectedSize();

    if (!productId) return alert('Lỗi: Không tìm thấy ID sản phẩm.');
    if (!productSize) return alert('Vui lòng chọn kích cỡ (Size) trước khi thêm vào giỏ hàng.');

    try {
        const product = await getProductById(productId);
        const cart = getCart();
        const existingItem = cart.find(item => item.id === productId && item.size === productSize);

        if (existingItem) existingItem.quantity += 1;
        else cart.push({ id: productId, size: productSize, quantity: 1 });

        saveCart(cart);
        alert(`Đã thêm 1 x ${product.ten} (Size: ${productSize}) vào giỏ hàng!`);
        updateCartIconQuantity();

        // Callback redirect
        if (redirectUrl) window.location.href = redirectUrl;
    } catch (err) {
        console.error(err);
    }
};

// Các hàm sử dụng ngoài HTML
window.addToCart = () => addToCartHandler('cart.html');
window.buyNow = () => addToCartHandler('checkout.html');

// Xóa sản phẩm
window.removeFromCart = (id, size) => {
    const newCart = getCart().filter(item => !(item.id === id && item.size === size));
    saveCart(newCart);
    renderCart();
    updateCartIconQuantity();
};

// Thay đổi số lượng
window.changeQuantity = (id, size, delta) => {
    const cart = getCart();
    const item = cart.find(i => i.id === id && i.size === size);
    if (!item) return;

    const newQuantity = item.quantity + delta;
    newQuantity < 1 ? removeFromCart(id, size) : (item.quantity = newQuantity, saveCart(cart), renderCart());
};

// Cập nhật số lượng từ input
window.updateQuantityInput = (id, size, value) => {
    const cart = getCart();
    const item = cart.find(i => i.id === id && i.size === size);
    const newQuantity = parseInt(value);
    if (!item || isNaN(newQuantity)) return;
    newQuantity < 1 ? removeFromCart(id, size) : (item.quantity = newQuantity, saveCart(cart), renderCart());
};

// ================================================================
//                      HIỂN THỊ DANH SÁCH SẢN PHẨM
// ================================================================

const renderProductGrid = (dataArray, containerSelector) => {
    const grid = document.querySelector(containerSelector);
    if (!grid) return;

    grid.innerHTML = dataArray.map(({ id, ten, img, gia }) => `
        <a href="productdetail.html?id=${id}" class="product-link" style="text-decoration:none; color:inherit;">
            <div class="bestseller-card">
                <div class="bestseller-image-box">
                    <img src="${img}" class="bestseller-img" alt="${ten}">
                </div>
                <div class="bestseller-label">${ten}</div>
                <div class="bestseller-price">${gia.toLocaleString("vi-VN")} đ</div>
            </div>
        </a>
    `).join('');
};

const renderAllGrids = () => {
    renderProductGrid(ALL_PRODUCTS.filter(p => p.id.startsWith('b1')), ".bestseller-grid");
    renderProductGrid(ALL_PRODUCTS.filter(p => p.id.startsWith('b2')), ".bestseller-grid.best2");
    renderProductGrid(ALL_PRODUCTS.filter(p => p.id.startsWith('b3')), ".bestseller-grid.best3");
};

// ================================================================
//                      PRODUCT DETAIL
// ================================================================

const loadProductDetail = async () => {
    const productId = new URLSearchParams(window.location.search).get('id');
    if (!productId) return;

    try {
        const product = await getProductById(productId);
        const { ten, id, gia, desc, img } = product;

        document.querySelector('.product-info h1').textContent = ten;
        document.querySelector('.product-code').textContent = `Mã Sản Phẩm: ${id}`;
        document.querySelector('.price').textContent = `${gia.toLocaleString("vi-VN")} đ`;
        document.getElementById('product-description').textContent = desc;

        const mainImage = document.getElementById('mainImage');
        if (mainImage) mainImage.src = img;

        const breadcrumb = document.getElementById('product-name-breadcrumb');
        if (breadcrumb) breadcrumb.textContent = ten;
    } catch (err) {
        console.error(err);
        document.querySelector('.product-info h1').textContent = `Lỗi: Không tìm thấy sản phẩm`;
    }
};

// Chọn size (hàm ẩn danh)
window.selectSize = el => {
    document.querySelectorAll('.size-btn').forEach(btn => btn.classList.remove('active'));
    el.classList.add('active');
};

// Thay ảnh thumbnail
window.changeImage = el => {
    const mainImage = document.getElementById('mainImage');
    const thumbImg = el.querySelector('img');
    document.querySelectorAll('.thumbnail').forEach(t => t.classList.remove('active'));
    if (mainImage && thumbImg) mainImage.src = thumbImg.src;
    el.classList.add('active');
};

// ================================================================
//                          GIỎ HÀNG TRÊN CART.HTML
// ================================================================

const renderCart = () => {
    const cart = getCart();
    const cartBody = document.querySelector('.cart-table tbody');
    const totalItemsSpan = document.getElementById('totalItems');
    const grandTotalSpan = document.getElementById('grandTotal');
    if (!cartBody) return;

    let totalItems = 0, grandTotal = 0;
    const cartHTML = cart.map(item => {
        const product = ALL_PRODUCTS.find(p => p.id === item.id);
        if (!product) return '';

        const itemTotal = product.gia * item.quantity;
        totalItems += item.quantity;
        grandTotal += itemTotal;

        return `
            <tr data-product-id="${item.id}" data-product-size="${item.size}">
                <td class="product-col">
                    <img src="${product.img}" alt="${product.ten}" style="width: 50px;">
                    <div class="product-details">
                        <span class="product-name">${product.ten}</span>
                        <span class="product-size">Size: ${item.size}</span>
                        <button class="btn-remove" onclick="removeFromCart('${item.id}', '${item.size}')">Xóa</button>
                    </div>
                </td>
                <td>
                    <div class="quantity-control">
                        <button onclick="changeQuantity('${item.id}', '${item.size}', -1)">-</button>
                        <input type="number" value="${item.quantity}" min="1" onchange="updateQuantityInput('${item.id}', '${item.size}', this.value)">
                        <button onclick="changeQuantity('${item.id}', '${item.size}', 1)">+</button>
                    </div>
                </td>
                <td class="unit-price">${product.gia.toLocaleString('vi-VN')}đ</td>
                <td class="item-total">${itemTotal.toLocaleString('vi-VN')}đ</td>
            </tr>
        `;
    }).join('');

    cartBody.innerHTML = cart.length ? cartHTML : '<tr><td colspan="4" style="text-align: center;">Giỏ hàng trống.</td></tr>';
    if (totalItemsSpan) totalItemsSpan.textContent = totalItems;
    if (grandTotalSpan) grandTotalSpan.textContent = grandTotal.toLocaleString('vi-VN') + 'đ';
};

// ================================================================
//                        CHECKOUT
// ================================================================

const renderCheckoutCart = () => {
    const cart = getCart();
    const orderSummary = document.querySelector('.order-summary');
    if (!orderSummary) return;

    const container = orderSummary.querySelector('.product-item')?.parentNode;
    if (!container) return;

    let subtotal = 0;
    const html = cart.map(item => {
        const product = ALL_PRODUCTS.find(p => p.id === item.id);
        if (!product) return '';
        const itemTotal = product.gia * item.quantity;
        subtotal += itemTotal;

        return `
            <div class="product-item">
                <img src="${product.img}" alt="${product.ten}" class="product-image">
                <div class="product-details">
                    <div class="product-name">${product.ten}</div>
                    <div class="product-specs">Size: ${item.size}, Mã: ${product.id}</div>
                    <div class="product-price">
                        <span class="price-label">Giá: <span class="price-value">${product.gia.toLocaleString('vi-VN')} vnđ</span></span>
                        <span class="price-label">Số lượng: <span class="quantity-value">${item.quantity}</span></span>
                    </div>
                </div>
            </div>
        `;
    }).join('') || '<p>Giỏ hàng trống.</p>';

    container.insertAdjacentHTML('afterbegin', html);

    const shippingFee = 30000;
    const discount = 20000;
    const total = subtotal + shippingFee - discount;

    const [subtotalEl, shippingEl] = orderSummary.querySelectorAll('.summary-line .summary-value');
    const discountEl = orderSummary.querySelector('.summary-line .discount-value');
    const totalEl = orderSummary.querySelector('.total-line span:last-child');

    if (subtotalEl) subtotalEl.textContent = subtotal.toLocaleString('vi-VN') + ' vnđ';
    if (shippingEl) shippingEl.textContent = shippingFee.toLocaleString('vi-VN') + ' vnđ';
    if (discountEl) discountEl.textContent = discount.toLocaleString('vi-VN') + ' vnđ';
    if (totalEl) totalEl.textContent = total.toLocaleString('vi-VN') + ' vnđ';
};

// Đặt hàng
window.placeOrder = () => {
    const cart = getCart();
    if (!cart.length) return alert('Giỏ hàng trống!');

    const name = document.querySelector('input[placeholder="Họ và tên"]')?.value.trim();
    const email = document.querySelector('input[type="email"]')?.value.trim();
    const phone = document.querySelector('input[type="tel"]')?.value.trim();
    const address = document.querySelector('input[placeholder*="Tỉnh"]')?.value.trim();
    const note = document.querySelector('textarea')?.value.trim();
    const paymentMethod = document.querySelector('input[name="payment"]:checked')?.value;

    if (!name || !email || !phone || !address) return alert('Vui lòng điền đầy đủ thông tin giao hàng!');

    let subtotal = 0;
    cart.forEach(item => {
        const product = ALL_PRODUCTS.find(p => p.id === item.id);
        if (product) subtotal += product.gia * item.quantity;
    });

    const shippingFee = 30000;
    const discount = 130000;
    const total = subtotal + shippingFee - discount;

    const order = { customer: { name, email, phone, address, note }, paymentMethod, cart, subtotal, shippingFee, discount, total, date: new Date().toLocaleString() };

    console.log('Đơn hàng:', order);
    alert(`Đặt hàng thành công! Tổng cộng: ${total.toLocaleString('vi-VN')} vnđ`);

    localStorage.removeItem('shoppingCart');
    window.location.href = 'index.html';
};

// ================================================================
//                        KHỞI TẠO CHUNG
// ================================================================
document.addEventListener('DOMContentLoaded', () => {
    if (document.querySelector('.bestseller-grid')) renderAllGrids();
    if (document.querySelector('.product-info')) loadProductDetail();
    if (document.querySelector('.cart-table')) renderCart();
    if (document.querySelector('.order-summary')) renderCheckoutCart();
    updateCartIconQuantity();
});

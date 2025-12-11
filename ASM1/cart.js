// // cart.js
// import { getProductById } from './products.js';

// // Lấy giỏ hàng từ localStorage
// export const getCart = () => JSON.parse(localStorage.getItem('shoppingCart') ?? '[]');

// // Lưu giỏ hàng
// export const saveCart = (cart) => localStorage.setItem('shoppingCart', JSON.stringify(cart));

// // Thêm sản phẩm vào giỏ
// export const addToCart = async ({ id, size, quantity = 1 }) => {
//     const product = await getProductById(id);
//     if (!product) throw new Error('Sản phẩm không tồn tại');

//     const cart = getCart();
//     const existItem = cart.find(item => item.id === id && item.size === size);

//     if (existItem) existItem.quantity += quantity;
//     else cart.push({ id, size, quantity });

//     saveCart(cart);
//     return cart;
// };

// // Xóa sản phẩm
// export const removeFromCart = ({ id, size }) => {
//     const cart = getCart().filter(item => !(item.id === id && item.size === size));
//     saveCart(cart);
//     return cart;
// };

// // Thay đổi số lượng
// export const changeQuantity = ({ id, size, delta }) => {
//     const cart = getCart();
//     const item = cart.find(i => i.id === id && i.size === size);
//     if (!item) return cart;

//     item.quantity += delta;
//     if (item.quantity < 1) return removeFromCart({ id, size });

//     saveCart(cart);
//     return cart;
// };

// // Tính tổng tiền
// export const calculateTotal = async () => {
//     const cart = getCart();
//     let total = 0;
//     for (let item of cart) {
//         const product = await getProductById(item.id);
//         total += product.gia * item.quantity;
//     }
//     return total;
// };

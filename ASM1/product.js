// // products.js
// export const ALL_PRODUCTS = [
//     { id: 'b1-001', ten: "Áo sơ mi trắng", img: "./img/ao_so_mi (1).jpg", gia: 199000, desc: "Áo sơ mi trắng cơ bản, chất liệu cotton thoáng mát." },
//     { id: 'b1-002', ten: "Áo polo xanh", img: "./img/ao (13).png", gia: 149000, desc: "Áo polo màu xanh navy, kiểu dáng trẻ trung." },
//     { id: 'b1-003', ten: "Áo thun đen", img: "./img/ao (8).png", gia: 99000, desc: "Áo thun cổ tròn, màu đen basic." },
//     { id: 'b1-004', ten: "Sơ mi caro", img: "./img/ao_so_mi (2).webp", gia: 219000, desc: "Sơ mi caro đỏ-đen phong cách cá tính." }
// ];

// // Hàm async giả lập API fetch
// export const fetchProducts = async () => {
//     return new Promise((resolve, reject) => {
//         setTimeout(() => resolve(ALL_PRODUCTS), 500);
//     });
// };

// // Tìm sản phẩm theo ID
// export const getProductById = async (id) => {
//     const products = await fetchProducts();
//     return products.find(p => p.id === id);
// };

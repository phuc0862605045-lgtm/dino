// import { fetchProducts } from './products.js';

// // Render products vào từng grid theo ID prefix
// const renderProductGrid = async (products, containerSelector) => {
//     const container = document.querySelector(containerSelector);
//     if (!container) return;

//     container.innerHTML = products.map(p => `
//         <a href="productdetail.html?id=${p.id}" class="product-link" style="text-decoration:none; color:inherit;">
//             <div class="bestseller-card">
//                 <div class="bestseller-image-box">
//                     <img src="${p.img}" class="bestseller-img" alt="${p.ten}">
//                 </div>
//                 <div class="bestseller-label">${p.ten}</div>
//                 <div class="bestseller-price">${p.gia.toLocaleString("vi-VN")} đ</div>
//             </div>
//         </a>
//     `).join('');
// };

// export const renderAllGrids = async () => {
//     const allProducts = await fetchProducts();

//     renderProductGrid(allProducts.filter(p => p.id.startsWith('b1')), '.bestseller-grid');
//     renderProductGrid(allProducts.filter(p => p.id.startsWith('b2')), '.bestseller-grid.best2');
//     renderProductGrid(allProducts.filter(p => p.id.startsWith('b3')), '.bestseller-grid.best3');
// };

// // DOMContentLoaded
// document.addEventListener('DOMContentLoaded', () => {
//     renderAllGrids();
// });

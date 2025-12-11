// Lấy danh sách từ localStorage
function getProducts() { return JSON.parse(localStorage.getItem("allProducts")) || []; }
function getCategories() { return JSON.parse(localStorage.getItem("allCategories")) || []; }

// Render danh mục
function renderCategories() {
    const ul = document.getElementById("categoryList");
    const categories = getCategories();
    ul.innerHTML = categories.map(c => `<li data-id="${c.id}">${c.name}</li>`).join('');

    document.querySelectorAll("#categoryList li").forEach(li=>{
        li.addEventListener("click", ()=>{
            const catId = li.dataset.id;
            renderProducts(catId);
        });
    });
}

// Render sản phẩm
function renderProducts(categoryId = null) {
    const grid = document.querySelector(".products-grid");
    let products = getProducts();
    if(categoryId) products = products.filter(p=>p.category === categoryId);
    grid.innerHTML = products.map(p=>`
        <div class="product-card">
            <img src="${p.img}" alt="${p.ten}">
            <div>${p.ten}</div>
            <div>${p.gia.toLocaleString()} đ</div>
        </div>
    `).join('');
}

// Khởi tạo
renderCategories();
renderProducts();

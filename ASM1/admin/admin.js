// ===== Sản phẩm mặc định =====
const defaultProducts = [
    { id: 'p001', ten: "Áo sơ mi trắng", img: "./img/ao_so_mi (1).jpg", gia: 199000, desc: "Áo sơ mi trắng cơ bản", category: "a" },
    { id: 'p002', ten: "Quần tây đen", img: "./img/ao (11).png", gia: 149000, desc: "Quần tây đen", category: "b" },
    { id: 'p003', ten: "Mũ nón thời trang", img: "./img/mu.png", gia: 99000, desc: "Phụ kiện nón", category: "c" }
];

// ===== Danh mục mặc định =====
const defaultCategories = [
    { id: 'a', name: "Áo" },
    { id: 'b', name: "Quần" },
    { id: 'c', name: "Phụ kiện" }
];

// ===== LocalStorage key =====
const PRODUCTS_KEY = "allProducts";
const CATEGORIES_KEY = "allCategories";

// ===== Khởi tạo =====
function initStorage() {
    if (!localStorage.getItem(PRODUCTS_KEY)) localStorage.setItem(PRODUCTS_KEY, JSON.stringify(defaultProducts));
    if (!localStorage.getItem(CATEGORIES_KEY)) localStorage.setItem(CATEGORIES_KEY, JSON.stringify(defaultCategories));
}

// ===== Lấy danh sách =====
function getProducts() { return JSON.parse(localStorage.getItem(PRODUCTS_KEY)) || []; }
function getCategories() { return JSON.parse(localStorage.getItem(CATEGORIES_KEY)) || []; }

// ===== Lưu danh sách =====
function saveProducts(products) { localStorage.setItem(PRODUCTS_KEY, JSON.stringify(products)); }
function saveCategories(categories) { localStorage.setItem(CATEGORIES_KEY, JSON.stringify(categories)); }

// ===== Render sản phẩm =====
function renderProducts() {
    const list = document.getElementById("productList");
    const products = getProducts();
    list.innerHTML = products.map(p => `
        <div class="product-card">
            <img src="${p.img}" alt="${p.ten}">
            <div class="product-name">${p.ten}</div>
            <div class="product-price">${p.gia.toLocaleString()} đ</div>
            <button onclick="editProduct('${p.id}')">Sửa</button>
            <button onclick="deleteProduct('${p.id}')">Xóa</button>
        </div>
    `).join('');
}

// ===== Render danh mục =====
function renderCategories() {
    const ul = document.getElementById("categoryList");
    const categories = getCategories();
    ul.innerHTML = categories.map(c => `
        <li>
            ${c.name}
            <span>
                <button onclick="editCategory('${c.id}')">Sửa</button>
                <button onclick="deleteCategory('${c.id}')">Xóa</button>
            </span>
        </li>
    `).join('');
}

// ===== Thêm / Sửa sản phẩm =====
document.getElementById("productForm").addEventListener("submit", function(e){
    e.preventDefault();
    const idField = document.getElementById("productId");
    const name = document.getElementById("productName").value;
    const price = Number(document.getElementById("productPrice").value);
    const category = document.getElementById("productCategory").value;
    const desc = document.getElementById("productDesc").value;
    const imgFile = document.getElementById("productImg").files[0];

    const reader = new FileReader();
    reader.onload = function(){
        const imgSrc = imgFile ? reader.result : null;
        const products = getProducts();

        if (idField.value) {
            // Sửa
            const index = products.findIndex(p => p.id === idField.value);
            if (index !== -1) {
                products[index] = {
                    ...products[index],
                    ten: name,
                    gia: price,
                    category,
                    desc,
                    img: imgSrc || products[index].img
                };
            }
        } else {
            // Thêm
            products.push({
                id: "p" + Date.now(),
                ten: name,
                gia: price,
                category,
                desc,
                img: imgSrc
            });
        }

        saveProducts(products);
        renderProducts();
        document.getElementById("productForm").reset();
        idField.value = "";
    }

    if (imgFile) reader.readAsDataURL(imgFile);
    else reader.onload(); // Nếu sửa mà không đổi ảnh
});

// ===== CRUD sản phẩm =====
function deleteProduct(id){
    let products = getProducts();
    products = products.filter(p => p.id !== id);
    saveProducts(products);
    renderProducts();
}

function editProduct(id){
    const products = getProducts();
    const p = products.find(p => p.id === id);
    if (!p) return;
    document.getElementById("productId").value = p.id;
    document.getElementById("productName").value = p.ten;
    document.getElementById("productPrice").value = p.gia;
    document.getElementById("productCategory").value = p.category;
    document.getElementById("productDesc").value = p.desc;
}

// ===== CRUD danh mục =====
document.getElementById("categoryForm").addEventListener("submit", function(e){
    e.preventDefault();
    const idField = document.getElementById("categoryId");
    const name = document.getElementById("categoryName").value;
    const categories = getCategories();

    if (idField.value) {
        const index = categories.findIndex(c => c.id === idField.value);
        if(index !== -1){
            categories[index].name = name;
        }
    } else {
        const newId = "c" + Date.now();
        categories.push({id: newId, name});
    }

    saveCategories(categories);
    renderCategories();
    document.getElementById("categoryForm").reset();
    idField.value = "";
});

function deleteCategory(id){
    let categories = getCategories();
    categories = categories.filter(c => c.id !== id);
    saveCategories(categories);
    renderCategories();
}

function editCategory(id){
    const categories = getCategories();
    const c = categories.find(c => c.id === id);
    if(!c) return;
    document.getElementById("categoryId").value = c.id;
    document.getElementById("categoryName").value = c.name;
}

// ===== Khởi tạo =====
initStorage();
renderProducts();
renderCategories();

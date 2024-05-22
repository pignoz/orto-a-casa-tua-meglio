document.addEventListener('DOMContentLoaded', function () {
    const products = Array.from(document.querySelectorAll('.product'));
    const productList = document.getElementById('productList');
    const prevButton = document.getElementById('prevButton');
    const nextButton = document.getElementById('nextButton');
    const searchButton = document.getElementById('searchButton');
    const searchInput = document.getElementById('searchInput');
    const filterSelect = document.getElementById('filterSelect');

    let currentPage = 0;
    const productsPerPage = 4;
    let filteredProducts = products;

    function showPage(page, productsArray) {
        const start = page * productsPerPage;
        const end = start + productsPerPage;

        productList.innerHTML = '';
        productsArray.slice(start, end).forEach(product => {
            productList.appendChild(product);
        });

        prevButton.disabled = page === 0;
        nextButton.disabled = end >= productsArray.length;
    }

    function filterProducts() {
        const searchTerm = searchInput.value.toLowerCase();
        const filterValue = filterSelect.value;

        filteredProducts = products.filter(product => {
            const matchesSearch = product.querySelector('h2').textContent.toLowerCase().includes(searchTerm);
            const matchesFilter = filterValue === 'tutti' || product.querySelector('p:last-child').textContent.includes(filterValue);
            return matchesSearch && matchesFilter;
        });

        currentPage = 0;
        showPage(currentPage, filteredProducts);
    }

    searchButton.addEventListener('click', filterProducts);
    filterSelect.addEventListener('change', filterProducts);

    prevButton.addEventListener('click', function () {
        if (currentPage > 0) {
            currentPage--;
            showPage(currentPage, filteredProducts);
        }
    });

    nextButton.addEventListener('click', function () {
        if ((currentPage + 1) * productsPerPage < filteredProducts.length) {
            currentPage++;
            showPage(currentPage, filteredProducts);
        }
    });

    // Initialize the product list
    showPage(currentPage, filteredProducts);
});

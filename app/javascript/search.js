const searchForm = document.getElementById("search-form");
const resultsContainer = document.getElementById("results");
const loader = document.getElementById("loader");

function debounce(func, timeout = 300){
    let timer;
    return (...args) => {
      clearTimeout(timer);
      timer = setTimeout(() => { func.apply(this, args); }, timeout);
    };
}

function search() {
    const value = searchForm.search.value;
    if(value) {
        loader.classList.remove("hidden");
        fetch(`/search?search_term=${value}`)
            .then(res => res.text())
            .then(res => {
                loader.classList.add("hidden");
                resultsContainer.innerHTML = res;
            });
    }
}

searchForm.search.addEventListener("keyup", debounce(search));
searchForm.addEventListener("submit", e => {
    e.preventDefault();
    search();
});
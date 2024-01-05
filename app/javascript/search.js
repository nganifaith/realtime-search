const searchForm = document.getElementById("search-form");
const resultsContainer = document.getElementById("results");

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
        fetch(`/search?search_term=${value}`)
        .then(res => res.text())
        .then(res => {
            resultsContainer.innerHTML = res;
        });
    }
}

searchForm.search.addEventListener("keyup", debounce(search));
searchForm.addEventListener("submit", e => {
    e.preventDefault();
    search();
});
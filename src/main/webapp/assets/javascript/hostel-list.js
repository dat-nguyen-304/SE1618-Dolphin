const favoriteHostels = document.querySelectorAll('.hostel-favorite');

favoriteHostels.forEach(favoriteHostel => {
    favoriteHostel.onclick = (e) => {
        e.target.classList.toggle('active');
        if (e.target.classList.contains("active"))
            e.target.innerHTML = "Bỏ lưu";
        else
            e.target.innerHTML = "Lưu";
        e.target.blur();
        document.activeElement.blur();
        console.log(e.target);
        e.preventDefault();
    };
});
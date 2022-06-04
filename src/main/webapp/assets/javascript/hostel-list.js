const favoriteHostels = document.querySelectorAll('.hostel-favorite');

favoriteHostels.forEach(favoriteHostel => {
    favoriteHostel.onclick = (e) => {
        e.target.classList.toggle('active');
        e.preventDefault();
    }
});
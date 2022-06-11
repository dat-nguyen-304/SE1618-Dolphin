const starList = document.querySelectorAll('.send-feedback-star');

starList.forEach((star, index) => {
    star.onclick = (e) => {
        getColorForStar(index);
        e.target.style.color = 'orange';
        document.querySelector('input[name="rating"]').value = index + 1;
    }
})


const getColorForStar = (starNum) => {
    starList.forEach((star, index) => {
        if (index < starNum) {
            star.querySelector('i').style.color = 'orange';
        } else star.querySelector('i').style.color = '#ccc';
    })
}


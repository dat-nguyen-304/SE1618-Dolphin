const inputRating = document.querySelector('input[name="rating"]');
const starList = document.querySelectorAll('.send-feedback-star');
const sendFeedbackBtn = document.querySelector('.send-feedback-btn');
const updateFeedbackBtn = document.querySelector('.update-feedback-btn');
const textarea = document.querySelector('.text-area');
const sendFeedbackMess = document.querySelector('.send-feedback-mess');

const getColorForStar = (starNum) => {
    starList.forEach((star, index) => {
        if (index <= starNum) {
            star.querySelector('i').style.color = 'orange';
        } else star.querySelector('i').style.color = '#ccc';
    });
};

getColorForStar(inputRating.value - 1);
sendFeedbackBtn.onclick = (e) => {
    if (inputRating.value === "0") {
        sendFeedbackMess.style.display = 'inline-block';
        e.preventDefault();
    }
};


if (updateFeedbackBtn) {
    updateFeedbackBtn.onclick = (e) => {
        e.preventDefault();
        textarea.disabled = false;
        e.target.style.display = 'none';
    };
};

starList.forEach((star, index) => {
    star.onclick = (e) => {
        getColorForStar(index);
        inputRating.value = index + 1;
        sendFeedbackMess.style.display = 'none';
    };
});

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);
const modal = $('.modaL');
if (modal) {
    const modalTicket = $('.modal-ticket');
    const modalClose = $('.modal-close-btn');
    if (modalTicket) {
        modalTicket.onclick = (e) => e.stopPropagation();
    }
    function hideModal() {
        modal.style.display = 'none';
    }
    modalClose.addEventListener('click', hideModal);
    modal.addEventListener('click', hideModal);
    console.log(modalClose);
    console.log(modal);
}


const inputRating = document.querySelector('input[name="rating"]');
const starList = document.querySelectorAll('.send-feedback-star');
const sendFeedbackBtn = document.querySelector('.send-feedback-btn');
const updateFeedbackBtn = document.querySelector('.update-feedback-btn');
const textarea = document.querySelector('.text-area');
const sendFeedbackMess = document.querySelector('.send-feedback-mess');
console.log(updateFeedbackBtn);
const getColorForStar = (starNum) => {
    starList.forEach((star, index) => {
        if (index <= starNum) {
            star.querySelector('i').style.color = 'orange';
        } else
            star.querySelector('i').style.color = '#ccc';
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
}
;

starList.forEach((star, index) => {
    star.onclick = (e) => {
        console.log(star);
        getColorForStar(index);
        inputRating.value = index + 1;
        sendFeedbackMess.style.display = 'none';
    };
});
ClassicEditor.create(document.querySelector('#editor'), {
    toolbar: ['heading', '|', 'bold', 'italic', 'bulletedList', 'numberedList']
}).catch(error => {
    console.log(error);
});
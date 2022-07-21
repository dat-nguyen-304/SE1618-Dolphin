function removeAscent(str) {
    if (str === null || str === undefined)
        return str;
    str = str.toLowerCase();
    str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
    str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
    str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
    str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
    str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
    str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
    str = str.replace(/đ/g, "d");
    return str;
}
function isValid(string, type) {
    var re;
    if (type === 'address')
        re = /^[a-zA-Z0-9\s/,.-]{1,}$/g // regex here
    if (type === 'name')
        re = /^[a-zA-Z0-9\s]{1,}$/g
    if (type === 'human')
        re = /^[a-zA-Z\s]{1,}$/g
    if (type === 'phone')
        re = /^[0-9]{10}$/g
    return re.test(removeAscent(string));
}
const data = {
    labels: [
        'Rate',
        'All'
    ],
    datasets: [{
            label: 'Trung bình đánh giá',
            data: [4.7, 5 - 4.7],
            backgroundColor: [
                '#17535B',
                '#C1C1C1'
            ],
        }]
};

const config = {
    type: 'doughnut',
    data: data,
    clip: {left: 5, top: false, right: -2, bottom: 0},
    options: {
        scales: {
        }
    }
};

// =================

var ctx = document.getElementById('myChart');
const myChart = new Chart(
        ctx,
        config
        );


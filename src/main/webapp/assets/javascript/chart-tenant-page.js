const data = {
    labels: ['01/2022', '02/2022', '03/2022', '04/2022', '05/2022', '06/2022', '07/2022'],
    datasets: [{
            label: 'Nước',
            data: [65, 59, 80, 81, 56, 55, 40],
            backgroundColor: [
                '#288D87'
            ]
        }, {
            label: 'Điện',
            data: [120, 104, 80, 106, 110, 96, 115],
            backgroundColor: [
                '#17535B'
            ]
        }]
};

const config = {
    type: 'bar',
    data: data,
    options: {
        scales: {
            y: {
                beginAtZero: true,
                grid: {
                    color: ''
                }
            },
            x: {
                grid: {
                    color: '#EEF0F1'
                },
                ticks: {
                    color: '#40576C'
                }
            }
        }
    }
};

// =================

var ctx = document.getElementById('myChart');
const myChart = new Chart(
        ctx,
        config
        );


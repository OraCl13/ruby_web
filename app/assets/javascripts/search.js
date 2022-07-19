$(document).ready(function () {
    $(".search_form").submit(function () {
        let start_station;
        let end_station;

        start_station = $(this).find('#start_station')
        end_station = $(this).find('#end_station')

        if (start_station.val() === end_station.val()){
            alert('Choose end station')
            return false
        }
    })
})
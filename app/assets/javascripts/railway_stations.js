$(document).ready(function () {
    $("a.edit_station").click(function (e) {
        e.preventDefault();
        let station_id;
        let form;
        let title;

        station_id = $(this).data('stationId');
        form = $('#edit_railway_station_' + station_id);
        title = $('#railway_station_title_'+ station_id);

        if (!$(this).hasClass('cancel')){
            $(this).html('Cancel');
            $(this).addClass('cancel');
        }else{
            $(this).html('Edit');
            $(this).removeClass('cancel');
        }

        form.toggle();
        title.toggle();
    });
});
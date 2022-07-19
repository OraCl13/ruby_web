$(document).ready(function () {
    $('.seats').hide();
    show_van_seats('CoupeVan')

    $('#van_type').on('change', function (e) {
        $('.seats').hide();
        show_van_seats(e.target.value);
    });

    function show_van_seats(type) {
        switch (type) {
            case 'CoupeVan':
                $('.top_seats').show();
                $('.bottom_seats').show();
                break;
            case 'SvVan':
                $('.bottom_seats').show();
                break;
            case 'PlacVan':
                $('.top_seats').show();
                $('.bottom_seats').show();
                $('.side_top_seats').show();
                $('.side_bottom_seats').show();
                break;
            case 'SeatVan':
                $('.econom_seats').show();
                break;
        }
    };
});
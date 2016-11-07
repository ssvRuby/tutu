$(document).ready(function () {

    $('.edit-route-name').click(function (e) {

        e.preventDefault();

        var route_id = $(this).data('routeId');
        var form  = $('#edit_route_' + route_id);
        var title = $('#route_title_'+ route_id);

        if (!$(this).hasClass('cancel')) {
            form.show();
            title.hide();

            $(this).html('Отменить');
            $(this).addClass('cancel');
        }
        else {
            form.hide();
            title.show();

            $(this).html('Редактировать');
            $(this).removeClass('cancel');
        }

    })

});
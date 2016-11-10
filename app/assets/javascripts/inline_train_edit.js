$(document).ready(function () {

    $('.edit-train-number').click(function (e) {

        e.preventDefault();

        var train_id = $(this).data('trainId');
        var form  = $('#edit_train_' + train_id);
        var title = $('#train_title_'+ train_id);

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
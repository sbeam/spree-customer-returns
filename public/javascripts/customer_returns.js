
$( function() {

            $('#order_details td.rma_check input').bind('click', function() {
                if (this.checked) $(this).parents('tr').next().find('div.fields').slideDown('fast');
                else $(this).parents('tr').next().find('div.fields').slideUp('fast');
            });
} );

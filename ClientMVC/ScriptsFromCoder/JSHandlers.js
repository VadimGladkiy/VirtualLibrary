    $(document).ready(function ()
    {
        $('#AuthorizeSubmit').on('click', function () {
            $('#AuthorizeForm').css('display', 'none');
            $('.allowedUser').css('display', 'block');
            $('.allowedUser a').on('click', function ()
            {
                var $parent = $(this).parent();
                $parent.find('a').remove();
                $parent.append("<span style=" + "color:red " + ">item is required to get</span>");
            });
        });
        function formSpecialRequest(book_id)
        {
            alert('SP request');
            var customer = $('#customer_id').val();
            var request = "/Customer/takeABook/"+ book_id +'/' + customer;
            return request;
        }

    });
    


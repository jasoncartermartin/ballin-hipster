# $.rails.allowAction = (element) ->
#   # The message is something like "Are you sure?"
#   message = element.data('confirm')
#   form = element.parents('form:first')
#   $form = $(form)
#   # If there's no message, there's no data-confirm attribute,
#   # which means there's nothing to confirm
#   return true unless message
#   # Clone the clicked element (probably a delete link
#   $link = element.clone()
#     # We don't necessarily want the same styling as the original link/button.
#     .removeAttr('class')
#     # We don't want to pop up another confirmation (recursion)
#     .removeAttr('data-confirm')
#     # We want a button
#     .addClass('btn').addClass('btn-danger')
#     # We want it to sound confirmy
#     .html("Confirm")

#   # If the button is attached to a form submit, make sure the modal has context.
#   # Commenting out - Breaks the delete button on forms
#   #if form
#   #  $link.click ->
#   #    $form.submit()

#     # Create the modal box with the message
#   modal_html = """
#              <div class="modal" id="myModal">
#                <div class="modal-header">
#                  <a class="close" data-dismiss="modal">×</a>
#                  <h3>Are you sure?</h3>
#                </div>
#                <div class="modal-body">
#                  <p>#{message}</p>
#                </div>
#                <div class="modal-footer">
#                  <a data-dismiss="modal" class="btn">Cancel</a>
#                </div>
#              </div>
#              """
#   $modal_html = $(modal_html)
#   # Add the new button to the modal box
#   $modal_html.find('.modal-footer').append($link)
#   # Pop it up
#   $modal_html.modal()
#   # Prevent the original link from working

#   return false

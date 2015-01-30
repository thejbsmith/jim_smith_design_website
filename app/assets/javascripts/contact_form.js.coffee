$ ->
  $("#contact-form").submit ->
    buttonWidth = $("#contact-form button").width()
    buttonCopy = $("#contact-form button").html()
    errorMessage = $("#contact-form button").data("error-message")
    sendingMessage = $("#contact-form button").data("sending-message")
    okMessage = $("#contact-form button").data("ok-message")
    hasError = false
    $("#contact-form button").width buttonWidth
    $("#contact-form .error-message").remove()
    $(".required").each ->
      if $.trim($(@).val()) is ""
        errorText = $(@).data("error-empty")
        $(@).parents(".field-wrap").append("<span class=\"error-message\" style=\"display:none;\">" + errorText + ".</span>").find(".error-message").fadeIn "fast"
        $(@).addClass "inputError"
        hasError = true
      else if $(@).is("input[type='email']") or $(@).attr("name") is "email"
        emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/
        unless emailReg.test($.trim($(@).val()))
          invalidEmail = $(@).data("error-invalid")
          $(@).parents(".field-wrap").append("<span class=\"error-message\" style=\"display:none;\">" + invalidEmail + ".</span>").find(".error-message").fadeIn "fast"
          $(@).addClass "inputError"
          hasError = true

    if hasError
      $("#contact-form button").html "<i class=\"fa fa-times\"></i>" + errorMessage
      setTimeout (->
        $("#contact-form button").html buttonCopy
        $("#contact-form button").width "auto"
      ), 2000
    else
      $("#contact-form button").html "<i class=\"fa fa-spinner fa-spin\"></i>" + sendingMessage
      formInput = $(@).serialize()
      $.post $(@).attr("action"), formInput, (data) ->
        console.log(data)
        $("#contact-form button").html "<i class=\"fa fa-check\"></i>" + okMessage
        $("#contact-form")[0].reset()
        # setTimeout (->
        #   $("#contact-form button").html buttonCopy
        #   $("#contact-form button").width "auto"
        # ), 2000

    false

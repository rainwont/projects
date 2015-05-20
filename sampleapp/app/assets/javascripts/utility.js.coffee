$(document).ready ->
  change_expired_at = ->
    if $("#article_no_expriration").attr("checked")
      $("#article_expriration_at").hide()
    else
      $("#article_expriration_at").show()

      $("#article_no_expriration").bind("click", change_expired_at)
      change_expired_at()

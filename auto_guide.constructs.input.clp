
; Rules
(defrule ask-question
    ?q <- (question (question-to-ask ?question)
    (factor ?factor)
    (has-pre-condition no))
    (not (answer (known-factor ?factor)))
  =>
    (printout t ?question crlf)
    (assert (answer (known-factor ?factor) (value (read)))))

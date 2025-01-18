(defvar item-list (list "item 1"))

(defun ask-item()
  "A function that does a thing"
  (let ((thing (read-line)))
    (setf thing (concatenate 'string "*" thing "*"))
    thing))

(defun ask-for-things()
  (let ((things (list (ask-for-thing) (ask-for-thing))))
    things))

(defun ask-for-things-with-greeting()
  (let ((things (ask-for-things))
        (greeting "Greeting: "))

        (dolist (item things)
          (setf greeting (concatenate 'string greeting item ", ")))

    greeting))


(defun ask-command()
  (let ((command (read-line)))
    (if (string= command "add")
        (write-line "hello")
        (write-line "goodbey"))
    (format t "You entered: ~A~%" command)))

(princ (ask-command))

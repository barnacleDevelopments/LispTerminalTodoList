(defvar item-list (list "item 1"))

(defun ask-item()
  "A function that does a thing"
  (let ((thing (read-line)))
    (setf thing (concatenate 'string "*" thing "*"))
    thing))

(defun print-list(list)
  (write-line "Your list: ")
  (let ((result ""))
    (dolist (item list)
      (setf result (concatenate 'string result item ", ")))
    (write-line result)))

(defun ask-command()
  (let ((command (read-line)))
    (cond ((string= command "add") (let ((item (read-line))) (push item item-list)))
          ((string= command "get all") (print-list item-list))
          ((string= command "clear") (setq item-list nil)))
    (format nil "You entered: ~A" command)))

(defun start-game()
  (write-line (format nil "WELCOME TO THE LIST GAME!
~%COMMANDS:?~% - get all~% - add~% - clear"))
  (ask-command))

(start-game)

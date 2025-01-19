(defvar item-list (list "item 1"))

(defun ask-item()
  "A function that does a thing"
  (let ((thing (read-line)))
    (setf thing (concatenate 'string "*" thing "*"))
    thing))

(defun print-list(list)
  "Print the game list"
  (write-line "Your list: ")
  (let ((result ""))
    (dolist (item list)
      (setf result (concatenate 'string result item ", ")))
    (write-line result)))

(defun write-welcome()
  "Prints welcome message"
  (format t "WELCOME TO THE LIST LISP GAME!"))

(defun write-help()
  "Prints command list"
  (format t "~%COMMANDS:?~% - get all~% - add~% - clear"))

(defun check-duplicates(list item)
  "Check if provided item is a duplicate in list."
  (dolist (existing-item list)
    (string= (string-downcase item) (string-downcase existing-item))))

(defun add-item()
  "Prompt user for item and adds it to item list"
  (format t "~%What would you like to add?")
  (let ((item (read-line)))
    (if (not(check-duplicates item-list item))
        (progn (setq item-list (append item-list (list item)))
               (format t "~%Added \"~A\" to list~%" item))
        nil)))

(defun reverse-list()
  )

(defun clear-list()
  (setq item-list nil))


(defun ask-command()
  "Prompts user for command."
  (let ((command (read-line)))
    (cond ((string= command "add") (if (not (add-item))
                                       (write-line "Item already in list!")))
          ((string= command "get all") (print-list item-list))
          ((string= command "clear") (clear-list))
          ((string= command "help") (write-help))
          ((string= command "exit")
           (progn (write-line "Exiting...")
                  (return-from ask-command)))
          (t (write-line "Invalid command entered!")))
    (write-line "Enter Command: ")
    (ask-command)))

(defun start-game()
  (write-welcome)
  (write-help)
  (ask-command))

(start-game)

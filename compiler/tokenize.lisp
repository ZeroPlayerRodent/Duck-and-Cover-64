(defun split-string (foo)
  (let ((i 0) (s "") (l (list 1)))
    (loop
      (loop
        (when (>= i (length foo))(return))
        (when (or (equal #\[ (char foo i))
              (equal #\] (char foo i))
              (equal #\{ (char foo i))
              (equal #\} (char foo i))
              (equal #\( (char foo i))
              (equal #\) (char foo i)))
          (when (> (length s) 0)(nconc l (list s)))
          (setf s (string (char foo i)))
          (nconc l (list s))
          (setf s "")
          (when (>= i (length foo))(return))
        )
        (when (equal #\" (char foo i))
          (setf s (concatenate 'string s "#"))
          (loop
            (setf i (+ i 1))
            (when (equal #\" (char foo i))(return))
            (setf s (concatenate 'string s (string (char foo i))))
          )
          (return)
        )
        (when (equal #\' (char foo i))
          (setf s (concatenate 'string s "#"))
          (loop
            (setf i (+ i 1))
            (when (equal #\' (char foo i))(return))
            (setf s (concatenate 'string s (string (char foo i))))
          )
          (return)
        )
        (when (equal #\| (char foo i))
          (loop
            (setf i (+ i 1))
            (when (equal #\| (char foo i))(return))
          )
          (return)
        )
        (when (equal #\Space (char foo i))(return))
        (when (equal #\Newline (char foo i))(return))
        (when (equal #\Return (char foo i))(return))
        (when (equal #\Tab (char foo i))(return))
        (unless (or (equal #\[ (char foo i))(equal #\] (char foo i))
                    (equal #\( (char foo i))(equal #\) (char foo i))
                    (equal #\{ (char foo i))(equal #\} (char foo i)))
          (setf s (concatenate 'string s (string (char-upcase (char foo i)))))
        )
        (setf i (+ i 1))
      )
      (when (> (length s) 0)(push s (cdr (last l))))
      (setf s "")
      (setf i (+ i 1))
      (when (>= i (length foo))(return))
    )
    (pop l)
    l
  )
)

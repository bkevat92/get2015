  -- Display SubjectWise information on number of books purchased 
  SELECT s.subject_nm ,s.subject_id ,count(s.subject_id) "Number of Books purchased"
  FROM subjects s JOIN titles t ON s.subject_id = t.subject_id
  JOIN books b ON t.title_id = b.title_id
  GROUP BY s.subject_id;

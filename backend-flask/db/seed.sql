-- this file was manually created
INSERT INTO public.users (display_name, handle, cognito_user_id)
VALUES
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  ('Afeez Adeboye','afeezadeboyee@gmail.com' , 'A.A' ,'MOCK'),
  ('Jamal Adeboye','ja@test.co' , 'jamalmock' ,'MOCK'),
  ('Zainab Adeboye','oluwashinafeez@yahoo.com' , 'zainabmock' ,'MOCK');
=======
  ('Andrew Brown','andrew@exampro.co' , 'andrewbrown' ,'MOCK'),
  ('Andrew Bayko','bayko@exampro.co' , 'bayko' ,'MOCK'),
  ('Londo Londo','Londo@londo.co' , 'londo' ,'MOCK');
>>>>>>> parent of 4213351 (customized the mock users)
=======
  ('Andrew Brown','andrew@exampro.co' , 'andrewbrown' ,'MOCK'),
  ('Andrew Bayko','bayko@exampro.co' , 'bayko' ,'MOCK'),
  ('Londo Londo','Londo@londo.co' , 'londo' ,'MOCK');
>>>>>>> parent of 4213351 (customized the mock users)
=======
  ('Afeez Adeboye', 'afeezadeboye' ,'MOCK'),
  ('Jamal Adeboye', 'jamaladeboye' ,'MOCK');
>>>>>>> parent of bdb1b30 (fixed the seed ddb)

INSERT INTO public.activities (user_uuid, message, expires_at)
VALUES
  (
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    (SELECT uuid from public.users WHERE users.handle = 'A.A' LIMIT 1),
=======
    (SELECT uuid from public.users WHERE users.handle = 'andrewbrown' LIMIT 1),
>>>>>>> parent of 4213351 (customized the mock users)
=======
    (SELECT uuid from public.users WHERE users.handle = 'andrewbrown' LIMIT 1),
>>>>>>> parent of 4213351 (customized the mock users)
=======
    (SELECT uuid from public.users WHERE users.handle = 'afeezadeboye' LIMIT 1),
>>>>>>> parent of bdb1b30 (fixed the seed ddb)
    'This was imported as seed data!',
    current_timestamp + interval '10 day'
  )
-- -- this file was manually created (because we might auto generate it in future)
-- INSERT INTO public.users (display_name, email, handle, cognito_user_id)
-- VALUES
--   ('Andrew Brown','andrew@exampro.co' , 'andrewbrown' ,'MOCK'),
--   ('Andrew Bayko','bayko@exampro.co' , 'bayko' ,'MOCK'),
--   ('Londo Londo','Londo@londo.co' , 'londo' ,'MOCK');

-- INSERT INTO public.activities (user_uuid, message, expires_at)
-- VALUES
--   (
--     (SELECT uuid from public.users WHERE users.handle = 'andrewbrown' LIMIT 1),
--     'This was imported as seed data!',
--     current_timestamp + interval '10 day'
--   )
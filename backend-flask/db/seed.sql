-- this file was manually created
INSERT INTO public.users (display_name, handle, cognito_user_id)
VALUES
  ('Afeez Adeboye','afeezadeboyee@gmail.com' , 'A.A' ,'MOCK'),
  ('Jamal Adeboye','ja@test.co' , 'jamalmock' ,'MOCK'),
  ('Zainab Adeboye','oluwashinafeez@yahoo.com' , 'zainabmock' ,'MOCK');

INSERT INTO public.activities (user_uuid, message, expires_at)
VALUES
  (
    (SELECT uuid from public.users WHERE users.handle = 'A.A' LIMIT 1),
    'This was imported as seed data!',
    current_timestamp + interval '10 day'
  )
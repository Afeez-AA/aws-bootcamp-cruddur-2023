-- this file was manually created (because we might auto generate it in future)
INSERT INTO public.users (display_name, email, handle, cognito_user_id)
VALUES
  ('Afeez Adeboye','aa@gmail.com' , 'afeezmock' ,'MOCK'),
  ('Jamal Adeboye','ja@test.co' , 'jamalmock' ,'MOCK'),
  ('Zainab Adeboye','za@test.pro' , 'zainabmock' ,'MOCK');

INSERT INTO public.activities (user_uuid, message, expires_at)
VALUES
  (
    (SELECT uuid from public.users WHERE users.handle = 'afeezmock' LIMIT 1),
    'This was imported as seed data!',
    current_timestamp + interval '10 day'
  )
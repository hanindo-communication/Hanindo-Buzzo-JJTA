-- Admin-only directory. Applied to the connected Supabase project.
create function jjta_private.admin_directory() returns table(email text) language sql stable security definer set search_path = '' as $$ select u.email::text from jjta_private.admins a join auth.users u on u.id = a.user_id where auth.uid() is not null and jjta_private.is_admin() order by u.email $$;
revoke all on function jjta_private.admin_directory() from public, anon;
grant usage on schema jjta_private to authenticated;
grant execute on function jjta_private.admin_directory() to authenticated;
create function public.jjta_admin_directory() returns table(email text) language sql stable security invoker set search_path = '' as $$ select * from jjta_private.admin_directory() $$;
revoke all on function public.jjta_admin_directory() from public, anon;
grant execute on function public.jjta_admin_directory() to authenticated;

-- 2 We want to reward the user who has been around the longest, Find the 5 oldest users.
select username, created_at from users
order by (created_at) 
limit 5


-- 3 To understand when to run the ad campaign, figure out the day of the week most users register on? 

select  dayname(created_at)as day, count(*)as total from users
group by day
order by total desc
limit 2



-- 4 To target inactive users in an email ad campaign, find the users who have never posted a photo.
select username from users u
left join photos p on u.id=p.user_id
where p.id is null



-- 5 Suppose you are running a contest to find out who got the most likes on a photo. Find out who won?
select username, p.id, p.image_url,
count(*) as total from photos p
inner join likes l on l.photo_id=p.id
inner join users u on p.user_id=u.id
group by p.id
order by total desc
limit 1


-- 6 The investors want to know how many times does the average user post.

select  (select count(*) from photos) / (select count(*) from users) as avg




-- 7 A brand wants to know which hashtag to use on a post, and find the top 5 most used hashtags.

select t.tag_name, count(*) as total from photo_tags p
join tags t on p.tag_id=t.id
group by t.id
order by total desc
limit 5


-- 8 To find out if there are bots, find users who have liked every single photo on the site.

select username , count(*) as num_likes from users
inner join likes on users.id=likes.user_id
group by username
having num_likes = (select count(*) from photos)

-- 9 To know who the celebrities are, find users who have never commented on a photo.

select username from users u
inner join comments c on c.photo_id=u.id
where comment_text is null

 -- 10 Now it's time to find both of them together, find the users who have never commented on any photo or have commented on every photo.
 
 select username, comment_text from users u
inner join comments c on c.photo_id=u.id
where comment_text is null
 
 
 select username,comment_text from users u
inner join comments c on c.photo_id=u.id
where comment_text is not null 
group by username,comment_text



 
 
 
 
 
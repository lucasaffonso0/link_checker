##file generated into tmp folder
select links.final_url,links.http_code,links.last_check, posts.post_title, posts.post_name, posts.post_modified 
from wp_blc_links links  
inner join wp_blc_instances instances  
on instances.link_id = links.link_id  
inner join wp_posts posts  
on posts.ID = instances.container_id  
where (links.http_code = 403 or links.http_code = 404 ) and 
links.url like '%yourdomain.com%' 
INTO OUTFILE '/tmp/mysql/report.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

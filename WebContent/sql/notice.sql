CREATE TABLE notice(
n_num INT PRIMARY KEY,
n_writer VARCHAR(20) not NULL ,
n_title VARCHAR(300) NOT NULL,
n_content VARCHAR(10000) NOT NULL,
n_regdate DATETIME NOT NULL);


INSERT INTO notice(n_num, n_writer,n_title,n_content,n_regdate)
VALUES(1,'성영한','제목','내용', NOW());

SELECT n_num, n_writer, n_title, n_content, 
DATE_FORMAT(n_regdate,'%Y.%m.%d %h:%i')
FROM notice
ORDER BY n_num DESC
LIMIT 0 , 10;

SELECT n_num, n_writer, n_title, n_content, 
DATE_FORMAT(n_regdate,'%Y.%m.%d %h:%i')
FROM notice
WHERE n_num = 1;

UPDATE notice
SET n_writer='성영한1', n_title='제목1', n_content='내용1', 
n_regdate = NOW()
WHERE n_num = 1;

DELETE FROM notice
WHERE n_num = 1;

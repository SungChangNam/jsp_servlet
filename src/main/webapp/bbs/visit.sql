select * from tab;

create sequence visit_seq
start with 1
increment by 1
nomaxvalue
nocache
nocycle;


create table visit (
	no  number(5) not null,
	writer  varchar2(20) not null,
	memo  varchar2(4000) not null,
	regdate  date not null,
	constraint VISIT_PK primary key(no)
);

drop table visit;
DROP SEQUENCE visit_seq;
select * from visit;

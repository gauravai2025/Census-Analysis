create database project;
use project;
select * from Dataset1A;
select * from Dataset2A;

-- number rows into  our dataset

select   count(*) as  no_rows1A from Dataset1A ;
select count( *) as no_rows2A from Dataset2A ;

-- show datset for bihar and jharkhand only
select * from Dataset1A  where state="Bihar" or  state="Jharkhand" order  by State ;		
select * from Dataset2A  where state="Bihar" or  state="Jharkhand" order  by State ;		


-- total population of India
select sum(Population) as  total_population from Dataset2A;

-- average population growth in perecentage of india
select avg(Growth)as  avg_growth from Dataset1A;

 -- average population growth in perecentage state wise
select State , avg(Growth)as  avg_growth from Dataset1A  group by State order by state;

-- average sex ratio of india 
select round( avg(Sex_ratio),0) as  avg_sex_ratio from Dataset1A ;

-- average sex ratio of india state wise as increasing  order
select State , round(avg(Sex_ratio),0)as  avg_sex_ratio from Dataset1A group by State order by avg_sex_ratio asc;

-- average literacy ratio of india 
select  round(avg(Literacy),0)as  avg_literacy from Dataset1A ;


-- average literacy ratio of india state wise in decreasing order
select State , round(avg(Literacy),0)as  avg_literacy from Dataset1A group by State order by avg_literacy desc;

--  state whose literacy is greater than 80
select State , round(avg(Literacy),0)as  avg_literacy from Dataset1A group by State having avg_literacy>85 order by avg_literacy desc;

-- top 3 state  showing highest growth rate
select   State , avg(Growth)as  avg_growth from Dataset1A  group by State order by avg_growth desc limit 3;

-- top 3 state  showing lowest literacy  rate
select State , round(avg(Literacy),0)as  avg_literacy from Dataset1A group by State order by avg_literacy asc limit 3;

-- top 3 state  showing lowest sex ratio 
select State , round(avg(Sex_ratio),0)as  avg_sex_ratio from Dataset1A group by State order by avg_sex_ratio asc limit 3;

-- top 3 and bottom 3 states in literacy rate 

drop table if exists temp;
create table temp(
 state varchar(120),
 literacy_rate int
 );
 insert into temp
 select State , round(avg(Literacy),0)as  avg_literacy from Dataset1A group by State order by avg_literacy asc limit 3 ;

insert into temp
 select State , round(avg(Literacy),0)as  avg_literacy from Dataset1A group by State order by avg_literacy desc limit 3 ;

select* from temp;
drop table temp1;

-- state name starting with "a" or b but end with "h" sql is not case sensitive 
select distinct State from Dataset1A  where State like  "a%h" or  State like "b%h";

-- state name starting with "a"  but end with "m" 
select distinct State from Dataset1A  where State like  "a%" and  State like "%m";

-- joining both table

-- total males and females







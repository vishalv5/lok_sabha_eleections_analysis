use lok_sabha;

# 1. List top 5 / bottom 5 constituencies of 2014 and 2019 in terms of voter turnout ratio?

SELECT pc_name , sum(total_votes)/ (total_electors)  * 100 as vtr2014
FROM results_2014
group by pc_name, total_electors 
order by vtr2014 limit 5;

SELECT pc_name , sum(total_votes)/ (total_electors)  * 100 as vtr2014
FROM results_2014
group by pc_name, total_electors 
order by vtr2014 DESC limit 5;

SELECT   pc_name, sum(total_votes)/total_electors  * 100 as vtr2019 
FROM results_2019
group by pc_name, total_electors 
order by vtr2019 LIMIT 5 ;

SELECT   pc_name, sum(total_votes)/total_electors  * 100 as vtr2019 
FROM results_2019
group by pc_name, total_electors 
order by vtr2019 desc LIMIT 5;

# 2. Which constituencies have elected the same partyfortwo consecutive elections, rank them by % of votes to that winning party in 2019?

   
select r19.pc_name ,
      r19.max_total_votes as m2019 ,r19.total_electors as te2019 , r19.party as p2019, 
      r14.max_total_votes,r14.total_electors,
      r14.party
from party_tvotes_bypc_name2019 as r19
join party_tvotes_bypc_name2014 as r14 
on r19.pc_name = r14.pc_name 
AND r19.party= r14.party; 

# 3. Which constituencies have voted for different parties in two elections (list top 1 0 
 # based on difference (2019-2014) in winner vote percentage in two elections)

select r19.pc_name ,
      r19.max_total_votes as max_votes_2019 ,r19.total_electors as total_votes_2019 , r19.party as winner_2019, 
      r14.max_total_votes as max_votes_2014, r14.total_electors as total_electors_2014, r14.party as winner_2014
from party_tvotes_bypc_name2019 as r19
join party_tvotes_bypc_name2014 as r14 
on r19.pc_name = r14.pc_name 
where  r19.party <> r14.party;


use [Elections_of_India_project]

select * from [dbo].[constituencywise_details];
select * from [dbo].[constituencywise_results];
select * from [dbo].[partywise_results];
select * from [dbo].[states];
select * from [dbo].[statewise_results];

--QUES). What is the Total No. of Seats

select count(distinct(Constituency_ID))Total_Seats from constituencywise_details
---Total_Seats = 543

--QUES). What are the Total No. of Seats avialable for elections in each state

/*select * from statewise_results sr full outer join states st on sr.State_ID=st.State_ID*/

select 
	st.State, count(sr.Parliament_Constituency)No_of_seats_in_each_state
from statewise_results sr full outer join states st on sr.State_ID=st.State_ID 
group by st.State;

--QUES). Total Seats Won by NDA Alliance

/*select * from constituencywise_results cr full outer join partywise_results ps on cr.Party_ID=ps.Party_ID*/

select party, count(party)Seats_won 
from constituencywise_results cr full outer join partywise_results ps on cr.Party_ID=ps.Party_ID
group by party order by Seats_won desc, Party asc


with cte as 
	(select 
		party, 
		count(party)Seats_won,
		case 
			when Party like 'Bharatiya Janata Party - BJP' then 'NDA' 
			when Party like 'Telugu Desam - TDP' then 'NDA'
			when Party like 'Janata Dal  (United) - JD(U)' then 'NDA'
			when Party like 'Shiv Sena - SHS' then 'NDA'
			when Party like 'Lok Janshakti Party(Ram Vilas) - LJPRV' then 'NDA'
			when Party like 'Janata Dal  (Secular) - JD(S)' then 'NDA'
			when Party like 'Janasena Party - JnP' then 'NDA'
			when Party like 'Rashtriya Lok Dal - RLD' then 'NDA'
			when Party like 'AJSU Party - AJSUP' then 'NDA'
			when Party like 'Nationalist Congress Party - NCP' then 'NDA'
			when Party like 'Sikkim Krantikari Morcha - SKM' then 'NDA'
			when Party like 'Apna Dal (Soneylal) - ADAL' then 'NDA'
			when Party like 'Asom Gana Parishad - AGP' then 'NDA'
			when Party like 'Hindustani Awam Morcha (Secular) - HAMS' then 'NDA'
			when Party like 'Zoram People’s Movement - ZPM' then 'NDA'
			when Party like 'Lok Janshakti Party(Ram Vilas) - LJPRV' then 'NDA'
			
			when Party like 'Indian National Congress - INC' then 'I.N.D.I.Alliance'
			when Party like 'Samajwadi Party - SP' then 'I.N.D.I.Alliance'
			when Party like 'All India Trinamool Congress - AITC' then 'I.N.D.I.Alliance'
			when Party like 'Dravida Munnetra Kazhagam - DMK' then 'I.N.D.I.Alliance'
			when Party like 'Communist Party of India  (Marxist) - CPI(M)' then 'I.N.D.I.Alliance'
			when Party like 'Rashtriya Janata Dal - RJD' then 'I.N.D.I.Alliance'
			when Party like 'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT' then 'I.N.D.I.Alliance'
			when Party like 'Aam Aadmi Party - AAAP' then 'I.N.D.I.Alliance'
			when Party like 'Nationalist Congress Party - NCP' then 'I.N.D.I.Alliance'
			when Party like 'Communist Party of India - CPI' then 'I.N.D.I.Alliance'
			when Party like 'Jharkhand Mukti Morcha - JMM' then 'I.N.D.I.Alliance'
			when Party like 'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)' then 'I.N.D.I.Alliance'
			when Party like 'Indian Union Muslim League - IUML' then 'I.N.D.I.Alliance'
			when Party like 'Jammu & Kashmir National Conference - JKN' then 'I.N.D.I.Alliance'
			when Party like 'Viduthalai Chiruthaigal Katchi - VCK' then 'I.N.D.I.Alliance'
			when Party like 'Bharat Adivasi Party - BHRTADVSIP' then 'I.N.D.I.Alliance'
			when Party like 'Kerala Congress - KEC' then 'I.N.D.I.Alliance'
			when Party like 'Marumalarchi Dravida Munnetra Kazhagam - MDMK' then 'I.N.D.I.Alliance'
			when Party like 'Rashtriya Loktantrik Party - RLTP' then 'I.N.D.I.Alliance'
			when Party like 'Revolutionary Socialist Party - RSP' then 'I.N.D.I.Alliance'
			when Party like 'Nationalist Congress Party Sharadchandra Pawar - NCPSP' then 'I.N.D.I.Alliance'
			
			else 'other'
		end as Alliances
	from constituencywise_results cr full outer join partywise_results ps on cr.Party_ID=ps.Party_ID
	group by party)
select Alliances, sum(seats_won)total_seats from cte where Alliances = 'NDA' 
group by Alliances; -- o/p -- NDA 293

--QUES). Seats won by each parties in NDA alliance

/*select * from constituencywise_results cr full outer join partywise_results ps on cr.Party_ID=ps.Party_ID*/ 
with cte as 
	(select 
		party, 
		count(party)Seats_won,
		case 
			when Party like 'Bharatiya Janata Party - BJP' then 'NDA' 
			when Party like 'Telugu Desam - TDP' then 'NDA'
			when Party like 'Janata Dal  (United) - JD(U)' then 'NDA'
			when Party like 'Shiv Sena - SHS' then 'NDA'
			when Party like 'Lok Janshakti Party(Ram Vilas) - LJPRV' then 'NDA'
			when Party like 'Janata Dal  (Secular) - JD(S)' then 'NDA'
			when Party like 'Janasena Party - JnP' then 'NDA'
			when Party like 'Rashtriya Lok Dal - RLD' then 'NDA'
			when Party like 'AJSU Party - AJSUP' then 'NDA'
			when Party like 'Nationalist Congress Party - NCP' then 'NDA'
			when Party like 'Sikkim Krantikari Morcha - SKM' then 'NDA'
			when Party like 'Apna Dal (Soneylal) - ADAL' then 'NDA'
			when Party like 'Asom Gana Parishad - AGP' then 'NDA'
			when Party like 'Hindustani Awam Morcha (Secular) - HAMS' then 'NDA'
			when Party like 'Zoram People’s Movement - ZPM' then 'NDA'
			when Party like 'Lok Janshakti Party(Ram Vilas) - LJPRV' then 'NDA'
			
			when Party like 'Indian National Congress - INC' then 'I.N.D.I.Alliance'
			when Party like 'Samajwadi Party - SP' then 'I.N.D.I.Alliance'
			when Party like 'All India Trinamool Congress - AITC' then 'I.N.D.I.Alliance'
			when Party like 'Dravida Munnetra Kazhagam - DMK' then 'I.N.D.I.Alliance'
			when Party like 'Communist Party of India  (Marxist) - CPI(M)' then 'I.N.D.I.Alliance'
			when Party like 'Rashtriya Janata Dal - RJD' then 'I.N.D.I.Alliance'
			when Party like 'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT' then 'I.N.D.I.Alliance'
			when Party like 'Aam Aadmi Party - AAAP' then 'I.N.D.I.Alliance'
			when Party like 'Nationalist Congress Party - NCP' then 'I.N.D.I.Alliance'
			when Party like 'Communist Party of India - CPI' then 'I.N.D.I.Alliance'
			when Party like 'Jharkhand Mukti Morcha - JMM' then 'I.N.D.I.Alliance'
			when Party like 'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)' then 'I.N.D.I.Alliance'
			when Party like 'Indian Union Muslim League - IUML' then 'I.N.D.I.Alliance'
			when Party like 'Jammu & Kashmir National Conference - JKN' then 'I.N.D.I.Alliance'
			when Party like 'Viduthalai Chiruthaigal Katchi - VCK' then 'I.N.D.I.Alliance'
			when Party like 'Bharat Adivasi Party - BHRTADVSIP' then 'I.N.D.I.Alliance'
			when Party like 'Kerala Congress - KEC' then 'I.N.D.I.Alliance'
			when Party like 'Marumalarchi Dravida Munnetra Kazhagam - MDMK' then 'I.N.D.I.Alliance'
			when Party like 'Rashtriya Loktantrik Party - RLTP' then 'I.N.D.I.Alliance'
			when Party like 'Revolutionary Socialist Party - RSP' then 'I.N.D.I.Alliance'
			when Party like 'Nationalist Congress Party Sharadchandra Pawar - NCPSP' then 'I.N.D.I.Alliance'
			
			else 'other'
		end as Alliances
	from constituencywise_results cr full outer join partywise_results ps on cr.Party_ID=ps.Party_ID
	group by party)
select Party, seats_won, Alliances  from cte  where Alliances='NDA'
order by Seats_won desc;

--QUES). Total seats won by I.N.D.I.Alliance

with cte as 
	(select 
		party, 
		count(party)Seats_won,
		case 
			when Party like 'Bharatiya Janata Party - BJP' then 'NDA' 
			when Party like 'Telugu Desam - TDP' then 'NDA'
			when Party like 'Janata Dal  (United) - JD(U)' then 'NDA'
			when Party like 'Shiv Sena - SHS' then 'NDA'
			when Party like 'Lok Janshakti Party(Ram Vilas) - LJPRV' then 'NDA'
			when Party like 'Janata Dal  (Secular) - JD(S)' then 'NDA'
			when Party like 'Janasena Party - JnP' then 'NDA'
			when Party like 'Rashtriya Lok Dal - RLD' then 'NDA'
			when Party like 'AJSU Party - AJSUP' then 'NDA'
			when Party like 'Nationalist Congress Party - NCP' then 'NDA'
			when Party like 'Sikkim Krantikari Morcha - SKM' then 'NDA'
			when Party like 'Apna Dal (Soneylal) - ADAL' then 'NDA'
			when Party like 'Asom Gana Parishad - AGP' then 'NDA'
			when Party like 'Hindustani Awam Morcha (Secular) - HAMS' then 'NDA'
			when Party like 'Zoram People’s Movement - ZPM' then 'NDA'
			when Party like 'Lok Janshakti Party(Ram Vilas) - LJPRV' then 'NDA'
			
			when Party like 'Indian National Congress - INC' then 'I.N.D.I.Alliance'
			when Party like 'Samajwadi Party - SP' then 'I.N.D.I.Alliance'
			when Party like 'All India Trinamool Congress - AITC' then 'I.N.D.I.Alliance'
			when Party like 'Dravida Munnetra Kazhagam - DMK' then 'I.N.D.I.Alliance'
			when Party like 'Communist Party of India  (Marxist) - CPI(M)' then 'I.N.D.I.Alliance'
			when Party like 'Rashtriya Janata Dal - RJD' then 'I.N.D.I.Alliance'
			when Party like 'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT' then 'I.N.D.I.Alliance'
			when Party like 'Aam Aadmi Party - AAAP' then 'I.N.D.I.Alliance'
			when Party like 'Nationalist Congress Party - NCP' then 'I.N.D.I.Alliance'
			when Party like 'Communist Party of India - CPI' then 'I.N.D.I.Alliance'
			when Party like 'Jharkhand Mukti Morcha - JMM' then 'I.N.D.I.Alliance'
			when Party like 'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)' then 'I.N.D.I.Alliance'
			when Party like 'Indian Union Muslim League - IUML' then 'I.N.D.I.Alliance'
			when Party like 'Jammu & Kashmir National Conference - JKN' then 'I.N.D.I.Alliance'
			when Party like 'Viduthalai Chiruthaigal Katchi - VCK' then 'I.N.D.I.Alliance'
			when Party like 'Bharat Adivasi Party - BHRTADVSIP' then 'I.N.D.I.Alliance'
			when Party like 'Kerala Congress - KEC' then 'I.N.D.I.Alliance'
			when Party like 'Marumalarchi Dravida Munnetra Kazhagam - MDMK' then 'I.N.D.I.Alliance'
			when Party like 'Rashtriya Loktantrik Party - RLTP' then 'I.N.D.I.Alliance'
			when Party like 'Revolutionary Socialist Party - RSP' then 'I.N.D.I.Alliance'
			when Party like 'Nationalist Congress Party Sharadchandra Pawar - NCPSP' then 'I.N.D.I.Alliance'
			
			else 'other'
		end as Alliances
	from constituencywise_results cr full outer join partywise_results ps on cr.Party_ID=ps.Party_ID
	group by party)
select Alliances, sum(seats_won)total_seats from cte where Alliances = 'I.N.D.I.Alliance' 
group by Alliances;

---QUES). Seats won by each parties in I.N.D.I.Alliance

with cte as 
	(select 
		party, 
		count(party)Seats_won,
		case 
			when Party like 'Bharatiya Janata Party - BJP' then 'NDA' 
			when Party like 'Telugu Desam - TDP' then 'NDA'
			when Party like 'Janata Dal  (United) - JD(U)' then 'NDA'
			when Party like 'Shiv Sena - SHS' then 'NDA'
			when Party like 'Lok Janshakti Party(Ram Vilas) - LJPRV' then 'NDA'
			when Party like 'Janata Dal  (Secular) - JD(S)' then 'NDA'
			when Party like 'Janasena Party - JnP' then 'NDA'
			when Party like 'Rashtriya Lok Dal - RLD' then 'NDA'
			when Party like 'AJSU Party - AJSUP' then 'NDA'
			when Party like 'Nationalist Congress Party - NCP' then 'NDA'
			when Party like 'Sikkim Krantikari Morcha - SKM' then 'NDA'
			when Party like 'Apna Dal (Soneylal) - ADAL' then 'NDA'
			when Party like 'Asom Gana Parishad - AGP' then 'NDA'
			when Party like 'Hindustani Awam Morcha (Secular) - HAMS' then 'NDA'
			when Party like 'Zoram People’s Movement - ZPM' then 'NDA'
			when Party like 'Lok Janshakti Party(Ram Vilas) - LJPRV' then 'NDA'
			
			when Party like 'Indian National Congress - INC' then 'I.N.D.I.Alliance'
			when Party like 'Samajwadi Party - SP' then 'I.N.D.I.Alliance'
			when Party like 'All India Trinamool Congress - AITC' then 'I.N.D.I.Alliance'
			when Party like 'Dravida Munnetra Kazhagam - DMK' then 'I.N.D.I.Alliance'
			when Party like 'Communist Party of India  (Marxist) - CPI(M)' then 'I.N.D.I.Alliance'
			when Party like 'Rashtriya Janata Dal - RJD' then 'I.N.D.I.Alliance'
			when Party like 'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT' then 'I.N.D.I.Alliance'
			when Party like 'Aam Aadmi Party - AAAP' then 'I.N.D.I.Alliance'
			when Party like 'Nationalist Congress Party - NCP' then 'I.N.D.I.Alliance'
			when Party like 'Communist Party of India - CPI' then 'I.N.D.I.Alliance'
			when Party like 'Jharkhand Mukti Morcha - JMM' then 'I.N.D.I.Alliance'
			when Party like 'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)' then 'I.N.D.I.Alliance'
			when Party like 'Indian Union Muslim League - IUML' then 'I.N.D.I.Alliance'
			when Party like 'Jammu & Kashmir National Conference - JKN' then 'I.N.D.I.Alliance'
			when Party like 'Viduthalai Chiruthaigal Katchi - VCK' then 'I.N.D.I.Alliance'
			when Party like 'Bharat Adivasi Party - BHRTADVSIP' then 'I.N.D.I.Alliance'
			when Party like 'Kerala Congress - KEC' then 'I.N.D.I.Alliance'
			when Party like 'Marumalarchi Dravida Munnetra Kazhagam - MDMK' then 'I.N.D.I.Alliance'
			when Party like 'Rashtriya Loktantrik Party - RLTP' then 'I.N.D.I.Alliance'
			when Party like 'Revolutionary Socialist Party - RSP' then 'I.N.D.I.Alliance'
			when Party like 'Nationalist Congress Party Sharadchandra Pawar - NCPSP' then 'I.N.D.I.Alliance'
			
			else 'other'
		end as Alliances
	from constituencywise_results cr full outer join partywise_results ps on cr.Party_ID=ps.Party_ID
	group by party)
select Party, seats_won, Alliances  from cte  where Alliances='I.N.D.I.Alliance'
order by Seats_won desc;

--QUES). Total no. of parties won in each Alliance

with cte as 
	(select 
		party, 
		count(party)Seats_won,
		case 
			when Party like 'Bharatiya Janata Party - BJP' then 'NDA' 
			when Party like 'Telugu Desam - TDP' then 'NDA'
			when Party like 'Janata Dal  (United) - JD(U)' then 'NDA'
			when Party like 'Shiv Sena - SHS' then 'NDA'
			when Party like 'Lok Janshakti Party(Ram Vilas) - LJPRV' then 'NDA'
			when Party like 'Janata Dal  (Secular) - JD(S)' then 'NDA'
			when Party like 'Janasena Party - JnP' then 'NDA'
			when Party like 'Rashtriya Lok Dal - RLD' then 'NDA'
			when Party like 'AJSU Party - AJSUP' then 'NDA'
			when Party like 'Nationalist Congress Party - NCP' then 'NDA'
			when Party like 'Sikkim Krantikari Morcha - SKM' then 'NDA'
			when Party like 'Apna Dal (Soneylal) - ADAL' then 'NDA'
			when Party like 'Asom Gana Parishad - AGP' then 'NDA'
			when Party like 'Hindustani Awam Morcha (Secular) - HAMS' then 'NDA'
			when Party like 'Zoram People’s Movement - ZPM' then 'NDA'
			when Party like 'Lok Janshakti Party(Ram Vilas) - LJPRV' then 'NDA'
			
			when Party like 'Indian National Congress - INC' then 'I.N.D.I.Alliance'
			when Party like 'Samajwadi Party - SP' then 'I.N.D.I.Alliance'
			when Party like 'All India Trinamool Congress - AITC' then 'I.N.D.I.Alliance'
			when Party like 'Dravida Munnetra Kazhagam - DMK' then 'I.N.D.I.Alliance'
			when Party like 'Communist Party of India  (Marxist) - CPI(M)' then 'I.N.D.I.Alliance'
			when Party like 'Rashtriya Janata Dal - RJD' then 'I.N.D.I.Alliance'
			when Party like 'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT' then 'I.N.D.I.Alliance'
			when Party like 'Aam Aadmi Party - AAAP' then 'I.N.D.I.Alliance'
			when Party like 'Nationalist Congress Party - NCP' then 'I.N.D.I.Alliance'
			when Party like 'Communist Party of India - CPI' then 'I.N.D.I.Alliance'
			when Party like 'Jharkhand Mukti Morcha - JMM' then 'I.N.D.I.Alliance'
			when Party like 'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)' then 'I.N.D.I.Alliance'
			when Party like 'Indian Union Muslim League - IUML' then 'I.N.D.I.Alliance'
			when Party like 'Jammu & Kashmir National Conference - JKN' then 'I.N.D.I.Alliance'
			when Party like 'Viduthalai Chiruthaigal Katchi - VCK' then 'I.N.D.I.Alliance'
			when Party like 'Bharat Adivasi Party - BHRTADVSIP' then 'I.N.D.I.Alliance'
			when Party like 'Kerala Congress - KEC' then 'I.N.D.I.Alliance'
			when Party like 'Marumalarchi Dravida Munnetra Kazhagam - MDMK' then 'I.N.D.I.Alliance'
			when Party like 'Rashtriya Loktantrik Party - RLTP' then 'I.N.D.I.Alliance'
			when Party like 'Revolutionary Socialist Party - RSP' then 'I.N.D.I.Alliance'
			when Party like 'Nationalist Congress Party Sharadchandra Pawar - NCPSP' then 'I.N.D.I.Alliance'
			
			else 'other'
		end as Alliances
	from constituencywise_results cr full outer join partywise_results ps on cr.Party_ID=ps.Party_ID
	group by party)
select Alliances, count(party)No_of_Parties_each_alliance_have from cte  group by Alliances;
--o/p ( INDIalliance has 20 parties )
	--( INDIA alliance has 15 parties)
	--( Other parties are 7 )

--QUES). Add new column feild in table partywise_results to get the party's Alliance as NDA, I.N.D.I.Alliance or other

select * from partywise_results

alter table partywise_results 
add Alliance as ( case 
			when Party like 'Bharatiya Janata Party - BJP' then 'NDA' 
			when Party like 'Telugu Desam - TDP' then 'NDA'
			when Party like 'Janata Dal  (United) - JD(U)' then 'NDA'
			when Party like 'Shiv Sena - SHS' then 'NDA'
			when Party like 'Lok Janshakti Party(Ram Vilas) - LJPRV' then 'NDA'
			when Party like 'Janata Dal  (Secular) - JD(S)' then 'NDA'
			when Party like 'Janasena Party - JnP' then 'NDA'
			when Party like 'Rashtriya Lok Dal - RLD' then 'NDA'
			when Party like 'AJSU Party - AJSUP' then 'NDA'
			when Party like 'Nationalist Congress Party - NCP' then 'NDA'
			when Party like 'Sikkim Krantikari Morcha - SKM' then 'NDA'
			when Party like 'Apna Dal (Soneylal) - ADAL' then 'NDA'
			when Party like 'Asom Gana Parishad - AGP' then 'NDA'
			when Party like 'Hindustani Awam Morcha (Secular) - HAMS' then 'NDA'
			when Party like 'Zoram People’s Movement - ZPM' then 'NDA'
			when Party like 'Lok Janshakti Party(Ram Vilas) - LJPRV' then 'NDA'
			
			when Party like 'Indian National Congress - INC' then 'I.N.D.I.Alliance'
			when Party like 'Samajwadi Party - SP' then 'I.N.D.I.Alliance'
			when Party like 'All India Trinamool Congress - AITC' then 'I.N.D.I.Alliance'
			when Party like 'Dravida Munnetra Kazhagam - DMK' then 'I.N.D.I.Alliance'
			when Party like 'Communist Party of India  (Marxist) - CPI(M)' then 'I.N.D.I.Alliance'
			when Party like 'Rashtriya Janata Dal - RJD' then 'I.N.D.I.Alliance'
			when Party like 'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT' then 'I.N.D.I.Alliance'
			when Party like 'Aam Aadmi Party - AAAP' then 'I.N.D.I.Alliance'
			when Party like 'Nationalist Congress Party - NCP' then 'I.N.D.I.Alliance'
			when Party like 'Communist Party of India - CPI' then 'I.N.D.I.Alliance'
			when Party like 'Jharkhand Mukti Morcha - JMM' then 'I.N.D.I.Alliance'
			when Party like 'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)' then 'I.N.D.I.Alliance'
			when Party like 'Indian Union Muslim League - IUML' then 'I.N.D.I.Alliance'
			when Party like 'Jammu & Kashmir National Conference - JKN' then 'I.N.D.I.Alliance'
			when Party like 'Viduthalai Chiruthaigal Katchi - VCK' then 'I.N.D.I.Alliance'
			when Party like 'Bharat Adivasi Party - BHRTADVSIP' then 'I.N.D.I.Alliance'
			when Party like 'Kerala Congress - KEC' then 'I.N.D.I.Alliance'
			when Party like 'Marumalarchi Dravida Munnetra Kazhagam - MDMK' then 'I.N.D.I.Alliance'
			when Party like 'Rashtriya Loktantrik Party - RLTP' then 'I.N.D.I.Alliance'
			when Party like 'Revolutionary Socialist Party - RSP' then 'I.N.D.I.Alliance'
			when Party like 'Nationalist Congress Party Sharadchandra Pawar - NCPSP' then 'I.N.D.I.Alliance'
			
			else 'other'
		end );

--QUES). Which Party Alliance won the most seats across all states?
with cte as (
	select state_results.Parliament_Constituency,state, party, alliance from 
		(select Parliament_Constituency, s.State, s.State_ID from 
		states s full outer join statewise_results sr on s.State_ID=sr.State_ID)state_results
	full outer join 
		(select Parliament_Constituency, Party, Alliance from 
		constituencywise_results cr full outer join partywise_results ps on cr.Party_ID=ps.Party_ID)party_results
		on state_results.Parliament_Constituency=party_results.Parliament_Constituency)
select state, max(alliance)won_by from cte 
group by state;

---or----one more way 
with cte as (
select state, max(alliance)won_by from
	(select state_results.Parliament_Constituency,state, party, alliance from 
		(select Parliament_Constituency, s.State, s.State_ID from 
		states s full outer join statewise_results sr on s.State_ID=sr.State_ID)state_results
	full outer join 
		(select Parliament_Constituency, Party, Alliance from 
		constituencywise_results cr full outer join partywise_results ps on cr.Party_ID=ps.Party_ID)party_results
		on state_results.Parliament_Constituency=party_results.Parliament_Constituency)ab
group by state)
select (won_by)party_alliance, count(state)No_of_States_won from cte
group by won_by order by No_of_States_won desc;--this query is giving no_of_states won by each alliance
/*but this is not we wanted*/

with cte as (
	select state_results.Parliament_Constituency,state, party, alliance from 
		(select Parliament_Constituency, s.State, s.State_ID from 
		states s full outer join statewise_results sr on s.State_ID=sr.State_ID)state_results
	full outer join 
		(select Parliament_Constituency, Party, Alliance from 
		constituencywise_results cr full outer join partywise_results ps on cr.Party_ID=ps.Party_ID)party_results
		on state_results.Parliament_Constituency=party_results.Parliament_Constituency)
select state, (select count(state),Alliance from cte group by Alliance) , max(alliance)won_by from cte 
group by state;--error

with cte as (
	select state_results.Parliament_Constituency,state, party, alliance from 
		(select Parliament_Constituency, s.State, s.State_ID from 
		states s full outer join statewise_results sr on s.State_ID=sr.State_ID)state_results
	full outer join 
		(select Parliament_Constituency, Party, Alliance from 
		constituencywise_results cr full outer join partywise_results ps on cr.Party_ID=ps.Party_ID)party_results
		on state_results.Parliament_Constituency=party_results.Parliament_Constituency)
select state, count(parliament_constituency)Total_seats_contested , max(alliance)won_by from cte 
group by state;
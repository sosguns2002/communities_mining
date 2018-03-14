create temp table jsoninp as select * from stdinput();

drop table if exists grants;
create table grants as select conceptId,conceptLabel,suggestedacknowledgement
from 
(setschema 'conceptId,conceptLabel,suggestedacknowledgement' 
          select c1 as conceptId,c2 as conceptLabel, c3 as suggestedacknowledgement
                       from 
                          (select * from (setschema 'c1,c2,c3,c4' select jsonpath(c1, '$.id','$.label','$.suggestedacknowledgement','$.jsonextrainfo') from jsoninp)));


create index grants_index on grants (conceptId,conceptLabel,suggestedacknowledgement);
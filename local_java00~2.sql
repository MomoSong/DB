Create Table new_table(
    no Number(3),
    name Varchar2(10),
    birth Date
);

drop table new_table;

select * from tab;

select * from New_Table;
select no, name, birth from new_table;

desc New_Table;

insert into new_table values(222, 'BBB', '1991-10-25');
insert into new_table values(1, 'Gong', '1982-1-1');

delete from new_table;
Truncate Table New_table;
drop table new_table;
rollback;
commit;

Alter table new_table Add(address varchar2(50));

Alter table new_table Rename Column address to loc;

Alter table new_table Modify (loc varchar2(20));

Alter table new_table drop column loc;

Alter table new_table drop column loc cascade Constraints;

rename new_table to just_table;
rename just_table to new_table;

desc new_table;
desc just_table;
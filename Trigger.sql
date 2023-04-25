create table emp (employee_id number,
emp_name varchar2(20), salary number, designation varchar2(20));
/
desc emp;
/
insert into emp values(1, 'Mani', 50000, 'software developer');
insert into emp values(2, 'Prabhu', 80000, 'PLSQL Developer');
insert into emp values(3, 'Kavin', 40000, 'software developer');
insert into emp values(4, 'Raja', 45000, 'QA');
insert into emp values(5, 'Jegan', 90000, 'QA');
/
set serveroutput on;
create or replace trigger emp_trg
before insert on emp
for each row
enable
declare
    v_user varchar2(20);
Begin
    select user into v_user from dual;
    dbms_output.put_line('You just inserted a line mr. '||v_user);
End;
/
insert into emp values(7, 'ELwin', 45000, 'QA');
/
create or replace trigger b_trg
before insert on emp
for each row
enable
declare
    v_user varchar2(20);
Begin
    select user into v_user from dual;
    dbms_output.put_line('You just inserted a line mr. '||v_user);
End;
/
update emp set emp_name = 'Gopi' where employee_id = 5;
/
select * from emp;
/
create or replace trigger tr_emp
before insert or delete or update on emp
for each row
enable 
declare
    v_user varchar2(20);
begin
    select user into v_user from dual;
    if inserting then
        dbms_output.put_line('One Row Inserted by : '||v_user);
    elsif deleting then
        dbms_output.put_line('One Row Deleted by '||v_user);
    elsif updating then
        dbms_output.put_line('One Row Updated by '||v_user);
    end if;
end;
/
insert into emp values (8, 'lawerence', 75000, 'Software Engineer');
/
update emp set salary = 35000 where emp_name = 'Raja';
/
delete from emp where employee_id = 7;
/
commit;
/

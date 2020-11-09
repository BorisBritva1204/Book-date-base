unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql57conn, sqldb, db, Forms, Controls, Graphics, Dialogs,
  DBCtrls, DBExtCtrls, DBGrids, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    MySQL57Connection1: TMySQL57Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
 a1,a2,a3: integer;
implementation

{$R *.lfm}

{ TForm1 }
procedure TForm1.Button1Click(Sender: TObject);
begin
a1 := 1;
a2 := 0;
a3 := 0;
label1.Caption:= 'Название книги';
label2.Caption:= 'Автор';
SQLQuery1.Close;
SQLQuery1.SQL.Clear;
SQLQuery1.SQL.Add('Select title as "Название", author as "Автор", published as "Дата издания", stock as "Количество" from books;');
SQLQuery1.Open;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
a1 := 0;
a2 := 1;
a3 := 0;
label1.Caption:= 'Фамилия';
label2.Caption:= 'Имя';
SQLQuery1.Close;
SQLQuery1.SQL.Clear;
SQLQuery1.SQL.Add('Select firstname as "Имя", lastname as "Фамилия" from members;');
SQLQuery1.Open;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
a1 := 0;
a2 := 0;
a3 := 1;
label1.Caption:= 'Фамилия';
label2.Caption:= 'Имя';
SQLQuery1.Close;
SQLQuery1.SQL.Clear;
SQLQuery1.SQL.Add('SELECT members.firstname AS "Имя", members.lastname AS "Фамилия", books.title AS "Книга", borrowings.borrowdate AS "Когда взял", borrowings.returndate AS "Когда отдать" FROM borrowings JOIN books ON borrowings.bookid=books.bookid JOIN members ON borrowings.memberid=members.memberid');
SQLQuery1.Open;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
if a1=1 then
  begin
  SQLQuery1.Close;
  SQLQuery1.SQL.Clear;
  if ((sender as TEdit).Name = 'Edit1') then
     begin
       SQLQuery1.SQL.Add('Select title as "Название", author as "Автор", published as "Дата издания", stock as "Количество"  from books WHERE author LIKE :authSearch;');
       SQLQuery1.params.parambyname('authSearch').asstring := edit1.Text + '%';
     end;
    if ((sender as TEdit).Name = 'Edit2') then
     begin
       SQLQuery1.SQL.Add('Select title as "Название", author as "Автор", published as "Дата издания", stock as "Количество"  from books WHERE title LIKE :titleSearch;');
       SQLQuery1.params.parambyname('titleSearch').asstring := edit2.Text+'%';
     end;
  SQLQuery1.Open;
end;

if a2=1 then
  begin
  SQLQuery1.Close;
  SQLQuery1.SQL.Clear;
  if ((sender as TEdit).Name = 'Edit1') then
     begin
       SQLQuery1.SQL.Add('Select firstname as "Имя", lastname as "Фамилия" from members WHERE firstname LIKE :fn;');
       SQLQuery1.params.parambyname('fn').asstring := edit1.Text + '%';
     end;
    if ((sender as TEdit).Name = 'Edit2') then
     begin
       SQLQuery1.SQL.Add('Select firstname as "Имя", lastname as "Фамилия" from members WHERE lastname LIKE :ln;');
       SQLQuery1.params.parambyname('ln').asstring := edit2.Text+'%';
     end;
  SQLQuery1.Open;
end;

if a3=1 then
  begin
  SQLQuery1.Close;
  SQLQuery1.SQL.Clear;
  if ((sender as TEdit).Name = 'Edit1') then
     begin
       SQLQuery1.SQL.Add('members.firstname AS "Имя", members.lastname AS "Фамилия", books.title AS "Книга", borrowings.borrowdate AS "Когда взял", borrowings.returndate AS "Когда отдать" from borrowings WHERE members.firstname LIKE :fn;');
       SQLQuery1.params.parambyname('fn').asstring := edit1.Text + '%';
     end;
    if ((sender as TEdit).Name = 'Edit2') then
     begin
       SQLQuery1.SQL.Add('members.firstname AS "Имя", members.lastname AS "Фамилия", books.title AS "Книга", borrowings.borrowdate AS "Когда взял", borrowings.returndate AS "Когда отдать" from borrowings WHERE members.firstname LIKE :ln;');
       SQLQuery1.params.parambyname('ln').asstring := edit2.Text+'%';
     end;
  SQLQuery1.Open;
end;
end;


procedure TForm1.Edit2Change(Sender: TObject);
begin
if a1=1 then
  begin
  SQLQuery1.Close;
  SQLQuery1.SQL.Clear;
  if ((sender as TEdit).Name = 'Edit1') then
     begin
       SQLQuery1.SQL.Add('Select title as "Название", author as "Автор", published as "Дата издания", stock as "Количество"  from books WHERE author LIKE :authSearch;');
       SQLQuery1.params.parambyname('authSearch').asstring := edit1.Text + '%';
     end;
    if ((sender as TEdit).Name = 'Edit2') then
     begin
       SQLQuery1.SQL.Add('Select title as "Название", author as "Автор", published as "Дата издания", stock as "Количество"  from books WHERE title LIKE :titleSearch;');
       SQLQuery1.params.parambyname('titleSearch').asstring := edit2.Text+'%';
     end;
  SQLQuery1.Open;
end;

if a2=1 then
  begin
  SQLQuery1.Close;
  SQLQuery1.SQL.Clear;
  if ((sender as TEdit).Name = 'Edit1') then
     begin
       SQLQuery1.SQL.Add('Select firstname as "Имя", lastname as "Фамилия" from members WHERE firstname LIKE :fn;');
       SQLQuery1.params.parambyname('fn').asstring := edit1.Text + '%';
     end;
    if ((sender as TEdit).Name = 'Edit2') then
     begin
       SQLQuery1.SQL.Add('Select firstname as "Имя", lastname as "Фамилия" from members WHERE lastname LIKE :ln;');
       SQLQuery1.params.parambyname('ln').asstring := edit2.Text+'%';
     end;
  SQLQuery1.Open;
end;

if a3=1 then
  begin
  SQLQuery1.Close;
  SQLQuery1.SQL.Clear;
  if ((sender as TEdit).Name = 'Edit1') then
     begin
       SQLQuery1.SQL.Add('members.firstname AS "Имя", members.lastname AS "Фамилия", books.title AS "Книга", borrowings.borrowdate AS "Когда взял", borrowings.returndate AS "Когда отдать" from borrowings WHERE members.firstname LIKE :fn;');
       SQLQuery1.params.parambyname('fn').asstring := edit1.Text + '%';
     end;
    if ((sender as TEdit).Name = 'Edit2') then
     begin
       SQLQuery1.SQL.Add('members.firstname AS "Имя", members.lastname AS "Фамилия", books.title AS "Книга", borrowings.borrowdate AS "Когда взял", borrowings.returndate AS "Когда отдать" from borrowings WHERE members.firstname LIKE :ln;');
       SQLQuery1.params.parambyname('ln').asstring := edit2.Text+'%';
     end;
  SQLQuery1.Open;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
MySQL57Connection1.Connected:=true;
if (not MySQL57Connection1.Connected) then button1.Visible:=true;
end;


end.


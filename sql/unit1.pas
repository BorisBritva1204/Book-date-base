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
    MySQL57Connection1: TMySQL57Connection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
procedure TForm1.Button1Click(Sender: TObject);
begin
SQLQuery1.Close;
SQLQuery1.SQL.Clear;
SQLQuery1.SQL.Add('Select title as "Название", author as "Автор", published as "Дата издания", stock as "Количество" from books;');
SQLQuery1.Open;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin                                          //members borrowings
SQLQuery1.Close;
SQLQuery1.SQL.Clear;
SQLQuery1.SQL.Add('Select firstname as "Имя", lastname as "Фамилия" from members;');
SQLQuery1.Open;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
SQLQuery1.Close;
SQLQuery1.SQL.Clear;
SQLQuery1.SQL.Add('SELECT members.firstname AS "", members.lastname AS "", books.title AS "", borrowings.borrowdate AS "", borrowings.returndate AS "", FROM borrowings JOIN books ON borrowings.bookid=books.bookid JOIN members ON members.memberid=borrowings.memberid');
SQLQuery1.Open;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;


end.


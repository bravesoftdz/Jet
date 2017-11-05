unit DBUtil;

interface

uses
  AppData, SysUtils;

procedure SetClientIdentity;
procedure SetProjectIdentity;
procedure SetSupplierIdentity;
procedure SetItemIdentity;
procedure SetExpenseIdentity;

implementation

procedure SetClientIdentity;
var
  sqlStr: string;
  id: integer;
begin
  with dmApplication.fdqApp do
  begin
    try
      sqlStr := 'SELECT MAX(CLIENT_ID) FROM CLIENT';
      SQL.Text := sqlStr;
      Open;

      // get the result
      id := Fields[0].Value;

      // set the identity
      Close;
      sqlStr := 'ALTER TABLE CLIENT ALTER CLIENT_ID RESTART WITH ' + IntToStr(id);
      SQL.Text := sqlStr;
      ExecSQL;
    finally
      Close;
    end;
  end;
end;

procedure SetProjectIdentity;
var
  sqlStr: string;
  id: integer;
begin
  with dmApplication.fdqApp do
  begin
    try
      sqlStr := 'SELECT MAX(PROJECT_ID) FROM PROJECT';
      SQL.Text := sqlStr;
      Open;

      // get the result
      id := Fields[0].Value;

      // set the identity
      Close;
      sqlStr := 'ALTER TABLE PROJECT ALTER PROJECT_ID RESTART WITH ' + IntToStr(id);
      SQL.Text := sqlStr;
      ExecSQL;
    finally
      Close;
    end;
  end;
end;

procedure SetSupplierIdentity;
var
  sqlStr: string;
  id: integer;
begin
  with dmApplication.fdqApp do
  begin
    try
      sqlStr := 'SELECT MAX(SUPPLIER_ID) FROM SUPPLIER';
      SQL.Text := sqlStr;
      Open;

      // get the result
      id := Fields[0].Value;

      // set the identity
      Close;
      sqlStr := 'ALTER TABLE SUPPLIER ALTER SUPPLIER_ID RESTART WITH ' + IntToStr(id);
      SQL.Text := sqlStr;
      ExecSQL;
    finally
      Close;
    end;
  end;
end;

procedure SetItemIdentity;
var
  sqlStr: string;
  id: integer;
begin
  with dmApplication.fdqApp do
  begin
    try
      sqlStr := 'SELECT MAX(ITEM_ID) FROM ITEM';
      SQL.Text := sqlStr;
      Open;

      // get the result
      id := Fields[0].Value;

      // set the identity
      Close;
      sqlStr := 'ALTER TABLE ITEM ALTER ITEM_ID RESTART WITH ' + IntToStr(id);
      SQL.Text := sqlStr;
      ExecSQL;
    finally
      Close;
    end;
  end;
end;

procedure SetExpenseIdentity;
var
  sqlStr: string;
  id: integer;
begin
  with dmApplication.fdqApp do
  begin
    try
      sqlStr := 'SELECT MAX(EXPENSE_ENTRY_ID) FROM EXPENSE';
      SQL.Text := sqlStr;
      Open;

      // get the result
      id := Fields[0].Value;

      // set the identity
      Close;
      sqlStr := 'ALTER TABLE EXPENSE ALTER EXPENSE_ENTRY_ID RESTART WITH ' + IntToStr(id);
      SQL.Text := sqlStr;
      ExecSQL;
    finally
      Close;
    end;
  end;
end;

end.
